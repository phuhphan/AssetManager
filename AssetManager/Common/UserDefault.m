//
//  UserDefault.m
//  TasteSync
//
//  Created by Victor on 12/21/12.
//  Copyright (c) 2012 Mobioneer. All rights reserved.
//

#import "UserDefault.h"
#import "Define.h"

@interface UserDefault ()

@end


static UserDefault *globalObject;

@implementation UserDefault


@synthesize language;



- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        self.language = [aDecoder decodeIntForKey:LANGUAGE];
    }
    return self;
    
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.language forKey:LANGUAGE];
}

- (void) updateUserDefault
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:[NSKeyedArchiver archivedDataWithRootObject:self] forKey:kUserDefault];
    [userDefault synchronize];
}

+ (UserDefault *) userDefault
{
    if (!globalObject) {
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        globalObject = [NSKeyedUnarchiver unarchiveObjectWithData:[userDefault dataForKey:kUserDefault]] ;
        if (!globalObject) {
            globalObject = [[UserDefault alloc] init] ;
            [globalObject update];
        }
    }
    
    return globalObject;
}
- (void) update
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:[NSKeyedArchiver archivedDataWithRootObject:self]
                    forKey:kUserDefault];
    [userDefault synchronize];
}

+ (void) update
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:[NSKeyedArchiver archivedDataWithRootObject:globalObject]
                    forKey:kUserDefault];
    [userDefault synchronize];
}

+ (void) resetValue
{
    [UserDefault update];
    
}

@end
