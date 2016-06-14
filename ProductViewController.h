//
//  ProductViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@interface ProductViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) NSMutableArray *products;

@property (nonatomic, retain) WebViewController * webViewController;

@property (nonatomic, retain) NSMutableArray *appleProducts;
@property (nonatomic, retain) NSMutableArray *googleProducts;
@property (nonatomic, retain) NSMutableArray *teslaProducts;
@property (nonatomic, retain) NSMutableArray *twitterProducts;


@end
