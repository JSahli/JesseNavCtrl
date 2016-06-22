//
//  CompanyViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "CompanyViewController.h"
#import "ProductViewController.h"

@interface CompanyViewController ()

@end

@implementation CompanyViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//    self.navigationItem.rightBarButtonItem
    UIBarButtonItem *addBarButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn-navAdd.png"] style:UIBarButtonItemStylePlain target:self action:@selector(addButtonAction)];
    self.navigationItem.rightBarButtonItem = addBarButton;
    self.tableView.allowsSelectionDuringEditing = YES;
   
    DAO *dataManager = [DAO dataManager];
    self.companyList = dataManager.companyArray;
    self.title = @"Companies";
    NSLog(@"VDL ran");
}

- (void)viewWillAppear:(BOOL)animated {
    DAO *dataManager = [DAO dataManager];
    self.companyList = dataManager.companyArray;
    self.title = @"Companies";
    [self.tableView reloadData];
    NSLog(@"VWA ran");
    
    //SHOULD NSURLSESSION HAPPEN IN DAO.M or in 
    
    NSString* urlShell = @"http://finance.yahoo.com/d/quotes.csv?s=";
    
    for (Company *company in dataManager.companyArray) {
        urlShell = [urlShell stringByAppendingString:[NSString stringWithFormat:@"+%@",company.stockSymbol]];
    }
    
    urlShell = [urlShell stringByAppendingString:@"&f=sa"];
    NSLog(@"STOCKURL: %@", urlShell);
    NSURL *dynamicURL = [NSURL URLWithString:urlShell];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:dynamicURL];
    request.HTTPMethod = @"GET";
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        if(error){
            NSLog(@"error with NSURLSESSION!");
        }
        
        NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", dataString);
        NSArray *stockArray = [dataString componentsSeparatedByString:@"\n"];
        
        dataManager.stockDictionary = [[NSMutableDictionary alloc]init];
        
        for (NSString *x in stockArray) {
            NSLog(@"%@", x);
            
            //Getting rid of quotation marks that came with the data and parsing the CSV string into an NSDictionary
            NSString* newX = [x stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            NSArray *stockValues = [newX componentsSeparatedByString:@","];
            if (stockValues.count < 2) {
                break;
            }
            [dataManager.stockDictionary setObject:stockValues[1] forKey:stockValues[0]];
            
            //            NSLog(@"%@", stockValues[0]);
            //            NSLog(@"%@", stockValues[1]);
        }
        
        NSLog(@"%@", dataManager.stockDictionary);
        NSLog(@"%@", [dataManager.stockDictionary objectForKey:@"AAPL"]);
        
        for(Company *company in dataManager.companyArray){
            company.stockPrice = [dataManager.stockDictionary objectForKey:company.stockSymbol];
        }
    }]
     resume];
    
    
    
}

-(void)addButtonAction {
    self.addEditViewController = [[AddEditViewController alloc]init];
    self.addEditViewController.title = @"Add Company";
    self.addEditViewController.editMode = NO;
    [self.navigationController pushViewController:self.addEditViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.companyList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    Company *company = [self.companyList objectAtIndex:[indexPath row]];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%@)", company.companyName, company.stockSymbol];
    cell.detailTextLabel.numberOfLines = 2;
    cell.detailTextLabel.text = company.stockPrice;
    [cell.imageView setImage:company.companyImage];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.companyList removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData]; // tell table to refresh now
    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    Company *company = [self.companyList objectAtIndex:fromIndexPath.row];
    [self.companyList removeObjectAtIndex:fromIndexPath.row];
    [self.companyList insertObject:company atIndex:toIndexPath.row];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     DAO *dataManager = [DAO dataManager];
    
    if (tableView.editing == YES) {
        Company *company = self.companyList[[indexPath row]];
        self.addEditViewController = [[AddEditViewController alloc]init];
        self.addEditViewController.title = @"Edit Company";
        dataManager.companyToEdit = company;
        self.addEditViewController.editMode = YES;
        [self.navigationController pushViewController:self.addEditViewController animated:YES];
        return;
    }

    
    self.productViewController.company = self.companyList[[indexPath row]];
    [self.navigationController
        pushViewController:self.productViewController
        animated:YES];
}
 


@end
