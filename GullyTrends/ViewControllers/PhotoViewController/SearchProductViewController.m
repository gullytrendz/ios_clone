//
//  SearchProductViewController.m
//  demoproduct
//
//  Created by Karna on 24/11/19.
//  Copyright © 2019 Karna. All rights reserved.
//

#import "SearchProductViewController.h"
#import "SWRevealViewController.h"

@interface SearchProductViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *productsCollectionView;

@end

@implementation SearchProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SWRevealViewController *revealViewController = self.revealViewController;
       if ( revealViewController )
       {
           [self.sidebarButton setTarget: self.revealViewController];
           [self.sidebarButton setAction: @selector( revealToggle: )];
           [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
       }
}
-(void)viewWillAppear:(BOOL)animated{
    UIImageView *imageview=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageview.image=[UIImage imageNamed:@"homelogo"];
    imageview.contentMode=UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = imageview;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *productInformationCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"productCell" forIndexPath:indexPath];

    return productInformationCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.productsCollectionView.layer.frame.size.width - 1)/2, self.productsCollectionView.layer.frame.size.height/2);
}


@end
