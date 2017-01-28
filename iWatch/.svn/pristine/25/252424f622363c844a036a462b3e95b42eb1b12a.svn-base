//
//  secondfacecontroller.m
//  iwatch30may
//
//  Created by Jaspreet on 07/07/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "secondfacecontroller.h"
#import "MainInterfaceController.h"


@interface secondfacecontroller()
{
    int i;
    BOOL only_once;
    NSMutableDictionary *dictionary;
    NSDate *date_of_event;
    BOOL once;
    NSTimer* myTimer;
}
@end


@implementation secondfacecontroller

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    
   
    
    NSLog(@"======%@",context);
    
    NSLog(@"%@",global_dic);
    NSArray *str_to_arr=[context componentsSeparatedByString:@"t"];
    
    
    if ([[global_dic objectForKey:@"title"] count]-1==[[str_to_arr lastObject] integerValue])
    {
        myTimer = [NSTimer scheduledTimerWithTimeInterval: 60.0 target: self
                                                          selector: @selector(YourFunctionName) userInfo: nil repeats: YES];
    }
    
    dictionary=[[NSMutableDictionary alloc] init];
    if ([[global_dic objectForKey:@"title"] count]>[[str_to_arr lastObject] integerValue])
    {
      
        date_of_event=[[global_dic objectForKey:@"eventDate"] objectAtIndex:[[str_to_arr lastObject]integerValue]];
        [dictionary setValue:[[global_dic objectForKey:@"title"] objectAtIndex:[[str_to_arr lastObject]integerValue]] forKey:@"event_title"];
        
        
        if ([[[global_dic objectForKey:@"image"] objectAtIndex:[[str_to_arr lastObject]integerValue]] rangeOfString:@"20"].location == NSNotFound)
        {
            
            
            
            NSString *new_image;
            if ([[[global_dic objectForKey:@"image"] objectAtIndex:[[str_to_arr lastObject]integerValue]] rangeOfString:@"extraipad.png"].location != NSNotFound)
            {
                new_image =[[[global_dic objectForKey:@"image"] objectAtIndex:[[str_to_arr lastObject]integerValue]] stringByReplacingOccurrencesOfString:@"extraipad.png" withString:@"extra.png"];
                
                [dictionary setValue:new_image forKey:@"image"];
            }
            else
            {
                [dictionary setValue:[[global_dic objectForKey:@"image"] objectAtIndex:[[str_to_arr lastObject]integerValue]] forKey:@"image"];
            }
        }
        else
        {
            [dictionary setValue:@"default.png" forKey:@"image"];
        }
        
        [dictionary setValue:[[global_dic objectForKey:@"eventbar"] objectAtIndex:[[str_to_arr lastObject]integerValue]] forKey:@"eventbar"];
    }
    
    [self calculate_time];
    
    
    
    
    
    
    
    
    
    
    
    [_group setBackgroundImage:[UIImage imageNamed:[dictionary valueForKey:@"image"]]];
    [_unit_label setText:[dictionary valueForKey:@"unit"]];
    [_event_title setText:[dictionary valueForKey:@"event_title"]];
    [_label_in_yellow setText:[dictionary valueForKey:@"time_left"]];
    NSLog(@"%@",[dictionary valueForKey:@"eventbar"]);
    
   NSArray *arrSecond = [[dictionary valueForKey:@"eventbar"] componentsSeparatedByString:@"_"];
    NSLog(@"%@",arrSecond);
    if ([arrSecond containsObject:@"pantagun.png"])
    {
         [_group_for_yellow_image setBackgroundImage:[UIImage imageNamed:@"event_pantagun"]];
    }
    else if ([arrSecond containsObject:@"baloon.png"])
    {
         [_group_for_yellow_image setBackgroundImage:[UIImage imageNamed:@"event_baloon"]];
    }
    else if ([arrSecond containsObject:@"bag.png"])
    {
        [_group_for_yellow_image setBackgroundImage:[UIImage imageNamed:@"event_bag"]];
    }
    else if ([arrSecond containsObject:@"hand.png"])
    {
        [_group_for_yellow_image setBackgroundImage:[UIImage imageNamed:@"event_hand"]];
    }
    else if ([arrSecond containsObject:@"sun.png"])
    {
        [_group_for_yellow_image setBackgroundImage:[UIImage imageNamed:@"event_sun"]];
    }
}





-(void)calculate_time
{
    
    NSDate *date1=[NSDate date];
    NSTimeInterval distanceBetweenDates = [date_of_event timeIntervalSinceDate:date1];
    double secondsInAnHour = 3600*24;
    double sec = 3600;
    double min=60;
    
    NSInteger daysBetweenDates = distanceBetweenDates / secondsInAnHour;
    NSUInteger hoursBetweenDates=distanceBetweenDates / sec;
    NSUInteger minutebetweenDates=distanceBetweenDates/min;
    
    if (hoursBetweenDates==0)
    {
        [dictionary setValue:[NSString stringWithFormat:@"%ld",(unsigned long)minutebetweenDates] forKey:@"time_left"];
        [dictionary setValue:@"Minute left" forKey:@"unit"];
    }
    else if (daysBetweenDates==0)
    {
        [dictionary setValue:[NSString stringWithFormat:@"%lu",(unsigned long)hoursBetweenDates] forKey:@"time_left"];
        [dictionary setValue:@"Hour left" forKey:@"unit"];
    }
    else
    {
        [dictionary setValue:[NSString stringWithFormat:@"%ld",(long)daysBetweenDates] forKey:@"time_left"];
        [dictionary setValue:@"Days left" forKey:@"unit"];
    }
    
}




- (void)willActivate {

  
    
    [super willActivate];
}

- (void)didDeactivate {

    
    [super didDeactivate];
}



-(void)YourFunctionName
{
        [myTimer invalidate];
        NSMutableArray *controller_name_mutable=[[NSMutableArray alloc] init];
        NSMutableArray *contexts_mutable=[[NSMutableArray alloc] init];
        [controller_name_mutable addObject:@"MainInterfaceController"];
        [contexts_mutable addObject:@"a"];
        [WKInterfaceController reloadRootControllersWithNames:controller_name_mutable contexts:contexts_mutable];

}
@end



