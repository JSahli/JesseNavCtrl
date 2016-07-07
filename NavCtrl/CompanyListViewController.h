//
//  CompanyListViewController.h
//  NavCtrl
//
//  Created by Jesse Sahli on 7/7/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Company.h"
#import "AddEditViewController.h"
#import "DBManager.h"
#import "ProductListViewController.h"

@interface CompanyListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSMutableArray *companyList;
@property (nonatomic, retain) ProductListViewController * productListViewController;
@property (nonatomic, retain) AddEditViewController *addEditViewController;




@property (retain, nonatomic) IBOutlet UIButton *undoButtonOutlet;

@property (retain, nonatomic) IBOutlet UIButton *redoButtonOutlet;
@property (retain, nonatomic) IBOutlet UIImageView *emptyImage;
@property (retain, nonatomic) IBOutlet UILabel *emptyLabel;
@property (retain, nonatomic) IBOutlet UIButton *addButtonOutlet;
- (IBAction)emptyAddButtonAction:(id)sender;
- (IBAction)redoButtonAction:(id)sender;
- (IBAction)undoButtonAction:(id)sender;

@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
