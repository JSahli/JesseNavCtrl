//
//  ProductViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "DAO.h"
#import "Product.h"

@interface ProductViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) NSMutableArray *products;
@property (nonatomic, retain) WebViewController * webViewController;
@property (nonatomic, retain) Company *company;




@end
