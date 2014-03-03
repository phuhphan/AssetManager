//
//  UserDefault.h
//  TasteSync
//
//  Created by Victor on 12/21/12.
//  Copyright (c) 2012 Mobioneer. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LANGUAGE            @"LANGUAGE"

@interface UserDefault : NSObject<NSCoding>
{
 
}


@property (nonatomic, assign) int language;

+ (UserDefault *) userDefault;
- (void) update;
+ (void) update;
+ (void) resetValue;

@end
