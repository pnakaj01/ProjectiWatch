//
//  Proxy.h
//  iwatch30may
//
//  Created by Jaspreet on 17/07/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Proxy : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
-(void)registerForiCloudNotifications;
@end
