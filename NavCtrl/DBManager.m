//
//  DBManager.m
//  NavCtrl
//
//  Created by Jesse Sahli on 6/24/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "DBManager.h"

@interface DBManager()

@property (nonatomic, retain) NSString *documentsDirectory;
@property (nonatomic, retain) NSString *databaseFilename;
//@property sqlite3 *sqlDatabase; 

-(void)copyDatabaseIntoDocumentsDirectory;

@end

@implementation DBManager {
    sqlite3 *sqlDB;
}


-(id)initWithDatabaseFilename:(NSString*)dbFilename;
{
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        [_documentsDirectory = [paths objectAtIndex:0] retain];
        
        [_databaseFilename = dbFilename retain];;
        [self copyDatabaseIntoDocumentsDirectory];
        
    }
    return self;
}

-(void)copyDatabaseIntoDocumentsDirectory {
    
    NSString *destinationPath = [self.documentsDirectory stringByAppendingPathComponent:self.databaseFilename];
    //Checking if the database file exists in the documents directory
    if (![[NSFileManager defaultManager] fileExistsAtPath:destinationPath]) {
        NSString *sourcePath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:self.databaseFilename];
        NSError *error;
        [[NSFileManager defaultManager]copyItemAtPath:sourcePath toPath:destinationPath error:&error];
        
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }
}

-(void)pullDataFromSQL {
//    sqlite3 *sqlDB;
    NSString *databasePathNS = [self.documentsDirectory stringByAppendingPathComponent:self.databaseFilename];
    const char *databasePath = [databasePathNS UTF8String];
    if (self.resultsArray != nil) {
        [self.resultsArray removeAllObjects];
        self.resultsArray = nil;
    }
    self.resultsArray = [[NSMutableArray alloc]init];
    if (sqlite3_open(databasePath, &sqlDB)== SQLITE_OK)
    {
        const char *sql_stmt = "SELECT * FROM Company";
        sqlite3_stmt *statement;
        int sql_status_code = sqlite3_prepare_v2(sqlDB, sql_stmt, -1, &statement, nil);
        NSLog(@"%d",sql_status_code);
        if(sql_status_code == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                int companyNumber = sqlite3_column_int(statement, 0);
//                NSNumber *companyID = [NSNumber numberWithInt:companyNumber];
                NSString *companyName =
                [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement, 1) ];
                NSString *companySymbol =
                [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement, 2) ];
                NSString *companyImage =
                [NSString stringWithUTF8String: (char*)sqlite3_column_text(statement, 3) ];
                Company *company = [[Company alloc]initWithName:companyName imageString:companyImage stockSymbol:companySymbol id:companyNumber];
                [self.resultsArray addObject:company];
                
                ////TO EDIT
                
                
                NSString *string =  [NSString stringWithFormat:@"SELECT * FROM product where product.company_Id == %d", companyNumber];
                const char *sql_stmt_prod = [string UTF8String];
                sqlite3_stmt *statementProduct;
                if(sqlite3_prepare_v2(sqlDB, sql_stmt_prod, -1, &statementProduct, nil) == SQLITE_OK) {
                    while (sqlite3_step(statementProduct) == SQLITE_ROW) {
                        int productNumber = sqlite3_column_int(statementProduct, 4);
//                        NSNumber *productID = [NSNumber numberWithInt:productNumber];
                        
                        NSString *productName =
                        [NSString stringWithUTF8String: (char*)sqlite3_column_text(statementProduct, 1) ];
                             
                        
                        NSString *productURL =
                        [NSString stringWithUTF8String: (char*)sqlite3_column_text(statementProduct, 2) ];
                        NSString *productImage =
                        [NSString stringWithUTF8String: (char*)sqlite3_column_text(statementProduct, 3) ];
                        Product *product = [[Product alloc]initWithName:productName URL:productURL ImageString:productImage id:productNumber cmpnyId:companyNumber];
                        

//                        [productName release];
//                        [productURL release];
                        NSLog(@"RETAIN COUNT IS %lu", (unsigned long)[product retainCount]);

//                        [productImage release];
                        [company.products addObject:product];
                         NSLog(@"RETAIN COUNT IS %lu", (unsigned long)[product retainCount]);
//                        [product release]; WILL CRASH IF I RELEASE HERE
                        [product release];
                        NSLog(@"RETAIN COUNT IS %lu", (unsigned long)[product retainCount]);
//                        [product release];
                       
                        // [productName release];
                       // [productURL release];
                       // [productImage release];
                                            }
                    [company release];
                }
            }
        } else {
            NSLog(@"error loading from SQL database");
        }
    }
}

-(void)addCompanyWithName:(NSString*)name
              stockSymbol:(NSString*)stock
              imageString:(NSString*)image {
    
    char * error;
    NSString *querySQL = [NSString stringWithFormat:@"INSERT INTO Company (name, stockSymbol, imageString) VALUES ('%@', '%@', '%@')", name, stock, image];
//    int sqlStatus = sqlite3_exec(sqlDB, [querySQL UTF8String], NULL, NULL, &error);
//    NSLog(@"sqlStatus is %d",sqlStatus);sqlStatus = SQLITE_OK
    if (sqlite3_exec(sqlDB, [querySQL UTF8String], NULL, NULL, &error) == SQLITE_OK) {
        NSLog(@"company added to database");
    } else {
        NSLog(@"error adding company");
    }
    Company *newCompany = [[Company alloc]initWithName:name imageName:image stockSymbol:stock];
    NSInteger lastRow = sqlite3_last_insert_rowid(sqlDB);
    newCompany.companyId = (int)lastRow;
    [self.resultsArray addObject:newCompany];
}

-(void)addProductWithName:(NSString*)name
                urlString:(NSString*)url
              imageString:(NSString*)image
               forCompany: (Company*)company {
    char *error;
    NSString *querySQL = [NSString stringWithFormat:@"INSERT INTO product (name, urlString, imageString, company_id) VALUES ('%@', '%@', '%@', '%d')", name, url, image, company.companyId];
    
    if (sqlite3_exec(sqlDB, [querySQL UTF8String], NULL, NULL, &error) == SQLITE_OK){
        NSLog(@"product added to database");
    } else {
        NSLog(@"error with adding product");
    }
    Product *newProduct = [[Product alloc]initWithName:name URL:url ImageString:image];
    NSInteger lastRow = sqlite3_last_insert_rowid(sqlDB);
    newProduct.productId = (int)lastRow;
    [company.products addObject:newProduct];
}

-(void)deleteCompany: (int) companyId {
    
    char * error;
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM Company WHERE id = '%d'", companyId];
    if(sqlite3_exec(sqlDB, [deleteQuery UTF8String], NULL, NULL, &error) == SQLITE_OK){
        NSLog(@"company with id:%d deleted from database", companyId);
    } else {
        NSLog(@"error deleting company");
    }
}

-(void)deleteProduct: (int) productID{
    
    char * error;
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM product WHERE id = '%d'", productID];
    if(sqlite3_exec(sqlDB, [deleteQuery UTF8String], NULL, NULL, &error) == SQLITE_OK){
        NSLog(@"product with id:%d deleted from database", productID);
    } else {
        NSLog(@"error deleting product");
    }
}

-(void)editCompany:(Company*) company {
    
    char * error;
    NSString *editQuery = [NSString stringWithFormat:@"UPDATE Company SET name = '%@', stockSymbol = '%@', imageString = '%@' Where id = '%d'", company.companyName, company.stockSymbol, company.companyImageString, company.companyId];
    if (sqlite3_exec(sqlDB, [editQuery UTF8String], NULL, NULL, &error)) {
        NSLog(@"company:%@ updated in database", company.companyName);
    } else {
        NSLog(@"error updating company in database");
    }
}

-(void)editProduct:(Product*) product {
    
    char * error;
    NSString *editQuery = [NSString stringWithFormat:@"UPDATE product SET name = '%@', urlString = '%@', imageString = '%@' Where id = '%d'", product.productName, product.productURL, product.productImageString, product.productId];
    if (sqlite3_exec(sqlDB, [editQuery UTF8String], NULL, NULL, &error)) {
        NSLog(@"product:%@ updated in database", product.productName);
    } else {
        NSLog(@"error updating product in database");
    }
}

-(void)rearrangeCompanyFrom:(int) fromIndex to:(int) toIndex {
    
    char * error;
    NSString *replaceQuery = [NSString stringWithFormat:@"UPDATE Company SET id = '%d' Where id = '%d'", toIndex, fromIndex];
    if (sqlite3_exec(sqlDB, [replaceQuery UTF8String], NULL, NULL, &error)) {
        NSLog(@"Company moved");
    } else {
        NSLog(@"error moving company in database");
    }

}


- (void)dealloc{
    
    [_resultsArray release];
    [_databaseFilename release];
    [_documentsDirectory release];
    [super dealloc];
}









@end
