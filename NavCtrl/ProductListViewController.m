//
//  ProductListViewController.m
//  NavCtrl
//
//  Created by Jesse Sahli on 7/6/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "ProductListViewController.h"

@interface ProductListViewController ()

@end

@implementation ProductListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *addBarButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn-navAdd.png"] style:UIBarButtonItemStylePlain target:self action:@selector(addButtonAction)];
    self.navigationItem.rightBarButtonItem = addBarButton;
   

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = [NSString stringWithFormat:@"%@ Products", self.company.companyName];
    self.products = self.company.products;
    self.companyImageView.image = self.company.companyImage;
    self.companyImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.companyLabel.text = [NSString stringWithFormat:@"%@(%@)",self.company.companyName, self.company.stockSymbol];
    self.companyLabel.textColor = [UIColor whiteColor];
    
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addButtonAction {
    DAO *dataManager = [DAO dataManager];
    
    //setting the company to add a product to
    
    dataManager.companyToAppend = self.company;
    self.productAddEditVC = [[ProductAddEditViewController alloc]init];
    self.productAddEditVC.editMode = NO;
    [self.navigationController pushViewController:self.productAddEditVC animated:YES];
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
    
    Product *myProduct = self.products[[indexPath row]];
    cell.textLabel.text = myProduct.productName;
    [cell.imageView setImage:myProduct.productImage];
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
        //        DAO *dataManager = [DAO dataManager];
        
        //        FOR UPDATING SQL DATABASE
        //        [dataManager.sqlManager deleteProduct:product.productId];
        
        Product *product = [self.products objectAtIndex:indexPath.row];
        [[DAO dataManager]deleteProduct:product inCompany:self.company];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    Product *product = [self.products objectAtIndex:fromIndexPath.row];
    [self.products removeObjectAtIndex:fromIndexPath.row];
    [self.products insertObject:product atIndex:toIndexPath.row];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DAO *dataManager = [DAO dataManager];
    dataManager.companyToAppend = self.company;
    dataManager.productToEdit = self.products[[indexPath row]];
    self.webViewController = [[WebViewController alloc]init];
    self.webViewController.product = self.products[[indexPath row]];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_tableView release];
    [_companyImageView release];
    [_companyLabel release];
    [super dealloc];
}
@end
