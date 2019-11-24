//
//  ProductCollectionViewCell.h
//  demoproduct
//
//  Created by Karna on 24/11/19.
//  Copyright © 2019 Karna. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *productSellingFareLabel;
@property (weak, nonatomic) IBOutlet UILabel *productMrpFareLabel;
@property (weak, nonatomic) IBOutlet UILabel *productDiscountDescriptionLabel;

@end

NS_ASSUME_NONNULL_END
