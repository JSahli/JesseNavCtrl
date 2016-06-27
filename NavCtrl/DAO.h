//
//  DAO.h
//  NavCtrl
//
//  Created by Jesse Sahli on 6/15/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"
#import "DBManager.h"


@interface DAO : NSObject

@property(nonatomic, retain) NSMutableArray<Company*> *companyArray;
@property(nonatomic, retain) NSMutableDictionary *stockDictionary;
@property(nonatomic, retain) Company *companyToEdit;
@property(nonatomic, retain) Company *companyToAppend;
@property(nonatomic, retain) Product *productToEdit;
@property(nonatomic, retain) DBManager *sqlManager;

+ (id) dataManager;
-(void)addCompanyWithName: (NSString*) name
                imagePath: (NSString*) imageString
              stockSymbol: (NSString*) symbol;





@end