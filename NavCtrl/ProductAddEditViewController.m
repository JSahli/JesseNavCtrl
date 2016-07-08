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
        self.title = @"Edit Product";
    }
    if (!self.editMode){
        self.imageTextField.text = @"Sunflower.gif";
        [self.deleteProductOutlet setHidden:YES];
        self.title = @"Add Product";
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveProduct {
    DAO *dataManager = [DAO dataManager];
    
    if (!self.editMode) {

//        [dataManager.companyToAppend addProductWithName:self.nameTextField.text urlWithString:self.urlTextField.text imageWithString:self.imageTextField.text];
        
        [dataManager addProductWithName:self.nameTextField.text image:self.imageTextField.text URL:self.urlTextField.text toCompany:dataManager.companyToAppend];
      
//        [dataManager.sqlManager addProductWithName:self.nameTextField.text urlString:self.urlTextField.text imageString:self.imageTextField.text forCompany:dataManager.companyToAppend];

    }
    
    if (self.editMode) {
        [dataManager editProduct:dataManager.productToEdit inCompany:dataManager.companyToAppend newName:self.nameTextField.text newImage:self.imageTextField.text newURL:self.urlTextField.text];
        
        dataManager.productToEdit.productURL = [NSURL URLWithString:self.urlTextField.text];
        dataManager.productToEdit.productImage = [UIImage imageNamed:self.imageTextField.text];
        
        //FOR UPDATING SQLITE DATABASE
//        [dataManager.sqlManager editProduct:dataManager.productToEdit];
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
- (IBAction)deleteProductButton:(id)sender {
    DAO *dataManager = [DAO dataManager];
    [dataManager deleteProduct:dataManager.productToEdit inCompany:dataManager.companyToAppend];
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];

}

- (void)dealloc {
    [_nameTextField release];
    [_urlTextField release];
    [_imageTextField release];
    [_deleteProductOutlet release];
    [super dealloc];
}

@end
