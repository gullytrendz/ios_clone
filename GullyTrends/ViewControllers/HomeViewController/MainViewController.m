//
//  MainViewController.m
//  GullyTrends
//
//  Created by Lakshmi Vajrapu on 30/10/19.
//  Copyright © 2019 GullyTrends. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "CustomView.h"

@interface MainViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong) NSArray *sectionimages;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    self.sectionimages = @[ @"Unisexgarments", @"onlineclothing",@"best-kids-clothing",  @"Unisexgarments",@"onlineclothing",@"best-kids-clothing"];


}
-(void)viewWillAppear:(BOOL)animated{
    UIImageView *imageview=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageview.image=[UIImage imageNamed:@"homelogo"];
    imageview.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = imageview;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];

    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
    }

 // cell.imageView.image = [UIImage imageNamed:[self.sectionimages objectAtIndex:indexPath.row]];
  
    return cell;
}

@end
