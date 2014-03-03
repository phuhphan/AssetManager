//
//  AssetObject.h
//  AssetManager
//
//  Created by HP on 2/15/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBAsset.h"

@interface AssetObject : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* description;
@property(nonatomic, strong) NSString* location;

@end
