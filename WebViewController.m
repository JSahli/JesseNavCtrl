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
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    WKWebView *webView = [[WKWebView alloc]initWithFrame:[[UIScreen mainScreen]bounds] configuration:theConfiguration];
    NSLog(@"YO I DUN LOADED");
    
    if([self.title isEqualToString:@"MacBook Pro"]){
        
        NSURL *productURL = [NSURL URLWithString:@"https://www.apple.com/macbook/"];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:productURL];
        [webView loadRequest:urlRequest];
        [self.view addSubview:webView];
    }
    
    else if([self.title isEqualToString:@"iPhone 6"]){
        
        NSURL *productURL = [NSURL URLWithString:@"http://www.apple.com/iphone/"];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:productURL];
        [webView loadRequest:urlRequest];
        [self.view addSubview:webView];
    }
    
    else if([self.title isEqualToString:@"iMac"]){
        
        NSURL *productURL = [NSURL URLWithString:@"http://www.apple.com/imac/"];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:productURL];
        [webView loadRequest:urlRequest];
        [self.view addSubview:webView];
    }
    else if([self.title isEqualToString:@"ChromeBook"]){
        
        NSURL *productURL = [NSURL URLWithString:@"https://www.google.com/chromebook/"];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:productURL];
        [webView loadRequest:urlRequest];
        [self.view addSubview:webView];
    }
    
    else if([self.title isEqualToString:@"Nexus 6P"]){
        
        NSURL *productURL = [NSURL URLWithString:@"https://store.google.com/product/nexus_6p"];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:productURL];
        [webView loadRequest:urlRequest];
        [self.view addSubview:webView];
    }
    else if([self.title isEqualToString:@"Pixel C"]){
        
        NSURL *productURL= [NSURL URLWithString:@"https://pixel.google.com/pixel-c/"];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:productURL];
        [webView loadRequest:urlRequest];
        [self.view addSubview:webView];
    }
    
    else if([self.title isEqualToString:@"Model S"]){
        
        NSURL *productURL = [NSURL URLWithString:@"https://www.teslamotors.com/models"];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:productURL];
        [webView loadRequest:urlRequest];
        [self.view addSubview:webView];
    }
    else if([self.title isEqualToString:@"Model X"]){
        
        NSURL *productURL= [NSURL URLWithString:@"https://www.teslamotors.com/modelx"];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:productURL];
        [webView loadRequest:urlRequest];
        [self.view addSubview:webView];
    }
    
    else if([self.title isEqualToString:@"Model 3"]){
        
        NSURL *productURL = [NSURL URLWithString:@"https://www.teslamotors.com/model3"];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:productURL];
        [webView loadRequest:urlRequest];
        [self.view addSubview:webView];
    }





    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
