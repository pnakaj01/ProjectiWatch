//
//  SettingViewController.m
//  New_Iwatch_app
//
//  Created by Sahil1 on 26/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "SettingViewController.h"
#import "EventBarViewController.h"
#import "StoreViewController.h"
#import "AppDelegate.h"

@implementation SettingViewController
@synthesize switch_obj;

-(void)viewDidLoad
{
    self.navigationController.navigationBarHidden=YES;
    top_img_vw.backgroundColor=[UIColor colorWithRed:0/255.0 green:168/255.0 blue:198/255.0 alpha:1];
    scroll_Vw.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
    txtVw1.userInteractionEnabled=NO;
    txtVw2.userInteractionEnabled=NO;
    NSUInteger count=[_arr_value count];
    lblEvents.text=[NSString stringWithFormat:@"%lu",(unsigned long)count];
}

-(IBAction)event_bar:(id)sender
{
    EventBarViewController *event=[self.storyboard instantiateViewControllerWithIdentifier:@"eventbar"];
    [self.navigationController pushViewController:event animated:YES];
}

-(IBAction)remove_ads:(id)sender
{
    
    EventBarViewController *event=[self.storyboard instantiateViewControllerWithIdentifier:@"eventbar"];
    [self.navigationController pushViewController:event animated:YES];
}

-(IBAction)proffesional_imagepack:(id)sender
{
    StoreViewController *store=[self.storyboard instantiateViewControllerWithIdentifier:@"store"];
    [self.navigationController pushViewController:store animated:YES];
}

-(IBAction)back_btn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)rating:(id)sender
{
    NSString *str = @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa";
    str = [NSString stringWithFormat:@"%@/wa/viewContentsUserReviews?", str];
    str = [NSString stringWithFormat:@"%@type=Purple+Software&id=", str];
    str = [NSString stringWithFormat:@"%@988383516", str];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
- (IBAction)toggle:(id)sender
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"new_key"])
    {
        NSLog(@"disable");
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"new_key"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"disable" object:nil];
    }
    else
    {
        NSLog(@"enable");
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"new_key"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"disable" object:nil];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"bool===%hhd",[[NSUserDefaults standardUserDefaults] boolForKey:@"new_key"]);
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"new_key"])
    {
        [switch_obj setOn:YES animated:YES];
    }
    else
    {
        [switch_obj setOn:NO animated:YES];
    }
}


@end
