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
       andProducts: (NSMutableArray*) productArray {
    
    self = [super init];
    if (self) {
        self.companyName = company;
        self.products = productArray;
    }
    return self;
}


@end
