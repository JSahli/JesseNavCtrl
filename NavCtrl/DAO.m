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
    
    //creating products with name and url
    
    Product *macbookPro = [[Product alloc]initWithName:@"MacBook Pro" andURL:[NSURL URLWithString:@"https://www.apple.com/macbook/"]];
    Product *iMac = [[Product alloc]initWithName:@"iMac" andURL:[NSURL URLWithString:@"http://www.apple.com/imac/"]];
    Product *iPhone6 = [[Product alloc]initWithName:@"iPhone 6" andURL:[NSURL URLWithString:@"http://www.apple.com/iphone/"]];
    Product *chromeBook = [[Product alloc]initWithName:@"ChromeBook" andURL:[NSURL URLWithString:@"https://www.google.com/chromebook/"]];
    Product *nexusP6 = [[Product alloc]initWithName:@"Nexus P6" andURL:[NSURL URLWithString:@"https://store.google.com/product/nexus_6p"]];
    Product *pixelX = [[Product alloc]initWithName:@"Pixel C" andURL:[NSURL URLWithString:@"https://pixel.google.com/pixel-c/"]];
    Product *modelS = [[Product alloc]initWithName:@"Model S" andURL:[NSURL URLWithString:@"https://www.teslamotors.com/models"]];
    Product *modelX = [[Product alloc]initWithName:@"Model X" andURL:[NSURL URLWithString:@"https://www.teslamotors.com/modelx"]];
    Product *model3 = [[Product alloc]initWithName:@"Model 3" andURL:[NSURL URLWithString:@"https://www.teslamotors.com/model3"]];
    
    //creating companys with name and products
    
    Company *apple = [[Company alloc]initWithName:@"Apple" andProducts:[[NSMutableArray alloc]initWithObjects: macbookPro, iMac, iPhone6, nil]];
    Company *google = [[Company alloc]initWithName:@"Google" andProducts:[[NSMutableArray alloc]initWithObjects: chromeBook, nexusP6, pixelX, nil]];
    Company *tesla = [[Company alloc]initWithName:@"Tesla" andProducts:[[NSMutableArray alloc]initWithObjects: modelS, modelX, model3, nil]];
    Company *twitter = [[Company alloc]initWithName:@"Twitter" andProducts:nil];
    
    //creating an array of companies in the DAO
    
     self.companyArray = [[NSMutableArray alloc] initWithObjects: apple, google, tesla, twitter, nil];
}
return self;
}



@end
