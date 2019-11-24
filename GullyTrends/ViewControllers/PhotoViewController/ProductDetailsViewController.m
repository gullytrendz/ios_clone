//
//  ProductDetailsViewController.m
//  demoproduct
//
//  Created by Karna on 24/11/19.
//  Copyright © 2019 Karna. All rights reserved.
//

#import "ProductDetailsViewController.h"

@interface ProductDetailsViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *similarProductsCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *recentlyViewedProductsCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *productImagesPageControl;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;

@end

@implementation ProductDetailsViewController{
    NSMutableArray *productImageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    productImageArray = [[NSMutableArray alloc] init];
    [productImageArray addObject:@"temp-image"];
    [productImageArray addObject:@"app-logo"];
    [productImageArray addObject:@"book-tailor"];
    [productImageArray addObject:@"ar-bg-icon"];
    self.productImagesPageControl.numberOfPages = productImageArray.count;
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
    if(collectionView == self.similarProductsCollectionView){
        UICollectionViewCell *productInformationCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"similarProductsCell" forIndexPath:indexPath];
        return productInformationCell;

    }else{
        
    
    UICollectionViewCell *productInformationCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recentlyViewedProductsCell" forIndexPath:indexPath];
        return productInformationCell;

    }
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(collectionView == self.similarProductsCollectionView){
        return 10;

    }else{
        return 2;

    }
        
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((self.similarProductsCollectionView.layer.frame.size.width - 10)/4, self.similarProductsCollectionView.layer.frame.size.height);
}

- (IBAction)productImageRightSwipeGesture:(UISwipeGestureRecognizer *)sender {
    if(self.productImagesPageControl.currentPage > 0){
       
        [UIView transitionWithView:self.productImage
                          duration:1.0f
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
                            self.productImagesPageControl.currentPage--;
                            self.productImage.image = [UIImage imageNamed:self->productImageArray[self.productImagesPageControl.currentPage]];
                            
                        } completion:nil];
    }else{
       
        [UIView transitionWithView:self.productImage
                          duration:1.0f
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
                            self.productImagesPageControl.currentPage = self->productImageArray.count - 1;
                            self.productImage.image = [UIImage imageNamed:self->productImageArray[self.productImagesPageControl.currentPage]];
                            
                        } completion:nil];
    }
}
- (IBAction)productImageLeftSwipeGesture:(UISwipeGestureRecognizer *)sender {
    if(self.productImagesPageControl.currentPage < productImageArray.count - 1){
       
        [UIView transitionWithView:self.productImage
                          duration:1.0f
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            
                            self.productImagesPageControl.currentPage++;
                            self.productImage.image = [UIImage imageNamed:self->productImageArray[self.productImagesPageControl.currentPage]];
                        } completion:nil];
    }else{
        [UIView transitionWithView:self.productImage
                          duration:1.0f
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            self.productImagesPageControl.currentPage = 0;
                            self.productImage.image = [UIImage imageNamed:self->productImageArray[self.productImagesPageControl.currentPage]];
                        } completion:nil];
        
    }
}


@end
