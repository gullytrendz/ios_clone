//
//  FilterViewController.m
//  Constraintsdemo
//
//  Created by Lakshmi Vajrapu on 07/12/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()
@property (strong, nonatomic) IBOutlet UITableView *leftTableView;
@property (strong, nonatomic) IBOutlet UITableView *rightTableview;
@property (strong, nonatomic) NSArray *leftdataArray;
@property (strong, nonatomic) NSArray *rightdataArray;
@property (assign) NSInteger selectedleftindex;
@property (strong) NSMutableArray *selectedrighttindexs;

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftTableView.delegate=self;
    self.rightTableview.delegate=self;
    
    self.leftdataArray=@[@"Color",@"Material",@"Size",@"Sorting",@"Pattern",@"Type",@"Brand"];
    self.rightdataArray =@[@"Color",@"Material",@"Size",@"Sorting",@"Pattern",@"Type",@"Brand"];
   
    self.selectedrighttindexs = [[NSMutableArray alloc]init];
    [self.rightTableview setEditing:YES animated:YES];
    self.leftTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}


# pragma UITableview Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
        return self.leftdataArray.count;
    }else{
        return self.rightdataArray.count+10;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (tableView == self.leftTableView)
    {
        static NSString *CellIdentifier1 = @"cellForleftTableView";

        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];

        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        }

        cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.leftdataArray objectAtIndex:indexPath.row]];

        return cell;
    }
    else
    {
        static NSString *CellIdentifier2 = @"cellForrightTableview";

        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];

        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2];
        }

        cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.rightdataArray objectAtIndex:self.selectedleftindex]];
        cell.tintColor= [UIColor purpleColor];
        return cell;
    }
   
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 3;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView== self.leftTableView) {
        self.selectedleftindex=indexPath.row;
        [self.selectedrighttindexs removeAllObjects];
        [self.rightTableview reloadData];
    }
    if (tableView == self.rightTableview){
        if (![self.selectedrighttindexs containsObject:[NSNumber numberWithInteger:indexPath.row]]) {
                   [self.selectedrighttindexs addObject:[NSNumber numberWithInteger:indexPath.row]];
            NSLog(@"selectedrighttindexs are : %@",self.selectedrighttindexs);
        }    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.rightTableview){
     [self.selectedrighttindexs removeObject:[NSNumber numberWithInteger:indexPath.row]];
      NSLog(@"selectedrighttindexs are : %@",self.selectedrighttindexs);
    }
}

@end
