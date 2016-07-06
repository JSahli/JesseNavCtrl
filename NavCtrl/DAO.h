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
#import <CoreData/CoreData.h>
#import "ManagedCompany.h"
#import "ManagedProduct.h"

@interface DAO : NSObject

@property(nonatomic, retain) NSMutableArray<Company*> *companyArray;
@property(nonatomic, retain) NSMutableArray<ManagedCompany*> *managedCompanyArray;
@property(nonatomic, retain) NSMutableDictionary *stockDictionary;
@property(nonatomic, retain) Company *companyToEdit;
@property(nonatomic, retain) Company *companyToAppend;
@property(nonatomic, retain) Product *productToEdit;
//@property(nonatomic, retain) DBManager *sqlManager;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

-(void)deleteProduct: (Product*) productToDelete inCompany: (Company*) company;
-(void)deleteCompany: (Company*) companyToDelete;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
+ (id) dataManager;

-(void)addCompanyWithName: (NSString*) name
                imagePath: (NSString*) imageString
              stockSymbol: (NSString*) symbol;

-(void)addProductWithName: (NSString*) name
                    image: (NSString*) imageString
                      URL: (NSString*) urlString
                toCompany: (Company*) company;

-(void)editCompany: (Company*) companyToEdit
           newName: (NSString*) name
          newImage: (NSString*) imageString
         newSymbol: (NSString*) stockSymbol;

-(void)editProduct: (Product*) productToEdit
         inCompany: (Company*) company
           newName: (NSString*) name
          newImage: (NSString*) imageString
            newURL: (NSString*) urlString;






@end