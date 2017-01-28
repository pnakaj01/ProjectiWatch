//
//  InterfaceController.m
//  Great Days WatchKit Extension
//
//  Created by Jaspreet on 23/06/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "InterfaceController.h"
#import "Utility.h"



@interface InterfaceController()
{
int i;
BOOL only_once;
NSMutableDictionary *dictionary;
    NSDate *date_of_event;
}
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
     NSLog(@"======%@",context);
    
    NSUserDefaults *myDefaults_second = [[NSUserDefaults alloc]
                                  initWithSuiteName:@"group.developer.newgroup"];
    
    
  //  NSArray*result= [Utility fetchRequest:nil];
    NSArray *str_to_arr=[context componentsSeparatedByString:@"t"];
    dictionary=[[NSMutableDictionary alloc] init];
    if ([[myDefaults_second objectForKey:@"title"] count]>[[str_to_arr lastObject] integerValue])
    {
        [_button setBackgroundImage:[UIImage imageNamed:[[myDefaults_second objectForKey:@"image"] objectAtIndex:[[str_to_arr lastObject]integerValue]]]];
         date_of_event=[[myDefaults_second objectForKey:@"eventDate"] objectAtIndex:[[str_to_arr lastObject]integerValue]];
        [dictionary setValue:[[myDefaults_second objectForKey:@"title"] objectAtIndex:[[str_to_arr lastObject]integerValue]] forKey:@"event_title"];
        [dictionary setValue:[[myDefaults_second objectForKey:@"image"] objectAtIndex:[[str_to_arr lastObject]integerValue]] forKey:@"image"];
        [dictionary setValue:[[myDefaults_second objectForKey:@"eventbar"] objectAtIndex:[[str_to_arr lastObject]integerValue]] forKey:@"eventbar"];
    }
    
   
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)button_action
{
    NSLog(@"it pressesd");
    [self calculate_time];
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
    [self presentControllerWithName:@"secondfacecontroller" context:dictionary];
}


@end
























