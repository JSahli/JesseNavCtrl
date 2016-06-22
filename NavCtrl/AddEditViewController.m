//
//  AddEditViewController.m
//  NavCtrl
//
//  Created by Jesse Sahli on 6/16/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "AddEditViewController.h"

@interface AddEditViewController ()

@end

@implementation AddEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    DAO *dataManager = [DAO dataManager];
    
    UIBarButtonItem *saveBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveCompany)];
    self.navigationItem.rightBarButtonItem = saveBarButton;
    
//    self.companyTextField.backgroundColor = [UIColor clearColor];
//    CALayer *border = [CALayer layer];
//    CGFloat borderWidth = 2;
//    border.borderColor = [UIColor darkGrayColor].CGColor;
//    border.frame = CGRectMake(0, self.companyTextField.frame.size.height - borderWidth, self.companyTextField.frame.size.width, self.companyTextField.frame.size.height);
//    border.borderWidth = borderWidth;
//    [self.companyTextField.layer addSublayer:border];
//    self.companyTextField.layer.masksToBounds = YES;
    
    if (self.editMode) {
        self.companyTextField.text = dataManager.companyToEdit.companyName;
        self.imageTextField.text = dataManager.companyToEdit.companyImageString;
        self.stockSymbolTextField.text = dataManager.companyToEdit.stockSymbol;
    }
    
    if (!self.editMode){
        self.imageTextField.text = @"Sunflower.gif";
    }
    
    
}

- (void)saveCompany {
    DAO *dataManager = [DAO dataManager];
    
    if (!self.editMode) {
        [dataManager addCompanyWithName:self.companyTextField.text imagePath:self.imageTextField.text stockSymbol:self.stockSymbolTextField.text];
    }
    
    if (self.editMode) {
        dataManager.companyToEdit.companyName = self.companyTextField.text;
        dataManager.companyToEdit.companyImageString = self.imageTextField.text;
        dataManager.companyToEdit.stockSymbol = self.stockSymbolTextField.text;
        dataManager.companyToEdit.companyImage = [UIImage imageNamed:self.imageTextField.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_companyTextField release];
    [_imageTextField release];
    [_stockSymbolTextField release];
    [super dealloc];
}
@end
