//
//  MainInterfaceController.m
//  iwatch30may
//
//  Created by Jaspreet on 07/07/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "MainInterfaceController.h"
#import "Utility.h"
//#import "MMWormhole.h"



@interface MainInterfaceController()
{
  //  NSUserDefaults *myDefaults;
}
@end


@implementation MainInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    

    
    
    NSDictionary *requst = @{ @"request" : @"getData" };
    [WKInterfaceController openParentApplication:requst
                                           reply:^( NSDictionary *replyInfo, NSError *error ) {
                                               NSLog(@"%@",replyInfo);
                                               
                                               
                                               if ([[replyInfo objectForKey:@"eventDate"] count]>0)
                                               {
                                                   NSDateFormatter *date_format=[[NSDateFormatter alloc]init];
                                                   [date_format  setDateFormat:@"MM/dd/yy:hh:mm"];
                                                   NSDate *current_time=[date_format dateFromString:[date_format stringFromDate:[NSDate date]]];
                                                   for (int i=0; i<[[replyInfo objectForKey:@"eventDate"] count]; i++)
                                                   {
                                                       NSDate *eventDate=[[replyInfo objectForKey:@"eventDate"] objectAtIndex:i];
                                                       if ([eventDate compare:current_time] == NSOrderedDescending)
                                                       {
                                                       }
                                                       else
                                                       {
                                                           [self delete_previous_events:[[replyInfo objectForKey:@"title"] objectAtIndex:i]];
                                                       }
                                                   }
                                               }
                                               
                                               [self pagination:replyInfo];
                                               
                                               
                                               
                                           }];

    
        
}



-(void)delete_previous_events:(NSString*)obj
{
    
    NSPredicate *issuePredicate = [NSPredicate predicateWithFormat:@"title ==%@ ", obj];
    NSArray *result=[Utility fetchRequest:issuePredicate];
    [[pro managedObjectContext] deleteObject:[result objectAtIndex:0]];
    NSError *error = nil;
    if (![[pro managedObjectContext] save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return;
    }
    else
    {
        NSLog(@"deleted titles=%@",obj);
    }
}


-(void)pagination:(NSDictionary*)dic
{
   // NSArray*result= [Utility fetchRequest:nil];
    
    global_dic=[[NSMutableDictionary alloc] init];
    global_dic=[dic mutableCopy];
    
    NSMutableArray *controller_name_mutable=[[NSMutableArray alloc] init];
    NSMutableArray *contexts_mutable=[[NSMutableArray alloc] init];
    if ([[dic objectForKey:@"eventDate"] count]>0)
    {
        for (int i=0; i<[[dic objectForKey:@"eventDate"] count]; i++)
        {
            NSLog(@"===%d",i);
            [controller_name_mutable addObject:@"secondfacecontroller"];
            [contexts_mutable addObject:[NSString stringWithFormat:@"context%i",i]];
        }
    }
    
    [WKInterfaceController reloadRootControllersWithNames:controller_name_mutable contexts:contexts_mutable];
    
    
    
    if ([[dic objectForKey:@"eventDate"] count]==0)
    {
        
                [self performSelector:@selector(call_awake)
                   withObject:nil
                   afterDelay:10];
    }
    
}

-(void)call_awake
{
    [self awakeWithContext:nil];
}

- (void)willActivate {

    [super willActivate];
}

- (void)didDeactivate {

    [super didDeactivate];
}

@end



