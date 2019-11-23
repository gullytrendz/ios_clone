//
//  ARViewController.m
//  GullyTrends
//
//  Created by Lakshmi Vajrapu on 30/10/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

#import "ARViewController.h"

@interface ARViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *arImage;
@property (strong, nonatomic) IBOutlet UIButton *myCheckBoxButton;

@end

@implementation ARViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [self applyGradientEffect];
    [self.myCheckBoxButton setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateSelected];
    [self.myCheckBoxButton setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];

    
    // Do any additional setup after loading the view.
}

-(void)applyGradientEffect{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.startPoint = CGPointZero;
    gradient.endPoint = CGPointMake(0, 1);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:80/255.0 green:24/255.0 blue:133/255.0 alpha:1.0] CGColor],(id)[[UIColor colorWithRed:14.0/255.0 green:27.0/255.0 blue:96/255.0 alpha:1.0] CGColor], nil];
   // [ self.view.layer addSublayer:gradient];
    [self.view.layer insertSublayer:gradient atIndex:0];

}
- (IBAction)checkBoxToggle:(UIButton*)sender {
    self.myCheckBoxButton.selected = !self.myCheckBoxButton.selected; // toggle the selected property, just a simple BOOL
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
