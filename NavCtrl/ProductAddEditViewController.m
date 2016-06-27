//
//  ProductAddEditViewController.m
//  NavCtrl
//
//  Created by Jesse Sahli on 6/21/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "ProductAddEditViewController.h"

@interface ProductAddEditViewController ()

@end

@implementation ProductAddEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *saveBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveProduct)];
    self.navigationItem.rightBarButtonItem = saveBarButton;
    DAO *dataManager = [DAO dataManager];
    if (self.editMode){
        self.nameTextField.text = dataManager.productToEdit.productName;
        self.urlTextField.text = dataManager.productToEdit.productURLString;
        self.imageTextField.text = dataManager.productToEdit.productImageString;
    }
    if (!self.editMode){
        self.imageTextField.text = @"Sunflower.gif";
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveProduct {
    DAO *dataManager = [DAO dataManager];
    
    if (!self.editMode) {

//        [dataManager.companyToAppend addProductWithName:self.nameTextField.text urlWithString:self.urlTextField.text imageWithString:self.imageTextField.text]; REMOVE THIS IF IT WORKS WITH SQL
        
        [dataManager.sqlManager addProductWithName:self.nameTextField.text urlString:self.urlTextField.text imageString:self.imageTextField.text forCompany:dataManager.companyToAppend];

    }
    
    if (self.editMode) {
        dataManager.productToEdit.productName = self.nameTextField.text;
        dataManager.productToEdit.productURL = [NSURL URLWithString:self.urlTextField.text];
        dataManager.productToEdit.productURLString = self.urlTextField.text;
        dataManager.productToEdit.productImage = [UIImage imageNamed:self.imageTextField.text];
        [dataManager.sqlManager editProduct:dataManager.productToEdit];
    }

    //array of the existing view controllers on the nav control
    NSLog(@"%@", [self.navigationController.viewControllers description]);

    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
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
    [_nameTextField release];
    [_urlTextField release];
    [_imageTextField release];
    [super dealloc];
}
@end
