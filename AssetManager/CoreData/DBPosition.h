//
//  DBPosition.h
//  AssetManager
//
//  Created by HP on 2/19/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBAsset;

@interface DBPosition : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * pointx;
@property (nonatomic, retain) NSNumber * pointy;
@property (nonatomic, retain) DBAsset *asset;

@end
