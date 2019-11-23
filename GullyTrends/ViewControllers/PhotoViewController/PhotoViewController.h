//
//  PhotoViewController.h
//  SidebarDemo
//
//  Created by Lakshmi Vajrapu on 10/11/14.
//  Copyright (c) 2019 Lakshmi Vajrapu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) NSString *photoFilename;
@end
