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
        self.productName = name;
        self.productURL = [NSURL URLWithString:url];
        self.productURLString = url;
        self.productImageString = imageName;
        self.productImage = [UIImage imageNamed:imageName];
    }
    return self;
}

@end
