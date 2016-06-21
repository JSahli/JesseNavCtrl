//
//  ProductAddEditViewController.h
//  NavCtrl
//
//  Created by Jesse Sahli on 6/21/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"
#import "DAO.h"

@interface ProductAddEditViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *nameTextField;
@property (retain, nonatomic) IBOutlet UITextField *urlTextField;
@property (retain, nonatomic) IBOutlet UITextField *imageTextField;
@property (nonatomic) BOOL editMode;
@end
