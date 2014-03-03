//
//  Define.h
//  AssetManager
//
//  Created by HP on 2/14/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    SettingLanguage = 0
}SettingOptions;

typedef enum
{
    SettingSwitchOption = 0,
    SettingMenuOption = 1
}SettingType;

typedef enum
{
    BarButtonBack = 0,
    BarButtonDone = 1
}BarButtonType;

typedef enum
{
    BarButtonLeft = 0,
    BarButtonRight = 1
}BarButtonLocationType;

#define kUserDefault    @"kUserDefault"
#define TABBAR_FONT_SIZE 10.0f
#define NAVIBAR_FONT_SIZE 21.0f
