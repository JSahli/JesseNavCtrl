//
//  Product.m
//  NavCtrl
//
//  Created by Jesse Sahli on 6/14/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Product.h"

@implementation Product

-(id)initWithName: (NSString*) name
              URL: (NSString*) url
      ImageString: (NSString*) imageName {
    
    self = [super init];
    if (self) {
        _productName = [name retain];
        _productURL = [[NSURL URLWithString:url] retain];
        _productURLString = [url retain];
        _productImageString = [imageName retain];
        _productImage = [[UIImage imageNamed:imageName] retain];
    }
    return self;
}

//NEW init for SQLite

-(id)initWithName: (NSString*) name
              URL: (NSString*) url
      ImageString: (NSString*) imageName
               id: (int) productID
          cmpnyId: (int) companyID{
    
    self = [super init];
    if (self) {
        _productName = [name retain];
        _productURL = [[NSURL URLWithString:url] retain];
        _productURLString = [url retain];
        _productImageString = [imageName retain];
        _productImage = [[UIImage imageNamed:imageName] retain];
        _productId = productID;
        _companyId = companyID;
    }
    return self;
}

-(void)dealloc {
    
    [_productName release];
    [_productURL release];
    [_productImage release];
    [_productURLString release];
    [_productImageString release];
    
    [super dealloc];
}



@end
