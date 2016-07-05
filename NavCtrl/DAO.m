//
//  DAO.m
//  NavCtrl
//
//  Created by Jesse Sahli on 6/15/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "DAO.h"


static DAO *dataManager = nil;

@implementation DAO

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.sahlitude.coreDataTemplate" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"NavCtrl.sqlite"];
    NSLog(@"%@",storeURL);
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


+ (id)dataManager {
    @synchronized(self) {
        if(dataManager == nil)
            dataManager = [[super alloc] init];
    }
    return dataManager;
}



-(id)init {
    
if (self = [super init]) {
    
//    _sqlManager = [[[DBManager alloc]initWithDatabaseFilename:@"NavDatabase.db"] retain];
//    [self.sqlManager pullDataFromSQL];
//    _companyArray = [self.sqlManager.resultsArray retain];

    if (![[[NSUserDefaults standardUserDefaults]objectForKey:@"check"]isEqual:@"yes"]) {
    
    //creating products with name, url, and image
    
    Product *macbookPro = [[Product alloc]initWithName:@"MacBook Pro" URL:@"https://www.apple.com/macbook/" ImageString:@"img-Product-01@2x.png"];
    Product *iMac = [[Product alloc]initWithName:@"iMac" URL:@"http://www.apple.com/imac/" ImageString:@"iMac.jpg"];
    Product *iPhone6 = [[Product alloc]initWithName:@"iPhone 6" URL:@"http://www.apple.com/iphone/"ImageString:@"iphone6.jpeg"];
    Product *chromeBook = [[Product alloc]initWithName:@"ChromeBook" URL:@"https://www.google.com/chromebook/"ImageString:@"chromeBook.png"];
    Product *nexusP6 = [[Product alloc]initWithName:@"Nexus 6P" URL:@"https://store.google.com/product/nexus_6p"ImageString:@"nexus6P.jpg"];
    Product *pixelC = [[Product alloc]initWithName:@"Pixel C" URL:@"https://pixel.google.com/pixel-c/"ImageString:@"pixelC.png"];
    Product *modelS = [[Product alloc]initWithName:@"Model S" URL:@"https://www.teslamotors.com/models"ImageString:@"teslaModelS.jpg"];
    Product *modelX = [[Product alloc]initWithName:@"Model X" URL:@"https://www.teslamotors.com/modelx"ImageString:@"teslaModelX.jpg"];
    Product *model3 = [[Product alloc]initWithName:@"Model 3" URL:@"https://www.teslamotors.com/model3"ImageString:@"teslaModel3.jpg"];
    
    //creating companys with name, products, and image
    
    Company *apple = [[Company alloc]initWithName:@"Apple" products:[[NSMutableArray alloc]initWithObjects: macbookPro, iMac, iPhone6, nil] imageString:@"img-companyLogo_Apple@2x.png" stockSymbol:@"AAPL"];
    Company *google = [[Company alloc]initWithName:@"Google" products:[[NSMutableArray alloc]initWithObjects: chromeBook, nexusP6, pixelC, nil] imageString:@"img-companyLogo_Google@2x.png" stockSymbol:@"GOOG"];
    Company *tesla = [[Company alloc]initWithName:@"Tesla" products:[[NSMutableArray alloc]initWithObjects: modelS, modelX, model3, nil]imageString:@"img-companyLogo_Tesla@2x.png" stockSymbol:@"TSLA"];
    Company *twitter = [[Company alloc]initWithName:@"Twitter" products:nil imageString:@"img-companyLogo_Twitter@2x.png" stockSymbol:@"TWTR"];
    
    //creating an array of companies in the DAO
    
    self.companyArray = [[NSMutableArray alloc] initWithObjects: apple, google, tesla, twitter, nil];
        
        self.managedCompanyArray = [[NSMutableArray alloc]init];
        
        for (Company *company in self.companyArray) {
            
            ManagedCompany *mC =  [NSEntityDescription insertNewObjectForEntityForName:@"ManagedCompany" inManagedObjectContext:self.managedObjectContext];
            [mC setCompanyName:company.companyName];
            [mC setStockSymbol:company.stockSymbol];
            [mC setCompanyImageString:company.companyImageString];
            
            for (Product *product in company.products) {
                
                ManagedProduct *mP = [NSEntityDescription insertNewObjectForEntityForName:@"ManagedProduct" inManagedObjectContext:self.managedObjectContext];
                [mP setProductName:product.productName];
                [mP setProductURLString:product.productURLString];
                [mP setProductImageString:product.productImageString];
                [mP setCompany:mC];
                [mC.products setByAddingObject:mP];
            }
            [self.managedCompanyArray addObject:mC];
        }
        
        NSError *saveError = nil;
        if (![self.managedObjectContext save:&saveError]) {
            NSLog(@"Error: %@", saveError.localizedDescription);
        } else {
            NSLog(@"Context Saved!");
        }

        [[NSUserDefaults standardUserDefaults]setObject:@"yes" forKey:@"check"];
    } else {
        [self loadData];
           }
}
return self;
}

//SAMPLE CODE
//-(void) loadAllEmployees
//{
//    if(!employees){
//        NSFetchRequest *request = [[NSFetchRequest alloc]init];
//        //NSPredicate *p = [NSPredicate predicateWithFormat:@"emp_id >1"];
//        //[request setPredicate:p];
//        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Employee"];
//        [request setEntity:e];
//        NSError *error = nil;
//        NSArray *result = [context executeFetchRequest:request error:&error];
//        if(!result){
//            [NSException raise:@"Fetch Failed" format:@"Reason: %@", [error localizedDescription]];
//        }
//        employees = [[NSMutableArray alloc]initWithArray:result];
//        NSLog(@"Employees Count %d", [employees count]);
//    }
//    [tblView reloadData];
//}
//

-(void) loadData {
//    if(!self.managedCompanyArray){
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        NSEntityDescription *managedCompanyEntity = [[self.managedObjectModel entitiesByName] objectForKey:@"ManagedCompany"];
        [request setEntity:managedCompanyEntity];
        NSError *error = nil;
        NSArray *result = [self.managedObjectContext executeFetchRequest:request error:&error];
        if (!result) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
        self.managedCompanyArray = [[NSMutableArray alloc]initWithArray:result];
        NSLog(@"Company count = %lu", (unsigned long)self.managedCompanyArray.count);
//    }
    self.companyArray = [[NSMutableArray alloc]init];
    for (ManagedCompany *mC in self.managedCompanyArray) {
        Company *company = [[Company alloc]initWithName:mC.companyName imageName:mC.companyImageString stockSymbol:mC.stockSymbol];
        for(ManagedProduct *mP in mC.products){
            Product *product = [[Product alloc]initWithName:mP.productName URL:mP.productURLString ImageString:mP.productImageString];
            [company.products addObject:product];
        }
        [self.companyArray addObject:company];
    }
}

-(void)addCompanyWithName: (NSString*) name
                imagePath: (NSString*) imageString
              stockSymbol: (NSString*) symbol
{
    Company *newCompany = [[Company alloc] initWithName:name imageName:imageString stockSymbol:symbol];
    [self.companyArray addObject:newCompany];
    ManagedCompany *newManagedCompany = [NSEntityDescription insertNewObjectForEntityForName:@"ManagedCompany" inManagedObjectContext:self.managedObjectContext];
    [newManagedCompany setCompanyName:name];
    [newManagedCompany setCompanyImageString:imageString];
    [newManagedCompany setStockSymbol:symbol];
    [self.managedCompanyArray addObject:newManagedCompany];
    
    [self saveContext];

//    [self.sqlManager addCompanyWithName:name stockSymbol:symbol imageString:imageString];
}

-(void)deleteCompany: (Company*) companyToDelete {
    NSInteger index = [self.companyArray indexOfObject:companyToDelete];
    
    [self.managedObjectContext deleteObject:[self.managedCompanyArray objectAtIndex:index]];
    [self.managedCompanyArray removeObjectAtIndex:index];
    [self.companyArray removeObject:companyToDelete];
    [self saveContext];
}

- (void)dealloc
{
//    [_sqlManager release];
    [_companyArray release];
    [_companyToEdit release];
    [_productToEdit release];
    [_companyToAppend release];
    [_stockDictionary release];
    [super dealloc];
}

@end
