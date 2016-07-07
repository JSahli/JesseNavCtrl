//
//  ProductListViewController.h
//  NavCtrl
//
//  Created by Jesse Sahli on 7/6/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "DAO.h"
#import "Product.h"
#import "ProductAddEditViewController.h"

@interface ProductListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UITableView *tableView;

@property (retain, nonatomic) IBOutlet UIImageView *companyImageView;

@property (retain, nonatomic) IBOutlet UILabel *companyLabel;

@property (nonatomic, retain) NSMutableArray *products;
@property (nonatomic, retain) WebViewController * webViewController;
@property (nonatomic, retain) Company *company;
@property (nonatomic, retain) ProductAddEditViewController *productAddEditVC;

@end
