//
//  DBManager.h
//  NavCtrl
//
//  Created by Jesse Sahli on 6/24/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"
#import "sqlite3.h"

@interface DBManager : NSObject

@property (nonatomic, retain) NSMutableArray *resultsArray;

-(id)initWithDatabaseFilename:(NSString*)dbFilename;
-(void)pullDataFromSQL;
-(void)addCompanyWithName:(NSString*)name
              stockSymbol:(NSString*)stock
              imageString:(NSString*)image;

-(void)addProductWithName:(NSString*)name
                urlString:(NSString*)url
              imageString:(NSString*)image
               forCompany: (Company*)company;

-(void)deleteCompany: (int) companyId;
-(void)deleteProduct: (int) productID;
-(void)editCompany:(Company*) company;
-(void)editProduct:(Product*) product;
-(void)rearrangeCompanyFrom:(int) fromIndex to:(int) toIndex;

@end
