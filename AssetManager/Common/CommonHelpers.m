//
//  CommonHelpers.m
//  AssetManager
//
//  Created by HP on 2/13/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import "CommonHelpers.h"
#import "UserDefault.h"
#import "SettingCellObject.h"
#import "Language.h"
#import "MultiChoiceObject.h"

@implementation CommonHelpers

+(UIColor*)getTintColor
{
    return [UIColor colorWithRed:0.0 green:86.0/255.0 blue:134.0/255.0 alpha:1.0];
}
+(UIColor*)getGrayColor
{
    return [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0];
}
+(AppDelegate*)appDelegate
{
    return [[UIApplication sharedApplication] delegate];
}
+(UIFont*)getSystemFontWithSize:(float)size
{
    return [UIFont fontWithName:@"Palatino" size:size];
}
+(NSMutableArray*)getSettingsMenu
{
    NSMutableArray* arrayRet = [[NSMutableArray alloc]init];
    
    SettingCellObject* language = [[SettingCellObject alloc]init];
    language.name = [[Language sharedManager] getText:@"SETTINGS_MENU_LANGUAGE"];
    
    if ([UserDefault userDefault].language == LanguageUS) {
        language.description = [[Language sharedManager] getText:@"SETTINGS_MENU_LANGUAGE_US"];
    }
    if ([UserDefault userDefault].language == LanguageVN) {
        language.description = [[Language sharedManager] getText:@"SETTINGS_MENU_LANGUAGE_VI"];
    }
    [arrayRet addObject:language];
    return arrayRet;
}
+(NSMutableArray*)getLanguageMenu
{
    NSMutableArray* arrayRet = [[NSMutableArray alloc]init];
    
    MultiChoiceObject* language_en = [[MultiChoiceObject alloc]init];
    language_en.name = [[Language sharedManager] getText:@"SETTINGS_MENU_LANGUAGE_US"];
    if ([UserDefault userDefault].language == LanguageUS) {
        language_en.isSelected = YES;
    }
    
    
    MultiChoiceObject* language_vn = [[MultiChoiceObject alloc]init];
    language_vn.name = [[Language sharedManager] getText:@"SETTINGS_MENU_LANGUAGE_VI"];
    if ([UserDefault userDefault].language == LanguageVN) {
        language_vn.isSelected = YES;
    }
    
    [arrayRet addObject:language_en];
    [arrayRet addObject:language_vn];
    return arrayRet;
}
+ (UIBarButtonItem*)setBarButton:(id)target action:(SEL)action button:(BarButtonType)buttonType buttonLocation:(BarButtonLocationType)buttonLocation Bar:(UINavigationItem*)item TitleText:(NSString*)text
{
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc]init];
    //UIImage *faceImage;
    if (buttonType == BarButtonBack) {
        //faceImage = [[Language sharedManager] getImageName:@"ic_bt_back"];
    }
    UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
    //UIButton *face = [UIButton buttonWithType:UIButtonTypeCustom];
    [face addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [face setTitle:text forState:UIControlStateNormal];
    [face setTitle:text forState:UIControlStateHighlighted];
    [face.titleLabel setFont:[CommonHelpers getSystemFontWithSize:15]];
    face.bounds = CGRectMake( 0, 0, 60, 15 );
    //[face setImage:faceImage forState:UIControlStateNormal];
    barButton.customView = face;
    if (buttonLocation == BarButtonLeft ) {
        item.leftBarButtonItem = barButton;
    }
    else {
        item.rightBarButtonItem = barButton;
    }
    return barButton;
}
@end
