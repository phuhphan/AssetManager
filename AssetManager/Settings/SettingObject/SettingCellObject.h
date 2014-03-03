//
//  SettingCellObject.h
//  AssetManager
//
//  Created by HP on 2/14/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface SettingCellObject : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* description;
@property(nonatomic, assign) int type;
@property(nonatomic, assign) int option;

@end
