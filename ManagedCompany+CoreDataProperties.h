//
//  ManagedCompany+CoreDataProperties.h
//  NavCtrl
//
//  Created by Jesse Sahli on 7/5/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ManagedCompany.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagedCompany (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *companyName;
@property (nullable, nonatomic, retain) NSString *companyImageString;
@property (nullable, nonatomic, retain) NSString *stockPrice;
@property (nullable, nonatomic, retain) NSString *stockSymbol;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *products;

@end

@interface ManagedCompany (CoreDataGeneratedAccessors)

- (void)addProductsObject:(NSManagedObject *)value;
- (void)removeProductsObject:(NSManagedObject *)value;
- (void)addProducts:(NSSet<NSManagedObject *> *)values;
- (void)removeProducts:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
