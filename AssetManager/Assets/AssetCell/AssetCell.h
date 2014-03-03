//
//  AssetCell.h
//  AssetManager
//
//  Created by HP on 2/15/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssetCell : UITableViewCell

@property(nonatomic,weak) IBOutlet UILabel* name;
@property(nonatomic,weak) IBOutlet UILabel* description;
@property(nonatomic,weak) IBOutlet UILabel* location;

@end
