//
//  AppDelegate.m
//  AssetManager
//
//  Created by HP on 2/11/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import "AppDelegate.h"
#import "NavigationController.h"
#import "CommonHelpers.h"
#import "Language.h"
#import "UserDefault.h"

@interface AppDelegate ()
{
    NavigationController* assetNavi, *takePhotoNavi, *settingsNavi;
}
@end
@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if ([UserDefault userDefault].language == LanguageNone) {
        [UserDefault userDefault].language = LanguageUS;
        [UserDefault update];
    }
    
    assetVC = [[AssetVC alloc]initWithNibName:@"AssetVC" bundle:nil];
    takePhotoVC = [[TakePhotoVC alloc]initWithNibName:@"TakePhotoVC" bundle:nil];
    settingsVC = [[SettingsVC alloc]initWithNibName:@"SettingsVC" bundle:nil];
    
    assetNavi     = [[NavigationController alloc]initWithRootViewController:assetVC];
    takePhotoNavi = [[NavigationController alloc]initWithRootViewController:takePhotoVC];
    settingsNavi  = [[NavigationController alloc]initWithRootViewController:settingsVC];
    [self reloadTabbar];
    
    [assetNavi.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [takePhotoNavi.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [settingsNavi.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    tabBarController = [[TabBarController alloc]init];
    NSArray *ver = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
    if ([[ver objectAtIndex:0] intValue] >= 7) {
        
        assetNavi.navigationBar.barTintColor = [CommonHelpers getTintColor];
        assetNavi.navigationBar.translucent = NO;
        takePhotoNavi.navigationBar.barTintColor = [CommonHelpers getTintColor];
        takePhotoNavi.navigationBar.translucent = NO;
        settingsNavi.navigationBar.barTintColor = [CommonHelpers getTintColor];
        settingsNavi.navigationBar.translucent = NO;
        [tabBarController.tabBar setTranslucent:NO];
        tabBarController.tabBar.tintColor = [UIColor whiteColor];
        tabBarController.tabBar.barTintColor = [CommonHelpers getTintColor];
    }else {
        tabBarController.tabBar.tintColor = [CommonHelpers getTintColor];
        assetNavi.navigationBar.tintColor = [CommonHelpers getTintColor];
        takePhotoNavi.navigationBar.tintColor = [CommonHelpers getTintColor];
        settingsNavi.navigationBar.tintColor = [CommonHelpers getTintColor];
    }

    [[UINavigationBar appearance] setTitleTextAttributes :
     [NSDictionary dictionaryWithObjectsAndKeys :[UIColor whiteColor] , UITextAttributeTextColor,
    [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8 ] ,UITextAttributeTextShadowColor,
    [ NSValue valueWithUIOffset : UIOffsetMake (0,1)], UITextAttributeTextShadowOffset,
      [CommonHelpers getSystemFontWithSize:NAVIBAR_FONT_SIZE],UITextAttributeFont, nil]];
    
    tabBarController.tabBar.selectedImageTintColor = [UIColor whiteColor];
    tabBarController.moreNavigationController.navigationBar.tintColor = [UIColor blackColor];
    NSArray* arrayVC = [[NSArray alloc]initWithObjects:assetNavi,takePhotoNavi,settingsNavi, nil];
    [tabBarController setViewControllers:arrayVC];
    
    [self.window setRootViewController:tabBarController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma mark ActionDelegate
-(void)reloadTabbar
{
    assetNavi.tabBarItem.title          = [[Language sharedManager] getText:@"TABBAR_ASSET"];
    assetVC.title                       = [[Language sharedManager] getText:@"TABBAR_ASSET"];
    takePhotoNavi.tabBarItem.title      = [[Language sharedManager] getText:@"TABBAR_TAKEPHOTO"];
    takePhotoVC.title                   = [[Language sharedManager] getText:@"TABBAR_TAKEPHOTO"];
    settingsNavi.tabBarItem.title       = [[Language sharedManager] getText:@"TABBAR_SETTINGS"];
    settingsVC.title                    = [[Language sharedManager] getText:@"TABBAR_SETTINGS"];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"AssetManager" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"AssetManager.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end
