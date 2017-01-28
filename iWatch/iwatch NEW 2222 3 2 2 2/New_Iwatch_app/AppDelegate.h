//
//  AppDelegate.h
//  New_Iwatch_app
//
//  Created by Sahil1 on 19/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppNextUIView.h"



int first;
AppNextUIView *appNextView;
BOOL bool_from_appdelegate;
NSDictionary  *dictionary_for_delegate;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//
//- (void)saveContext;
//- (NSURL *)applicationDocumentsDirectory;
//-(void)disable;
//-(void)enable;



@end

