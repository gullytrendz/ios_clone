//
//  PhotoViewController.m
//  SidebarDemo
//
//  Created by Lakshmi Vajrapu on 10/11/14.
//  Copyright (c) 2019 Lakshmi Vajrapu. All rights reserved.
//

#import "PhotoViewController.h"
#import "SWRevealViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Gully Trends";

    self.photoImageView.image = [UIImage imageNamed:self.photoFilename];

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }

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

@end
