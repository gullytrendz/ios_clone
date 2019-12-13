//
//  MainViewController.m
//  GullyTrends
//
//  Created by Lakshmi Vajrapu on 30/10/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "CustomView.h"

@interface MainViewController ()
@property NSArray<NSNumber *> *widthArr;
@property NSArray<NSNumber *> *heightArr;

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
    _widthArr = @[[NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/2)-20], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/2)-20], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width)-30], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width)-30], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/3)-20], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/3)-20], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/3)-20],[NSNumber numberWithFloat:( [UIScreen mainScreen].bounds.size.width/2)-20], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/2)-20], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width)-30], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width)-30],[NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width)-30]];
    _heightArr = @[[NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/2)], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/2)], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width)-300], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width)-200], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/3)-20], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/3)-20], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/3)-20],[NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/2)], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width/2)], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width)-350], [NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width)-200],[NSNumber numberWithFloat:([UIScreen mainScreen].bounds.size.width)-200]];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

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


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _widthArr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];

    UIImageView *imgview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"best-kids-clothing.jpg"]];
    imgview.layer.cornerRadius = 10;
      if (imgview.layer.cornerRadius > 0) {
          imgview.layer.masksToBounds = YES;
      }
    cell.backgroundView=imgview;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//
    
    return CGSizeMake([_widthArr[indexPath.item] floatValue], [_heightArr[indexPath.item] floatValue]);
}

@end
