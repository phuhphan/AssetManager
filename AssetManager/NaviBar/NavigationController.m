//
//  NavigationController.m
//  AssetManager
//
//  Created by HP on 2/13/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import "NavigationController.h"
#import "CommonHelpers.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, [CommonHelpers getSystemFontWithSize:TABBAR_FONT_SIZE], UITextAttributeFont,nil] forState:UIControlStateSelected];
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[CommonHelpers getGrayColor], UITextAttributeTextColor, [CommonHelpers getSystemFontWithSize:TABBAR_FONT_SIZE], UITextAttributeFont, nil] forState:UIControlStateNormal];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
