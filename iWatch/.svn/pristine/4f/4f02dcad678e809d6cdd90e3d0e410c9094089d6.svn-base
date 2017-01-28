//
//  AppDelegate.m
//  New_Iwatch_app
//
//  Created by Sahil1 on 19/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "AppDelegate.h"
#import "AppsFlyerTracker.h"
#import "Utility.h"




@interface AppDelegate ()
{
    NSURL *storeURL;
    NSURL *storeURL2;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    first=1;
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    UILocalNotification *locationNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (locationNotification)
    {
        application.applicationIconBadgeNumber = 0;
    }
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)])
    {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
    
    pro=[[Proxy alloc] init];
    
        [pro registerForiCloudNotifications];
    
    [AppsFlyerTracker sharedTracker].appsFlyerDevKey = @"4SyX4cjXscUTYrmyntapUT";
    [AppsFlyerTracker sharedTracker].appleAppID = @"988383516";
    
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"only_once"]isEqualToString:@"yeah"])
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"yeah" forKey:@"only_once"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"new_key"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    
    
    return YES;
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    
    UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Event" message:notification.alertBody delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alert show];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"update_array" object:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    //  [appNextView removeFromSuperview];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [[AppsFlyerTracker sharedTracker] trackAppLaunch];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"update_array" object:nil];
    
    
    // [appNextView removeFromSuperview];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    //    [self saveContext];
    
}



- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void ( ^)( NSDictionary * ))reply
{
    dictionary_for_delegate=[[NSMutableDictionary alloc] init];
    __block UIBackgroundTaskIdentifier watchKitHandler;
    watchKitHandler = [[UIApplication sharedApplication] beginBackgroundTaskWithName:@"backgroundTask"
                                                                   expirationHandler:^{
                                                                       watchKitHandler = UIBackgroundTaskInvalid;
                                                                   }];
    
    if ( [[userInfo objectForKey:@"request"] isEqualToString:@"getData"] )
    {
        // get data
        // ...
        NSUserDefaults *myDefaults = [[NSUserDefaults alloc]
                      initWithSuiteName:@"group.developer.newgroup"];
        [dictionary_for_delegate setValue:[myDefaults valueForKey:@"eventDate"]  forKey:@"eventDate"];
        [dictionary_for_delegate setValue:[myDefaults valueForKey:@"title"]  forKey:@"title"];
        [dictionary_for_delegate setValue:[myDefaults valueForKey:@"image"]  forKey:@"image"];
        [dictionary_for_delegate setValue:[myDefaults valueForKey:@"eventbar"]  forKey:@"eventbar"];
        reply( dictionary_for_delegate);
    }
    
    dispatch_after( dispatch_time( DISPATCH_TIME_NOW, (int64_t)NSEC_PER_SEC * 1 ), dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^{
        [[UIApplication sharedApplication] endBackgroundTask:watchKitHandler];
    } );
}







//#pragma mark - Core Data stack
//
//@synthesize managedObjectContext = _managedObjectContext;
//@synthesize managedObjectModel = _managedObjectModel;
//@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
//
//- (NSURL *)applicationDocumentsDirectory {
//    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.demo2.trigma.New_Iwatch_app" in the application's documents directory.
//    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
//}
//
//- (NSManagedObjectModel *)managedObjectModel {
//    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
//    if (_managedObjectModel != nil) {
//        return _managedObjectModel;
//    }
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"New_Iwatch_app" withExtension:@"momd"];
//    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
//    return _managedObjectModel;
//}
//
//- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
//    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
//    if (_persistentStoreCoordinator != nil) {
//        return _persistentStoreCoordinator;
//    }
//
//    // Create the coordinator and store
//
//    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
//    storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"New_Iwatch_app.sqlite"];
//    NSError *error = nil;
//    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
//    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:[self iCloudPersistentStoreOptions] error:&error])
//    {
//        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
//        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
//        dict[NSUnderlyingErrorKey] = error;
//        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        abort();
//    }
//
//    return _persistentStoreCoordinator;
//}
//
//
//- (NSManagedObjectContext *)managedObjectContext {
//    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
//    if (_managedObjectContext != nil) {
//        return _managedObjectContext;
//    }
//
//    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
//    if (!coordinator)
//    {
//        return nil;
//    }
//    _managedObjectContext = [[NSManagedObjectContext alloc] init];
//    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
//    return _managedObjectContext;
//}
//
//#pragma mark - Core Data Saving support
//
//- (void)saveContext {
//    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
//    if (managedObjectContext != nil)
//    {
//        NSError *error = nil;
//        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
//            // Replace this implementation with code to handle the error appropriately.
//            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//            abort();
//        }
//    }
//}
//
//
//#pragma mark - Notification Observers
//- (void)registerForiCloudNotifications {
//    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
//
//    [notificationCenter addObserver:self
//                           selector:@selector(storesWillChange:)
//                               name:NSPersistentStoreCoordinatorStoresWillChangeNotification
//                             object:self.persistentStoreCoordinator];
//
//    [notificationCenter addObserver:self
//                           selector:@selector(storesDidChange:)
//                               name:NSPersistentStoreCoordinatorStoresDidChangeNotification
//                             object:self.persistentStoreCoordinator];
//
//    [notificationCenter addObserver:self
//                           selector:@selector(persistentStoreDidImportUbiquitousContentChanges:)
//                               name:NSPersistentStoreDidImportUbiquitousContentChangesNotification
//                             object:self.persistentStoreCoordinator];
//
//    [notificationCenter addObserver:self
//                           selector:@selector(disable)
//                               name:@"disable"
//                             object:nil];
//
//    [notificationCenter addObserver:self
//                           selector:@selector(enable)
//                               name:@"enable"
//                             object:nil];
//}


//# pragma mark - iCloud Support
//- (NSDictionary *)iCloudPersistentStoreOptions
//{
//    NSDictionary *options;
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSURL *ubiquityContainerURL = [fileManager URLForUbiquityContainerIdentifier:nil];
//    if (!ubiquityContainerURL)
//    {
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enable iCloud Drive from setting for sync" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//        options=@{};
//        return options;
//    }
//
//    storeURL2 = [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
//    options= @{NSPersistentStoreUbiquitousContentNameKey : @"iCloudData",
//               NSPersistentStoreUbiquitousContentURLKey : storeURL2};
//    return options;
//}
//
//- (void) persistentStoreDidImportUbiquitousContentChanges:(NSNotification *)changeNotification
//{
//   // NSLog(@"%@",changeNotification);
//        NSManagedObjectContext *context = [self managedObjectContext];
//    dispatch_async(dispatch_get_main_queue(), ^(void) {
//        [context mergeChangesFromContextDidSaveNotification:changeNotification];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"update_array" object:nil];
//    });
//}
//
//- (void)storesWillChange:(NSNotification *)notification
//{
//    NSManagedObjectContext *context = self.managedObjectContext;
//    dispatch_async(dispatch_get_main_queue(), ^(void) {
//    NSError *error;
//        if ([context hasChanges])
//        {
//            BOOL success = [context save:&error];
//            if (!success && error)
//            {
//                NSLog(@"%@",[error localizedDescription]);
//            }
//        }
//        [context reset];
//    });
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"update_array" object:nil];
//}
//
//- (void)storesDidChange:(NSNotification *)notification
//{
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"update_array" object:nil];
//}
//
//
//-(void)disable
//{
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSURL *new_storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"New_Iwatch_app.sqlite"];
//    NSError *error = nil;
//
//    NSArray *stores = [_persistentStoreCoordinator persistentStores];
//    for (int i=0; i < [stores count]; i++) {
//        [_persistentStoreCoordinator removePersistentStore:[stores objectAtIndex:i] error:&error];
//    }
//
//    //Determine availability.  If nil, service is currently unavailable
//    NSURL *cloudURL = [fileManager URLForUbiquityContainerIdentifier:nil];
//    if (!cloudURL)
//    {
//        NSLog(@"iCloud currently unavailable.");
//    }
//
//    //Check if user setting has been set
//    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"new_key"])
//    {
//        BOOL defaultValue = (cloudURL == nil) ? NO : YES;
//        [[NSUserDefaults standardUserDefaults] setBool:defaultValue forKey:@"new_key"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//    }
//
//    //Set options based on availability and use settings
//    BOOL cloudEnabled = [[NSUserDefaults standardUserDefaults] boolForKey:@"new_key"];
//    NSDictionary *options = nil;
//
//    if (cloudEnabled && cloudURL) {
//        NSLog(@"Enabling iCloud Sync in Persistent Store");
//        options = [NSDictionary dictionaryWithObjectsAndKeys:
//                   @"iCloudData", NSPersistentStoreUbiquitousContentNameKey,
//                   cloudURL, NSPersistentStoreUbiquitousContentURLKey,
//                   [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
//                   [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,
//                   nil];
//    }
//
//    //Add the store with appropriate options
//    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:new_storeURL options:options error:&error])
//    {
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        abort();
//    }
//}



@end
