//
//  ProductViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "ProductViewController.h"

@interface ProductViewController ()

@end

@implementation ProductViewController

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
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.appleProducts = [[NSMutableArray alloc]initWithObjects:@"MacBook Pro",@"iPhone 6",@"iMac", nil];
    self.googleProducts = [[NSMutableArray alloc]initWithObjects:@"ChromeBook",@"Nexus 6P",@"Pixel C", nil];
    self.teslaProducts = [[NSMutableArray alloc]initWithObjects:@"Model S",@"Model X",@"Model 3", nil];
    self.twitterProducts = [[NSMutableArray alloc]init];
    
//    UIWebView *webView = [[UIWebView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
//    NSURL *appleURL = [NSURL URLWithString:@"https://www.apple.com"];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:appleURL];
//    [webView loadRequest:urlRequest];
//    [self.view addSubview:webView];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if ([self.title isEqualToString:@"Apple Products"]) {
        self.products = [[NSMutableArray alloc]initWithArray:self.appleProducts];
    } else if([self.title isEqualToString:@"Google Products"])  {
        self.products = [[NSMutableArray alloc]initWithArray:self.googleProducts];
    } else if ([self.title isEqualToString:@"Tesla Products"])  {
        self.products = [[NSMutableArray alloc]initWithArray:self.teslaProducts];
    } else if ([self.title isEqualToString:@"Twitter Products"]) {
        self.products = [[NSMutableArray alloc]init];
    }
    [self.tableView reloadData];
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
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [self.products objectAtIndex:[indexPath row]];
    if([cell.textLabel.text isEqualToString:@"MacBook Pro"]){
        [cell.imageView setImage:[UIImage imageNamed:@"img-Product-01@2x.png"]];
    }
    if([cell.textLabel.text isEqualToString:@"iMac"]){
        [cell.imageView setImage:[UIImage imageNamed:@"iMac.jpg"]];
    }
    if([cell.textLabel.text isEqualToString:@"iPhone 6"]){
        [cell.imageView setImage:[UIImage imageNamed:@"iphone6.jpeg"]];
    }
    if([cell.textLabel.text isEqualToString:@"ChromeBook"]){
        [cell.imageView setImage:[UIImage imageNamed:@"chromeBook.png"]];
    }
    if([cell.textLabel.text isEqualToString:@"Nexus 6P"]){
        [cell.imageView setImage:[UIImage imageNamed:@"nexus6P.jpg"]];
    }
    if([cell.textLabel.text isEqualToString:@"Pixel C"]){
        [cell.imageView setImage:[UIImage imageNamed:@"pixelC.png"]];
    }
    if([cell.textLabel.text isEqualToString:@"Model S"]){
        [cell.imageView setImage:[UIImage imageNamed:@"teslaModelS.jpg"]];
    }
    if([cell.textLabel.text isEqualToString:@"Model 3"]){
        [cell.imageView setImage:[UIImage imageNamed:@"teslaModel3.jpg"]];
    }
    if([cell.textLabel.text isEqualToString:@"Model X"]){
        [cell.imageView setImage:[UIImage imageNamed:@"teslaModelX.jpg"]];
    }

    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
//     Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.products removeObjectAtIndex:indexPath.row];
        
        if ([self.title isEqualToString:@"Apple Products"]) {
            [self.appleProducts removeObjectAtIndex:indexPath.row];
        } else if([self.title isEqualToString:@"Google Products"])  {
            [self.googleProducts removeObjectAtIndex:indexPath.row];
        } else if ([self.title isEqualToString:@"Tesla Products"])  {
            [self.teslaProducts removeObjectAtIndex:indexPath.row];
        } else if ([self.title isEqualToString:@"Twitter Products"]) {
            [self.twitterProducts removeObjectAtIndex:indexPath.row];
        }
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    
    if([self.title isEqual: @"Apple Products"]){
        [self.appleProducts exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
    }
    if([self.title isEqual: @"Google Products"]){
        [self.googleProducts exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
    }
    if([self.title isEqual: @"Tesla Products"]){
        [self.teslaProducts exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
    }
    if([self.title isEqual: @"Twitter Products"]){
        [self.twitterProducts exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
    }
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    self.webViewController = [[WebViewController alloc]init];
    
    if([cellText isEqualToString:@"MacBook Pro"]){
        self.webViewController.title = @"MacBook Pro";
    }
    else if([cellText isEqualToString:@"iPhone 6"]){
        self.webViewController.title = @"iPhone 6";
    }
    else if([cellText isEqualToString:@"iMac"]){
        self.webViewController.title = @"iMac";
    }
    else if([cellText isEqualToString:@"ChromeBook"]){
        self.webViewController.title = @"ChromeBook";
    }
    else if([cellText isEqualToString:@"Nexus 6P"]){
        self.webViewController.title = @"Nexus 6P";
    }
    else if([cellText isEqualToString:@"Pixel C"]){
        self.webViewController.title = @"Pixel C";
    }
    else if([cellText isEqualToString:@"Model S"]){
        self.webViewController.title = @"Model S";
    }
    else if([cellText isEqualToString:@"Model X"]){
        self.webViewController.title = @"Model X";
    }
    else if([cellText isEqualToString:@"Model 3"]){
        self.webViewController.title = @"Model 3";
    }




    
  
    
    [self.navigationController
     pushViewController:self.webViewController
     animated:YES];
    
}


/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
