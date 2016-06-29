//
//  WebViewController.m
//  NavCtrl
//
//  Created by Jesse Sahli on 6/14/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.product.productName;
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    WKWebView *webView = [[WKWebView alloc]initWithFrame:[[UIScreen mainScreen]bounds] configuration:theConfiguration];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.product.productURL];
    [webView loadRequest:urlRequest];
    [self.view addSubview:webView];
    
    [theConfiguration release];
    [webView release];
    [urlRequest release];
    
    UIBarButtonItem *editBarButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editProduct)];
    self.navigationItem.rightBarButtonItem = editBarButton;


    NSLog(@"LOADED");
    
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) editProduct {
    self.productAddEditVC = [[ProductAddEditViewController alloc]init];
    self.productAddEditVC.editMode = YES;
    [self.navigationController pushViewController:self.productAddEditVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
