//
//  WebViewController.h
//  NavCtrl
//
//  Created by Jesse Sahli on 6/14/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "DAO.h"
#import "Product.h"
#import "ProductAddEditViewController.h"

@interface WebViewController : UIViewController

@property (nonatomic, retain) Product *product;
@property (nonatomic, retain) ProductAddEditViewController *productAddEditVC;

@end
