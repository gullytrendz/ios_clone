//
//  SidebarTableViewController.m
//  GullyTrends
//
//  Created by Lakshmi Vajrapu on 30/10/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

#import "SidebarTableViewController.h"
#import "SWRevealViewController.h"
#import "SearchProductViewController.h"
static int const kHeaderSectionTag = 6900;

@interface SidebarTableViewController ()
@property (assign) NSInteger expandedSectionHeaderNumber;
@property (assign) UITableViewHeaderFooterView *expandedSectionHeader;
@property (strong) NSArray *sectionItems;
@property (strong) NSArray *sectionNames;
@property (strong) NSArray *sectionimages;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SidebarTableViewController {
    NSArray *menuItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sectionNames = @[ @"Men's", @"Women's", @"Kids",@"Designer Studios",@"Home Shopping", @"Sell On Gully", @"Buy Wholesale", @"Customer Care" ,@"Return Policy", @"FAQS", @"About & Policies"];
    
    self.sectionimages = @[ @"mens-icon", @"womens-icon", @"kids-icon",@"designer-icon",@"menu_home-shopping",@"menu_sell-on-gully-icon",@"menu_buy-wholesale-icon"];

    self.sectionItems = @[ @[@"Shirts", @"T-Shirts", @"Jeans", @"Kurta"],
                           @[@"Jeans", @"Kurta"],
                           @[@"T Shirts", @"Jeans"],
                            @[@"Kurta"]
                         ];
    
    // configure the tableview
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    self.expandedSectionHeaderNumber = -1;
    self.tableView.backgroundColor=[UIColor colorWithRed:80.0/255.0 green:24/255.0 blue:133/255.0 alpha:1.0];
    menuItems = @[@"title", @"comments", @"wishlist", @"tag"];
   // [self applyGradientEffect];

}

-(void)applyGradientEffect{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.startPoint = CGPointZero;
    gradient.endPoint = CGPointMake(0, 1);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:80/255.0 green:24/255.0 blue:133/255.0 alpha:1.0] CGColor],(id)[[UIColor colorWithRed:14.0/255.0 green:27.0/255.0 blue:96/255.0 alpha:1.0] CGColor], nil];
   // [ self.view.layer addSublayer:gradient];
    
    //# Changed to insertlayer instead addsublayer to fix the issue, after applying gradient labels got disappered.
    [self.view.layer insertSublayer:gradient atIndex:0];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if (self.sectionNames.count > 0) {
        self.tableView.backgroundView = nil;
        return self.sectionNames.count;
    } else {
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
        messageLabel.text = @"Retrieving data.\nPlease wait.";
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:20];
        [messageLabel sizeToFit];
        self.tableView.backgroundView = messageLabel;
        
        return 0;
    };
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
     if (self.expandedSectionHeaderNumber == section) {
           NSMutableArray *arrayOfItems = [self.sectionItems objectAtIndex:section];
           return arrayOfItems.count;
       } else {
           return 0;
       }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
   // NSString str=[NSString stringWithFormat:@"   %@",[self.sectionNames objectAtIndex:section]];
    if (self.sectionNames.count) {
        return [NSString stringWithFormat:@"         %@",[self.sectionNames objectAtIndex:section]];
    }
    
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section; {
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 35.0;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 30)];
////    myLabel.frame = CGRectMake(20, 8, 320, 20);
//    myLabel.font = [UIFont fontWithName:@"Open Sans-Regular" size:12];
//    myLabel.text = [NSString stringWithFormat:@"   %@",[self.sectionNames objectAtIndex:section]];
//
//    myLabel.backgroundColor=[UIColor blueColor];
//    myLabel.textColor=[UIColor whiteColor];
//    UIView *headerView = [[UIView alloc] init];
//    [headerView addSubview:myLabel];
//    return headerView;
//}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    // recast your view as a UITableViewHeaderFooterView
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    //header.contentView.backgroundColor = [UIColor blueColor];
   header.contentView.backgroundColor=[UIColor colorWithRed:80.0/255.0 green:24/255.0 blue:133/255.0 alpha:1.0];

    header.textLabel.textColor = [UIColor whiteColor];
    if (section<=6) {
        
    
    UIImageView *viewWithTag = [self.view viewWithTag:kHeaderSectionTag + section];

    if (viewWithTag) {
        [viewWithTag removeFromSuperview];
    }
    // add the arrow image
  //  CGSize headerFrame = self.view.frame.size;
    UIImageView *theImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 13, 15, 16)];
    theImageView.image = [UIImage imageNamed:[self.sectionimages objectAtIndex:section]];
    theImageView.tag = kHeaderSectionTag + section;
    theImageView.contentMode = UIViewContentModeScaleAspectFit;
    [header addSubview:theImageView];
    }
    UIImageView *expandimageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 13, 10, 10)];
    expandimageView.image = [UIImage imageNamed:@"back-arrow"];
//    [header addSubview:expandimageView];

    // make headers touchable
    header.tag = section;
    UITapGestureRecognizer *headerTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderWasTouched:)];
    [header addGestureRecognizer:headerTapGesture];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  //  NSString *CellIdentifier = [self.sectionNames objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"title" forIndexPath:indexPath];
    NSArray *section = [self.sectionItems objectAtIndex:indexPath.section];
    cell.contentView.backgroundColor=[UIColor colorWithRed:80.0/255.0 green:24/255.0 blue:133/255.0 alpha:1.0];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.text = [NSString stringWithFormat:@"            %@",[section objectAtIndex:indexPath.row]];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //self.selectedrow = [self.sectionNames objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"segueID" sender:self];

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[self.sectionNames objectAtIndex:indexPath.row] capitalizedString];
    
    // Set the photo if it navigates to the PhotoView
    if ([segue.identifier isEqualToString:@"showPhoto"]) {
       // UINavigationController *navController = segue.destinationViewController;
       // SearchProductViewController *productController = [navController childViewControllers].firstObject;
       // NSString *photoFilename = [NSString stringWithFormat:@"%@_photo", [menuItems objectAtIndex:indexPath.row]];
        //photoController.photoFilename = photoFilename;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"product" bundle:nil];
        SearchProductViewController *myNewVC = (SearchProductViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SearchProductViewController"];
        [self.navigationController pushViewController:myNewVC animated:YES];
    }
}
#pragma mark - Expand / Collapse Methods

- (void)sectionHeaderWasTouched:(UITapGestureRecognizer *)sender {
    UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)sender.view;
    NSInteger section = headerView.tag;
    NSArray *menuitems=@[@"Home Shopping",@"Sell On Gully", @"Buy Wholesale", @"Customer Care" ,@"Return Policy", @"FAQS", @"About & Policies"];
        NSString *searchstring=[headerView.textLabel.text stringByReplacingOccurrencesOfString:@"         " withString:@""];
    if ( [menuitems containsObject:searchstring] ) {
        [self performSegueWithIdentifier:@"segueID" sender:self];
        return;
    }
    UIImageView *eImageView = (UIImageView *)[headerView viewWithTag:kHeaderSectionTag + section];
    self.expandedSectionHeader = headerView;
    
    if (self.expandedSectionHeaderNumber == -1) {
        self.expandedSectionHeaderNumber = section;
        [self tableViewExpandSection:section withImage: eImageView];
    } else {
        if (self.expandedSectionHeaderNumber == section) {
            [self tableViewCollapeSection:section withImage: eImageView];
            self.expandedSectionHeader = nil;
        } else {
            UIImageView *cImageView  = (UIImageView *)[self.view viewWithTag:kHeaderSectionTag + self.expandedSectionHeaderNumber];
            [self tableViewCollapeSection:self.expandedSectionHeaderNumber withImage: cImageView];
            [self tableViewExpandSection:section withImage: eImageView];
        }
    }
}


- (void)tableViewCollapeSection:(NSInteger)section withImage:(UIImageView *)imageView {
    NSArray *sectionData = [self.sectionItems objectAtIndex:section];
    
    self.expandedSectionHeaderNumber = -1;
    if (sectionData.count == 0) {
        return;
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            imageView.transform = CGAffineTransformMakeRotation((0.0 * M_PI) / 180.0);
        }];
        NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
        for (int i=0; i< sectionData.count; i++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:section];
            [arrayOfIndexPaths addObject:index];
        }
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:arrayOfIndexPaths withRowAnimation: UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    }
}

- (void)tableViewExpandSection:(NSInteger)section withImage:(UIImageView *)imageView {
    NSArray *sectionData = [self.sectionItems objectAtIndex:section];
    
    if (sectionData.count == 0) {
        self.expandedSectionHeaderNumber = -1;
        return;
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            imageView.transform = CGAffineTransformMakeRotation((180.0 * M_PI) / 180.0);
        }];
        NSMutableArray *arrayOfIndexPaths = [NSMutableArray array];
        for (int i=0; i< sectionData.count; i++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:section];
            [arrayOfIndexPaths addObject:index];
        }
        self.expandedSectionHeaderNumber = section;
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:arrayOfIndexPaths withRowAnimation: UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    }
}

@end
