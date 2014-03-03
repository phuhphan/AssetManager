//
//  AppDelegate.h
//  AssetManager
//
//  Created by HP on 2/11/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"
#import "AssetVC.h"
#import "TakePhotoVC.h"
#import "SettingsVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    TabBarController* tabBarController;
    AssetVC* assetVC;
    TakePhotoVC* takePhotoVC;
    SettingsVC* settingsVC;
}
@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (void)reloadTabbar;
- (NSURL *)applicationDocumentsDirectory;

@end
