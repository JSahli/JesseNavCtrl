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

+ (id)dataManager {
    @synchronized(self) {
        if(dataManager == nil)
            dataManager = [[super alloc] init];
    }
    return dataManager;
}



-(id)init {
    
if (self = [super init]) {
    
    _sqlManager = [[[DBManager alloc]initWithDatabaseFilename:@"NavDatabase.db"] retain];
    [self.sqlManager pullDataFromSQL];
    _companyArray = [self.sqlManager.resultsArray retain];
    
    
    
    //creating products with name, url, and image
//    
//    Product *macbookPro = [[Product alloc]initWithName:@"MacBook Pro" URL:@"https://www.apple.com/macbook/" ImageString:@"img-Product-01@2x.png"];
//    Product *iMac = [[Product alloc]initWithName:@"iMac" URL:@"http://www.apple.com/imac/" ImageString:@"iMac.jpg"];
//    Product *iPhone6 = [[Product alloc]initWithName:@"iPhone 6" URL:@"http://www.apple.com/iphone/"ImageString:@"iphone6.jpeg"];
//    Product *chromeBook = [[Product alloc]initWithName:@"ChromeBook" URL:@"https://www.google.com/chromebook/"ImageString:@"chromeBook.png"];
//    Product *nexusP6 = [[Product alloc]initWithName:@"Nexus 6P" URL:@"https://store.google.com/product/nexus_6p"ImageString:@"nexus6P.jpg"];
//    Product *pixelC = [[Product alloc]initWithName:@"Pixel C" URL:@"https://pixel.google.com/pixel-c/"ImageString:@"pixelC.png"];
//    Product *modelS = [[Product alloc]initWithName:@"Model S" URL:@"https://www.teslamotors.com/models"ImageString:@"teslaModelS.jpg"];
//    Product *modelX = [[Product alloc]initWithName:@"Model X" URL:@"https://www.teslamotors.com/modelx"ImageString:@"teslaModelX.jpg"];
//    Product *model3 = [[Product alloc]initWithName:@"Model 3" URL:@"https://www.teslamotors.com/model3"ImageString:@"teslaModel3.jpg"];
//    
//    //creating companys with name, products, and image
//    
//    Company *apple = [[Company alloc]initWithName:@"Apple" products:[[NSMutableArray alloc]initWithObjects: macbookPro, iMac, iPhone6, nil] imageString:@"img-companyLogo_Apple@2x.png" stockSymbol:@"AAPL"];
//    Company *google = [[Company alloc]initWithName:@"Google" products:[[NSMutableArray alloc]initWithObjects: chromeBook, nexusP6, pixelC, nil] imageString:@"img-companyLogo_Google@2x.png" stockSymbol:@"GOOG"];
//    Company *tesla = [[Company alloc]initWithName:@"Tesla" products:[[NSMutableArray alloc]initWithObjects: modelS, modelX, model3, nil]imageString:@"img-companyLogo_Tesla@2x.png" stockSymbol:@"TSLA"];
//    Company *twitter = [[Company alloc]initWithName:@"Twitter" products:nil imageString:@"img-companyLogo_Twitter@2x.png" stockSymbol:@"TWTR"];
//    
//    //creating an array of companies in the DAO
//    
//    self.companyArray = [[NSMutableArray alloc] initWithObjects: apple, google, tesla, twitter, nil];
    }
return self;
}

-(void)addCompanyWithName: (NSString*) name
                imagePath: (NSString*) imageString
              stockSymbol: (NSString*) symbol
{
//    Company *newCompany = [[Company alloc] initWithName:name imageName:imageString stockSymbol:symbol];
//    [self.companyArray addObject:newCompany]; WILL THIS MATTER IN THE TABLEVIEW
    
    [self.sqlManager addCompanyWithName:name stockSymbol:symbol imageString:imageString];
    
}

- (void)dealloc
{
    [_sqlManager release];
    [_companyArray release];
    [_companyToEdit release];
    [_productToEdit release];
    [_companyToAppend release];
    [_stockDictionary release];
    [super dealloc];
}

@end
