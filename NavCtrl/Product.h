//
//  Product.h
//  NavCtrl
//
//  Created by Jesse Sahli on 6/14/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, retain) NSString *productName;
@property (nonatomic,retain) NSURL *productURL;

-(id)initWithName: (NSString*) name
           andURL: (NSURL*) url;

@end
