//
//  DBAsset.h
//  AssetManager
//
//  Created by HP on 2/19/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DBPosition;

@interface DBAsset : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * order;
@property (nonatomic, retain) NSNumber * alway;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) NSDate * date_create;
@property (nonatomic, retain) NSString * imagename;
@property (nonatomic, retain) NSSet *position;
@end

@interface DBAsset (CoreDataGeneratedAccessors)

- (void)addPositionObject:(DBPosition *)value;
- (void)removePositionObject:(DBPosition *)value;
- (void)addPosition:(NSSet *)values;
- (void)removePosition:(NSSet *)values;

@end
