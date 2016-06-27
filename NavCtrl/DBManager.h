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

-(id)initWithDatabaseFilename:(NSString*)dbFilename;

@end
