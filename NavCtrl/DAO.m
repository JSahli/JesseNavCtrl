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
    
    //creating products with name, url, and image
    
    Product *macbookPro = [[Product alloc]initWithName:@"MacBook Pro" URL:[NSURL URLWithString:@"https://www.apple.com/macbook/"] ImageString:@"img-Product-01@2x.png"];
    Product *iMac = [[Product alloc]initWithName:@"iMac" URL:[NSURL URLWithString:@"http://www.apple.com/imac/"] ImageString:@"iMac.jpg"];
    Product *iPhone6 = [[Product alloc]initWithName:@"iPhone 6" URL:[NSURL URLWithString:@"http://www.apple.com/iphone/"]ImageString:@"iphone6.jpeg"];
    Product *chromeBook = [[Product alloc]initWithName:@"ChromeBook" URL:[NSURL URLWithString:@"https://www.google.com/chromebook/"]ImageString:@"chromeBook.png"];
    Product *nexusP6 = [[Product alloc]initWithName:@"Nexus P6" URL:[NSURL URLWithString:@"https://store.google.com/product/nexus_6p"]ImageString:@"nexus6P.jpg"];
    Product *pixelC = [[Product alloc]initWithName:@"Pixel C" URL:[NSURL URLWithString:@"https://pixel.google.com/pixel-c/"]ImageString:@"pixelC.png"];
    Product *modelS = [[Product alloc]initWithName:@"Model S" URL:[NSURL URLWithString:@"https://www.teslamotors.com/models"]ImageString:@"teslaModelS.jpg"];
    Product *modelX = [[Product alloc]initWithName:@"Model X" URL:[NSURL URLWithString:@"https://www.teslamotors.com/modelx"]ImageString:@"teslaModelX.jpg"];
    Product *model3 = [[Product alloc]initWithName:@"Model 3" URL:[NSURL URLWithString:@"https://www.teslamotors.com/model3"]ImageString:@"teslaModel3.jpg"];
    
    //creating companys with name, products, and image
    
    Company *apple = [[Company alloc]initWithName:@"Apple" Products:[[NSMutableArray alloc]initWithObjects: macbookPro, iMac, iPhone6, nil] ImageString:@"img-companyLogo_Apple@2x.png"];
    Company *google = [[Company alloc]initWithName:@"Google" Products:[[NSMutableArray alloc]initWithObjects: chromeBook, nexusP6, pixelC, nil] ImageString:@"img-companyLogo_Google@2x.png"];
    Company *tesla = [[Company alloc]initWithName:@"Tesla" Products:[[NSMutableArray alloc]initWithObjects: modelS, modelX, model3, nil]ImageString:@"img-companyLogo_Tesla@2x.png"];
    Company *twitter = [[Company alloc]initWithName:@"Twitter" Products:nil ImageString:@"img-companyLogo_Twitter@2x.png"];
    
    //creating an array of companies in the DAO
    
     self.companyArray = [[NSMutableArray alloc] initWithObjects: apple, google, tesla, twitter, nil];
}
return self;
}

-(void)addCompanyWithName: (NSString*) name ImagePath: (NSString*) imageString
{
    Company *newCompany = [[Company alloc] initWithName:name ImageName:imageString];
    [self.companyArray addObject:newCompany];
    
    //Will my method work? or will I keep addind the same company variable?
}



@end
