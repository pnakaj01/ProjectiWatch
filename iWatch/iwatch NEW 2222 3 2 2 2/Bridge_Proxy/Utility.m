//
//  Utility.m
//  DeliveryOnTime
//
//  Created by Office on 02/03/15.
//  Copyright (c) 2015 Office. All rights reserved.
//

#import "Utility.h"
#import "constant.h"
#import <CoreData/CoreData.h>
#import "Event.h"
//#import "AppDelegate.h"

@implementation Utility
+(NSArray *)fetchRequest:(NSPredicate *)predicate
{
    if (!pro)
    {
        pro=[[Proxy alloc] init];
        //[pro registerForiCloudNotifications];
    }
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:[pro managedObjectContext]];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    NSError *error = nil;
    NSArray* result = [[pro managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    //NSLog(@"%@",result);
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);

    } else {
       // NSLog(@"core data array count=%lu", (unsigned long)[result count]);
    }
    return result;
}
+(NSArray *)fetchrequest_sorted:(NSMutableDictionary *)dict1
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:[pro managedObjectContext]];
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:[dict1 valueForKey:@"predicate"]];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:[dict1 valueForKey:@"sort"]]];
    NSError *error = nil;
    NSArray* result = [[pro managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
      //  NSLog(@"%@", result);
    }

    return result;
}
+(void)insertdata:(NSMutableDictionary *)dict
{
    NSManagedObjectContext* context=[pro managedObjectContext];
    Event* data=[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:context];
    
    data.title=[dict valueForKey:@"title"];
    
    NSString*str=[dict valueForKey:@"daysLeft"];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterNoStyle;
    NSNumber *myNumber = [f numberFromString:str];
   
    data.date=myNumber;
    
    data.image=[dict valueForKey:@"image_data"];
    
    data.image2=[dict valueForKey:@"image_data1"];
    
    
    
    data.createdOn=[dict valueForKey:@"date"];
    
    data.modifiedOn=[dict valueForKey:@"date"];
    
    data.eventDate=[dict valueForKey:@"eventDate"];
    
    data.alpha=[dict valueForKey:@"alpha"];
    
    data.notificationDate=[dict valueForKey:@"notificationDate"];
    
    data.notOnOff=[dict valueForKey:@"notOnOff"];
    
    data.eventbarlargeimage=[dict valueForKey:@"eventbarlargeimage"];
    
    data.eventbarsmallimage=[dict valueForKey:@"eventbarsmallimage"];
    
    data.ringtoneName=[dict valueForKey:@"ringtoneName"];
    
    data.inAppBaloonStatus=[dict valueForKey:@""];
    
    data.inAppBagStatus=[dict valueForKey:@""];
    
    data.inAppHandStatus=[dict valueForKey:@""];
    
    data.inAppSunStatus=[dict valueForKey:@""];
    
    data.device_id=[dict valueForKey:@"device_id"];
    
    data.x=[dict valueForKey:@"x"];
    data.y=[dict valueForKey:@"y"];
    
    NSError *error1;
    if (![context save:&error1]) {
        NSLog(@"Whoops, couldn't save: %@", [error1 localizedDescription]);
    }
    else
    {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"poproot" object:nil];
    }
}


+(void)delete:(NSString *)str_image and_Sec:(NSString *)str_image1  and_str:(NSString *)str_title and_controller:(UIViewController *)view_controller
{

    NSPredicate *issuePredicate = [NSPredicate predicateWithFormat:@"image ==%@ AND image2 ==%@  AND title ==%@ ", str_image,str_image1,str_title];
    NSArray *result=[Utility fetchRequest:issuePredicate];
    [[pro managedObjectContext] deleteObject:[result objectAtIndex:0]];
    NSError *error = nil;
    if (![[pro managedObjectContext] save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return;
    }
    else
    {
//        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Event deleted successfully" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
        [view_controller.navigationController popToRootViewControllerAnimated:YES];
    }

}

@end
