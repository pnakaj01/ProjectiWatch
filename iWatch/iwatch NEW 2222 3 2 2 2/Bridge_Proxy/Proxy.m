//
//  Proxy.m
//  iwatch30may
//
//  Created by Jaspreet on 17/07/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "Proxy.h"
NSURL *storeURL;
NSURL *storeURL2;
@implementation Proxy

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.demo2.trigma.New_Iwatch_app" in the application's documents directory.
    
    
    return [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.developer.newgroup"];
    
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"New_Iwatch_app" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"New_Iwatch_app.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:[self iCloudPersistentStoreOptions] error:&error]) {
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


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator)
    {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


#pragma mark - Notification Observers
- (void)registerForiCloudNotifications {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    [notificationCenter addObserver:self
                           selector:@selector(storesWillChange:)
                               name:NSPersistentStoreCoordinatorStoresWillChangeNotification
                             object:self.persistentStoreCoordinator];
    
    [notificationCenter addObserver:self
                           selector:@selector(storesDidChange:)
                               name:NSPersistentStoreCoordinatorStoresDidChangeNotification
                             object:self.persistentStoreCoordinator];
    
    [notificationCenter addObserver:self
                           selector:@selector(persistentStoreDidImportUbiquitousContentChanges:)
                               name:NSPersistentStoreDidImportUbiquitousContentChangesNotification
                             object:self.persistentStoreCoordinator];
    
    [notificationCenter addObserver:self
                           selector:@selector(disable)
                               name:@"disable"
                             object:nil];
    
//    [notificationCenter addObserver:self
//                           selector:@selector(enable)
//                               name:@"enable"
//                             object:nil];
}


# pragma mark - iCloud Support
- (NSDictionary *)iCloudPersistentStoreOptions
{
    NSDictionary *options;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *ubiquityContainerURL = [fileManager URLForUbiquityContainerIdentifier:nil];
    if (!ubiquityContainerURL)
    {
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enable iCloud Drive from setting for sync" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
        options=@{};
        return options;
    }
    
    storeURL2 = [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
    options= @{NSPersistentStoreUbiquitousContentNameKey : @"iCloudData",
               NSPersistentStoreUbiquitousContentURLKey : storeURL2};
    return options;
}

- (void) persistentStoreDidImportUbiquitousContentChanges:(NSNotification *)changeNotification
{
    // NSLog(@"%@",changeNotification);
    NSManagedObjectContext *context = [self managedObjectContext];
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [context mergeChangesFromContextDidSaveNotification:changeNotification];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"update_array" object:nil];
    });
}

- (void)storesWillChange:(NSNotification *)notification
{
    NSManagedObjectContext *context = self.managedObjectContext;
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        NSError *error;
        if ([context hasChanges])
        {
            BOOL success = [context save:&error];
            if (!success && error)
            {
                NSLog(@"%@",[error localizedDescription]);
            }
        }
        [context reset];
    });
    [[NSNotificationCenter defaultCenter] postNotificationName:@"update_array" object:nil];
}

- (void)storesDidChange:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"update_array" object:nil];
}


-(void)disable
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *new_storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"New_Iwatch_app.sqlite"];
    NSError *error = nil;
    
    NSArray *stores = [_persistentStoreCoordinator persistentStores];
    for (int i=0; i < [stores count]; i++) {
        [_persistentStoreCoordinator removePersistentStore:[stores objectAtIndex:i] error:&error];
    }
    
    //Determine availability.  If nil, service is currently unavailable
    NSURL *cloudURL = [fileManager URLForUbiquityContainerIdentifier:nil];
    if (!cloudURL)
    {
        NSLog(@"iCloud currently unavailable.");
    }
    
    //Check if user setting has been set
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"new_key"])
    {
        BOOL defaultValue = (cloudURL == nil) ? NO : YES;
        [[NSUserDefaults standardUserDefaults] setBool:defaultValue forKey:@"new_key"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    //Set options based on availability and use settings
    BOOL cloudEnabled = [[NSUserDefaults standardUserDefaults] boolForKey:@"new_key"];
    NSDictionary *options = nil;
    
    if (cloudEnabled && cloudURL) {
        NSLog(@"Enabling iCloud Sync in Persistent Store");
        options = [NSDictionary dictionaryWithObjectsAndKeys:
                   @"iCloudData", NSPersistentStoreUbiquitousContentNameKey,
                   cloudURL, NSPersistentStoreUbiquitousContentURLKey,
                   [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                   [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,
                   nil];
    }
    
    //Add the store with appropriate options
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:new_storeURL options:options error:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}



@end
