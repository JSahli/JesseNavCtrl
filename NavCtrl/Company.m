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
        self.companyName = company;
        self.companyImage = [UIImage imageNamed:imageName];
        self.companyImageString = imageName;
        self.products = productArray;
        self.stockSymbol = symbol;
    }
    return self;
}

- (id)initWithName: (NSString*) company
         imageName: (NSString*) imageName
       stockSymbol: (NSString*) symbol
{
    self = [super init];
    if (self) {
        self.companyName = company;
        self.companyImageString = imageName;
        self.companyImage = [UIImage imageNamed:imageName];
        self.stockSymbol = symbol;
    }
    return self;
}

-(void)addProductWithName: (NSString*) name urlWithString: (NSString*) url imageWithString: (NSString*) image {
    
    Product *newProduct = [[Product alloc]initWithName:name URL:url ImageString:image];
    if (self.products != nil){
        [self.products addObject:newProduct];
    } else {
        self.products = [[NSMutableArray alloc]initWithObjects:newProduct, nil];
    }
    
}

//NEW init for SQLite
- (id)initWithName: (NSString*) company
       imageString: (NSString*) imageName
       stockSymbol: (NSString*) symbol
                id: (int)companyID {
    
    if (self) {
        self.companyName = company;
        self.companyImageString = imageName;
        self.companyImage = [UIImage imageNamed:imageName];
        self.stockSymbol = symbol;
        self.companyId = companyID;
    }
    return self;
    
}

@end
