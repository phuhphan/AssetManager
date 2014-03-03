//
//  Language.m
//  AssetManager
//
//  Created by HP on 2/11/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import "Language.h"
#import "UserDefault.h"

@implementation Language

+ (id)sharedManager {
    static Language *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init{
    self = [super init];
    if(self) {
        languageArray = [[NSMutableDictionary alloc]init];
        NSString * fName;
        if ([UserDefault userDefault].language == LanguageUS) {
             fName = [[NSBundle mainBundle] pathForResource:@"language_en" ofType:@"txt"];
        }
        if ([UserDefault userDefault].language == LanguageVN) {
            fName = [[NSBundle mainBundle] pathForResource:@"language_vn" ofType:@"txt"];
        }
        NSString* contents;
        contents = [NSString stringWithContentsOfFile:fName encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",contents);
        NSArray* array = [contents componentsSeparatedByString:@"\n"];
        NSMutableArray *mutable = [NSMutableArray arrayWithArray:array];
        for (int i = 0; i < [mutable count]; i++) {
            NSArray* arrayTmp = [[mutable objectAtIndex:i] componentsSeparatedByString:@"\""];
            NSMutableArray *mutableTmp = [NSMutableArray arrayWithArray:arrayTmp];
            NSString* str = [mutableTmp objectAtIndex:0];
            [languageArray setObject:[mutableTmp objectAtIndex:1] forKey:[str stringByReplacingOccurrencesOfString:@" " withString:@""]];
        }
    }
    return self;
}
- (NSString*)getText:(NSString*)message
{
    return (NSString*)[languageArray objectForKey:message];
}
- (void)setLanguage:(LanguageType)type
{
    NSString* languageName;
    if (type == LanguageUS) {
        languageName = @"language_en";
    }
    if (type == LanguageVN) {
        languageName = @"language_vn";
    }
    languageArray = [[NSMutableDictionary alloc]init];
    NSString * fName = [[NSBundle mainBundle] pathForResource:languageName ofType:@"txt"];
    NSString* contents;
    contents = [NSString stringWithContentsOfFile:fName encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",contents);
    NSArray* array = [contents componentsSeparatedByString:@"\n"];
    NSMutableArray *mutable = [NSMutableArray arrayWithArray:array];
    for (int i = 0; i < [mutable count]; i++) {
        NSArray* arrayTmp = [[mutable objectAtIndex:i] componentsSeparatedByString:@"\""];
        NSMutableArray *mutableTmp = [NSMutableArray arrayWithArray:arrayTmp];
        NSString* str = [mutableTmp objectAtIndex:0];
        [languageArray setObject:[mutableTmp objectAtIndex:1] forKey:[str stringByReplacingOccurrencesOfString:@" " withString:@""]];
    }
}
@end
