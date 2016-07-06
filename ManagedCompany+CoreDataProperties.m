//
//  ManagedCompany+CoreDataProperties.m
//  NavCtrl
//
//  Created by Jesse Sahli on 7/5/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ManagedCompany+CoreDataProperties.h"

@implementation ManagedCompany (CoreDataProperties)

@dynamic companyName;
@dynamic companyImageString;
@dynamic stockPrice;
@dynamic stockSymbol;
@dynamic products;

@end