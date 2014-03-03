//
//  MultiChoiceCell.h
//  AssetManager
//
//  Created by HP on 2/14/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiChoiceCell : UITableViewCell

@property(nonatomic,weak) IBOutlet UILabel* name;
@property(nonatomic,weak) IBOutlet UIImageView* image;
@property(nonatomic,weak) IBOutlet UIView* tick;

@end
