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
           andURL: (NSURL*) url{
    self = [super init];
    if (self) {
        self.productName = name;
        self.productURL = url;
    }
    return self;
}

@end
