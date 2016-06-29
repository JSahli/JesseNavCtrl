//
//  Company.m
//  NavCtrl
//
//  Created by Jesse Sahli on 6/14/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Company.h"

@implementation Company

- (id)initWithName: (NSString*) company
          products: (NSMutableArray*) productArray
       imageString: (NSString*) imageName
       stockSymbol: (NSString*) symbol {
    
    self = [super init];
    if (self) {
        _companyName = [company retain];
        _companyImage = [[UIImage imageNamed:imageName] retain];
        _companyImageString = [imageName retain];
        _products = [productArray retain];
        _stockSymbol = [symbol retain];
    }
    return self;
}

- (id)initWithName: (NSString*) company
         imageName: (NSString*) imageName
       stockSymbol: (NSString*) symbol
{
    self = [super init];
    if (self) {
        _companyName = [company retain];
        _companyImageString = [imageName retain];
        _companyImage = [[UIImage imageNamed:imageName] retain];
        _stockSymbol = [symbol retain];
        _products = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addProductWithName: (NSString*) name urlWithString: (NSString*) url imageWithString: (NSString*) image {
    
    Product *newProduct = [[Product alloc]initWithName:name URL:url ImageString:image];
    if (self.products != nil){
        [self.products addObject:newProduct];
    } else {
        _products = [[NSMutableArray alloc]initWithObjects:newProduct, nil];
    }
    
}

//NEW init for SQLite
- (id)initWithName: (NSString*) company
       imageString: (NSString*) imageName
       stockSymbol: (NSString*) symbol
                id: (int)companyID {
    
    if (self) {
        _companyName = [company retain];
        _companyImageString = [imageName retain];
        _companyImage = [[UIImage imageNamed:imageName] retain];
        _stockSymbol = [symbol retain];
        _companyId = companyID;
        _products = [[NSMutableArray alloc] init];

    }
    return self;
    
}

-(void)dealloc{
    
    [_companyName release];
    [_companyImageString release];
    [_companyImage release];
    [_stockSymbol release];
    [_products release];
    [super dealloc];
}

@end
