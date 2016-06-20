//
//  AddEditViewController.h
//  NavCtrl
//
//  Created by Jesse Sahli on 6/16/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Company.h"

@interface AddEditViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *companyTextField;
@property (retain, nonatomic) IBOutlet UITextField *imageTextField;

@property (nonatomic) BOOL editMode;

@end
