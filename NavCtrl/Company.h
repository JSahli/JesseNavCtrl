//
//  Company.h
//  NavCtrl
//
//  Created by Jesse Sahli on 6/14/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Company : NSObject

//@property NSMutableArray<Product *> *products; Should I make it specifically product objects?
@property (nonatomic, retain) NSString *companyName;
@property (nonatomic, retain) NSMutableArray<Product*> *products;
@property (nonatomic, retain) NSString *stockSymbol;
@property (nonatomic, retain) NSString *stockPrice;
@property (nonatomic, retain) UIImage *companyImage;
@property (nonatomic, retain) NSString *companyImageString;
@property int companyId;

- (id)initWithName: (NSString*) company
          products: (NSMutableArray*) productArray
       imageString: (NSString*) imageName
       stockSymbol: (NSString*) symbol;

- (id)initWithName: (NSString*) company
         imageName: (NSString*) imageName
       stockSymbol: (NSString*) symbol;

-(void)addProductWithName: (NSString*) name urlWithString: (NSString*) url imageWithString: (NSString*) image;

- (id)initWithName: (NSString*) company
       imageString: (NSString*) imageName
       stockSymbol: (NSString*) symbol
                id: (int)companyID;

@end
