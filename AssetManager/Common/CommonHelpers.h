//
//  CommonHelpers.h
//  AssetManager
//
//  Created by HP on 2/13/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Define.h"

@interface CommonHelpers : NSObject

+(UIColor*)getGrayColor;
+(UIColor*)getTintColor;
+(UIFont*)getSystemFontWithSize:(float)size;
+(AppDelegate*)appDelegate;
+(NSMutableArray*)getSettingsMenu;
+(NSMutableArray*)getLanguageMenu;
+ (UIBarButtonItem*)setBarButton:(id)target action:(SEL)action button:(BarButtonType)buttonType buttonLocation:(BarButtonLocationType)buttonLocation Bar:(UINavigationItem*)item TitleText:(NSString*)text;
@end
