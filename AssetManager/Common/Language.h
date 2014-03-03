//
//  Language.h
//  AssetManager
//
//  Created by HP on 2/11/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    LanguageNone            =   0,
    LanguageUS              =   1,
    LanguageVN              =   2
    
} LanguageType;
@interface Language : NSObject
{
    NSMutableDictionary* languageArray;
}
+ (id)sharedManager;
- (NSString*)getText:(NSString*)message;
- (void)setLanguage:(LanguageType)type;
@end
