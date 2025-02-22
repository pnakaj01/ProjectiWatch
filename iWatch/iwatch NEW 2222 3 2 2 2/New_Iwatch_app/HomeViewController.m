//
//  HomeViewController.m
//  NewIwatch_app
//
//  Created by Sahil1 on 16/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "HomeViewController.h"
#import "AddEventViewController.h"
#import "SettingViewController.h"
#import "FullEventViewController.h"
#import "AsyncImageView.h"
//#import "MMWormhole.h"

@interface HomeViewController ( )
{
    NSString *currentDeviceId;
    NSTimer *timer;
    NSNumber *value;
}
@end

@implementation HomeViewController


#pragma mark lets do it with new project
#pragma mark without proxy

- (void)viewDidLoad
{
    [super viewDidLoad];
        UIDevice *device = [UIDevice currentDevice];
    currentDeviceId = [[device identifierForVendor]UUIDString];
    self.navigationController.navigationBarHidden=YES;
    topimgVw.backgroundColor=[UIColor colorWithRed:0/255.0 green:168/255.0 blue:198/255.0 alpha:1];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(viewWillAppear:)
                                                 name:@"update_array"
                                               object:nil];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    
    bool_from_appdelegate=NO;
    
    value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    
    [collectionVwImages removeFromSuperview];
    [btn_event removeFromSuperview];
    
    UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 5.0f;
    layout.minimumLineSpacing = 5.0f;
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];

   
    collectionVwImages= [[UICollectionView alloc]initWithFrame:CGRectMake(0 , 64, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    collectionVwImages.backgroundColor = [UIColor clearColor];
    [collectionVwImages registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    collectionVwImages.delegate=self;
    collectionVwImages.dataSource=self;
    collectionVwImages.hidden=NO;
    [self.view addSubview:collectionVwImages];
    NSString*str1=@"NO";
    str1=[[NSUserDefaults standardUserDefaults]valueForKey:@"value_save"];
    array_result=[[NSMutableArray alloc]init];
    array_data=[NSMutableArray new];
    notification_array=[[UIApplication sharedApplication]scheduledLocalNotifications];
    
    NSArray*result= [Utility fetchRequest:nil];
   
    
    
    
  
  

    
   
    
    if (result)
    {

        for (int i=0; i<[result count]; i++)
        {
            NSDate *eventDate=[[result objectAtIndex:i] valueForKey:@"eventDate"];
            if ([eventDate compare:[NSDate date]] == NSOrderedDescending)
            {
                [array_result addObject:[result objectAtIndex:i]];
            }
            else
            {
                [self delete_previous_events:[[result objectAtIndex:i] valueForKey:@"title"]];
            }
        }
    }
    
    if ([array_result count]==0)
    {
        collectionVwImages.hidden=YES;
        btn_event=[UIButton buttonWithType:UIButtonTypeCustom];
        btn_event.frame=CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64);
        [btn_event setBackgroundImage:[UIImage imageNamed:@"upload-event.png"] forState:UIControlStateNormal];
        [btn_event addTarget:self action:@selector(Addevent:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn_event];
    }
    
    
    if ([array_result count]>0)
    {
        if (![[[array_result objectAtIndex:0]valueForKey:@"device_id"]isEqualToString:currentDeviceId])
        {
            [[UIApplication sharedApplication] cancelAllLocalNotifications];
            for (int i=0; i<[array_result count]; i++)
            {
                UILocalNotification* reminderNote=[[UILocalNotification alloc]init];
                reminderNote.fireDate = [[array_result objectAtIndex:i]valueForKey:@"eventDate"];
                reminderNote.repeatInterval = 0;
                reminderNote.alertBody = [[array_result objectAtIndex:i]valueForKey:@"title"];
                reminderNote.alertAction = @"View";
                reminderNote.soundName = [NSString stringWithFormat:@"%@.m4r",[[array_result objectAtIndex:i]valueForKey:@"ringtoneName"]];
                NSLog(@"ring tone=%@",reminderNote.soundName);
                NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSDate date], @"notificationDate", nil];
                reminderNote.userInfo=infoDict;
                NSLog(@"%@",reminderNote.fireDate);
                [[UIApplication sharedApplication] scheduleLocalNotification:reminderNote];
            }
        }
    }
    
    
    
    
    
    
    
    
     NSArray *result_newly= [Utility fetchRequest:nil];
//    NSLog(@"images in iwatch are=%@",[result_newly valueForKey:@"image"]);
//    NSLog(@"title in iwatch are=%@",[result_newly valueForKey:@"title"]);
//    NSLog(@"eventDate in iwatch are=%@",[result_newly valueForKey:@"eventDate"]);
//    NSLog(@"eventbarlargeimage in iwatch are=%@",[result_newly valueForKey:@"eventbarlargeimage"]);
    NSUserDefaults *myDefaults = [[NSUserDefaults alloc]
                                  initWithSuiteName:@"group.developer.newgroup"];
    [myDefaults setObject:[result_newly valueForKey:@"eventDate"] forKey:@"eventDate"];
    [myDefaults setObject:[result_newly valueForKey:@"title"] forKey:@"title"];
    [myDefaults setObject:[result_newly valueForKey:@"image"] forKey:@"image"];
    [myDefaults setObject:[result_newly valueForKey:@"eventbarlargeimage"] forKey:@"eventbar"];
    [myDefaults synchronize];
    
    
    
    [self.appNextView1 showPopup];
}

-(IBAction)setting_btn:(id)sender
{
    SettingViewController *setting=[self.storyboard instantiateViewControllerWithIdentifier:@"setting"];
    setting.arr_value=array_result;
    [self.navigationController pushViewController:setting animated:YES];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   
    return  [array_result count];
}

#pragma mark cell for row
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
   
    float new_x=[[[array_result objectAtIndex:indexPath.row]valueForKey:@"x"] intValue]*1.7;
     float new_y=[[[array_result objectAtIndex:indexPath.row]valueForKey:@"y"] intValue];
    
    
    static NSString *identifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    img_vw=nil;
    imgVw_days=nil;
    lbldaysleft=nil;
    lbltext=nil;
    TxtVwtitle=nil;
    if ([cell.contentView viewWithTag:10001])
    {
        img_vw=(UIImageView*)[cell.contentView viewWithTag:10001];
        imgVw_days=(UIImageView *)[cell.contentView viewWithTag:10002];
        lbldaysleft=(UILabel *)[cell.contentView viewWithTag:10003];
        lbltext=(UILabel *)[cell.contentView viewWithTag:10004];
        TxtVwtitle=(UILabel *)[cell.contentView viewWithTag:10005];
    }
    else
    {
        
        img_vw=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
        img_vw.tag=10001;
        [cell.contentView addSubview:img_vw];
        
        imgVw_days=[[UIImageView alloc]initWithFrame:CGRectMake(10, img_vw.frame.size.height/2+20, 250, 90)];
        imgVw_days.tag=10002;
        [cell.contentView addSubview:imgVw_days];
        
        lbldaysleft=[[UILabel alloc]initWithFrame:CGRectMake(2, 2, 40, 44)];
        lbldaysleft.tag=10003;
        lbldaysleft.textAlignment=NSTextAlignmentCenter;
        [imgVw_days addSubview:lbldaysleft];
        
        lbltext=[[UILabel alloc]initWithFrame:CGRectMake(45, 4, 100, 25)];
        lbltext.tag=10004;
        lbltext.textColor=[UIColor whiteColor];
        lbltext.textAlignment=NSTextAlignmentLeft;
        [imgVw_days addSubview:lbltext];
        
        TxtVwtitle=[[UILabel alloc]initWithFrame:CGRectMake(45, 15, 80, 25)];
        TxtVwtitle.tag=10005;
        TxtVwtitle.textColor=[UIColor whiteColor];
        TxtVwtitle.backgroundColor=[UIColor clearColor];
        TxtVwtitle.userInteractionEnabled=NO;
        [imgVw_days addSubview:TxtVwtitle];
    }
    
    NSString * str_alpha=[[array_result objectAtIndex:indexPath.row]valueForKey:@"alpha"];
    float alpha=[str_alpha floatValue];
    imgVw_days.image=[UIImage imageNamed:@"m1-event-detail1.png"];
    TxtVwtitle.text=[[array_result objectAtIndex:indexPath.row]valueForKey:@"title"];
    imgVw_days.alpha=alpha;
    
    NSDate *date_of_event=[[array_result objectAtIndex:indexPath.row ] valueForKey:@"eventDate"];
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
        lbltext.text=@"Minute left";
        lbldaysleft.text=[NSString stringWithFormat:@"%ld",(unsigned long)minutebetweenDates];
    }
    else if (daysBetweenDates==0)
    {
        lbltext.text=@"Hour left";
        lbldaysleft.text=[NSString stringWithFormat:@"%lu",(unsigned long)hoursBetweenDates];
    }
    else
    {
        lbltext.text=@"Days left";
        lbldaysleft.text=[NSString stringWithFormat:@"%ld",(long)daysBetweenDates];
    }
    
     // TODO:%3 images that is medium
    
    if (indexPath.row%3==0 && [array_result count]!=1)
    {
      
        
        
        
        if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"cam"] || [[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"gal"])
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:[@"/" stringByAppendingString:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"]]];
            img_vw.image=[UIImage imageWithContentsOfFile:getImagePath];
            if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"cam"])
            {
                 img_vw.image=[self imageWithImage_for_cam:img_vw.image scaledToSize:img_vw.image.size andcount_height:3 andcount_width:1  andmode:UIViewContentModeScaleToFill and_number:img_vw.image.imageOrientation];
            }
            else
            {
             img_vw.image=[self imageWithImage_for_gal:img_vw.image scaledToSize:img_vw.image.size andcount_height:3 andcount_width:1  andmode:UIViewContentModeScaleToFill and_number:img_vw.image.imageOrientation];
            }
            
         }
        else
        {
           
            UIImage *img_obj;
            img_obj=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"]];
            img_vw.image=img_obj;

            if (self.view.frame.size.width>500)
            {
                NSString *large;
                if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] rangeOfString:@"_ipad.png"].location == NSNotFound)
                {
                    large =[[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] stringByReplacingOccurrencesOfString:@".png" withString:@"_ipad.png"];
                    img_vw.image=[UIImage imageNamed:large];
                }
                
            }
            
            else
            {
                NSString *large;
                if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] rangeOfString:@"_ipad.png"].location != NSNotFound)
                {
                    large =[[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] stringByReplacingOccurrencesOfString:@"_ipad.png" withString:@".png"];
                    img_vw.image=[UIImage imageNamed:large];
                }

            }

            img_vw.contentMode = UIViewContentModeTop;
            [img_vw setClipsToBounds:YES];
        }
      
        
            imgVw_days.frame=CGRectMake(10, img_vw.frame.size.height/2-20, 250, 90);
            imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
            lbldaysleft.frame=CGRectMake(12, 13, 40, 44);
            lbltext.frame=CGRectMake(75, 13, 100, 25);
            TxtVwtitle.frame=CGRectMake(75, 30, 100, 25);
            [lbldaysleft setFont:[UIFont fontWithName:@"Helvetica" size:22]];
            [lbltext setFont:[UIFont fontWithName:@"Helvetica" size:14]];
            [TxtVwtitle setFont:[UIFont fontWithName:@"Helvetica" size:18]];
           NSString *str=[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"];
           [self label:10 balloonY:10 HX:17 HY:22 BX:8 BY:17 PX:10 PY:13 SX:10 SY:13  str:str];
        
            if ([array_result count]>1)
            {
                NSString *str=[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"];
               

                if (self.view.frame.size.width>500)
                {
                    imgVw_days.frame=CGRectMake(new_x*1.99, new_y/1.58, 395, 129);
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
                    [self label:34 balloonY:42 HX:40 HY:50 BX:34 BY:55 PX:34 PY:42 SX:40 SY:43  str:str];
                    lbltext.frame=CGRectMake(125, 42, 100, 25);
                    TxtVwtitle.frame=CGRectMake(125, 60, 250, 25);
                    [self font];
                }
                else if(self.view.frame.size.width==375)
                {
                    imgVw_days.frame=CGRectMake(new_x*1.85, new_y/2, 213, 70);
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
                    
                    
                    
                    [self label:10 balloonY:10 HX:17 HY:17 BX:8 BY:17 PX:10 PY:13 SX:10 SY:13  str:str];
                    if ([[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]isEqualToString:@"new_hand.png"])
                    {
                        [self label:10 balloonY:10 HX:13 HY:17 BX:8 BY:17 PX:10 PY:13 SX:10 SY:13  str:str];
                    }
                    
                    
                    lbltext.frame=CGRectMake(75, 12, 100, 25);
                    TxtVwtitle.frame=CGRectMake(75, 31, 120, 25);
                }
                
                else
                {
                    imgVw_days.frame=CGRectMake(new_x*1.30, new_y/2, 213, 70);
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
                    
                    [self label:10 balloonY:10 HX:17 HY:17 BX:8 BY:17 PX:10 PY:13 SX:14 SY:13  str:str];
                    if ([[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]isEqualToString:@"new_hand.png"])
                    {
                         [self label:10 balloonY:10 HX:13 HY:17 BX:8 BY:17 PX:10 PY:13 SX:10 SY:13  str:str];
                    }
                    
                    
                    lbltext.frame=CGRectMake(75, 12, 100, 25);
                    TxtVwtitle.frame=CGRectMake(75, 31, 120, 25);
                   
                }
                
                 [self font];
            }
    
    
    
    }
    
    
    else
    {
        // TODO: >4 all small images

        if ([array_result count]>4)
        {
            NSString *str=[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarsmallimage"];

                if (self.view.frame.size.width>500)
                {
                    imgVw_days.frame=CGRectMake(new_x/1.1, new_y/1.2, 213, 70);
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarsmallimage"]];
                    [self label:10 balloonY:10 HX:17 HY:17 BX:8 BY:17 PX:10 PY:12 SX:10 SY:13  str:str];
                    lbldaysleft.textAlignment=NSTextAlignmentCenter;
                    lbltext.frame=CGRectMake(65, 14, 100, 25);
                    TxtVwtitle.frame=CGRectMake(65, 28, 150, 25);
                    [lbldaysleft setFont:[UIFont fontWithName:@"Helvetica" size:17]];
                    [lbltext setFont:[UIFont fontWithName:@"Helvetica" size:11]];
                    [TxtVwtitle setFont:[UIFont fontWithName:@"Helvetica" size:15]];
                }
        
                else if(self.view.frame.size.width==375)
                {
                    imgVw_days.frame=CGRectMake([[[array_result objectAtIndex:indexPath.row]valueForKey:@"x"] intValue], new_y/2, 135, 48);
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarsmallimage"]];
                    [self label:-1 balloonY:0 HX:0 HY:5 BX:-2 BY:7 PX:-1 PY:3 SX:1 SY:3  str:str];
                    lbltext.frame=CGRectMake(50, 7, 100, 25);
                    TxtVwtitle.frame=CGRectMake(50, 20, 80, 25);
                    [lbldaysleft setFont:[UIFont fontWithName:@"Helvetica" size:16]];
                    [lbltext setFont:[UIFont fontWithName:@"Helvetica" size:10]];
                    [TxtVwtitle setFont:[UIFont fontWithName:@"Helvetica" size:14]];
                }
                else
                {
                    imgVw_days.frame=CGRectMake([[[array_result objectAtIndex:indexPath.row]valueForKey:@"x"] intValue]/2,new_y/1.7, 135, 48);
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarsmallimage"]];
                    [self label:-1 balloonY:0 HX:0 HY:5 BX:-2 BY:7 PX:-1 PY:3 SX:1 SY:3  str:str];
                    lbltext.frame=CGRectMake(50, 5, 100, 25);
                    TxtVwtitle.frame=CGRectMake(50, 20, 80, 25);
                    [lbldaysleft setFont:[UIFont fontWithName:@"Helvetica" size:16]];
                    [lbltext setFont:[UIFont fontWithName:@"Helvetica" size:10]];
                    [TxtVwtitle setFont:[UIFont fontWithName:@"Helvetica" size:14]];
                    
                    if ([str isEqualToString:@"new_half-hand.png"])
                    {
                        imgVw_days.frame=CGRectMake([[[array_result objectAtIndex:indexPath.row]valueForKey:@"x"] intValue]/2, new_y/2, 155, 48);
                        [self label:-1 balloonY:0 HX:3 HY:7 BX:-2 BY:7 PX:-1 PY:3 SX:1 SY:3  str:str];
                        [lbldaysleft setFont:[UIFont fontWithName:@"Helvetica" size:15]];
                    }
                }
        
        }
       
        
         // TODO:  1
        
        if ([array_result count]==1)
            {
                NSLog(@"%ld",(long)indexPath.row);
                img_vw.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"]];
                NSLog(@"%@",[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"]);
                if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"cam"] || [[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"gal"])
                {
                    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                    NSString *documentsDirectory = [paths objectAtIndex:0];
                    NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:[@"/" stringByAppendingString:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"]]];
                    img_vw.image=[UIImage imageWithContentsOfFile:getImagePath];
                    
                    if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"cam"])
                    {
                     img_vw.image=[self imageWithImage_for_cam:img_vw.image scaledToSize:img_vw.image.size andcount_height:1 andcount_width:1  andmode:UIViewContentModeScaleAspectFill and_number:img_vw.image.imageOrientation];
                    }
                    else
                    {
                     img_vw.image=[self imageWithImage_for_gal:img_vw.image scaledToSize:img_vw.image.size andcount_height:1 andcount_width:1  andmode:UIViewContentModeScaleAspectFill and_number:img_vw.image.imageOrientation];
                    }
                   
                   

                    
                     [self font];
                }
                else
                {
               
                    UIImage *img_obj;
                    img_obj=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"]];
                    img_vw.image=img_obj;
                    
                    if (self.view.frame.size.width>500)
                    {
                        NSString *large;
                        if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] rangeOfString:@"_ipad.png"].location == NSNotFound)
                        {
                            large =[[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] stringByReplacingOccurrencesOfString:@".png" withString:@"_ipad.png"];
                            img_vw.image=[UIImage imageNamed:large];
                        }
                        
                    }
                    
                    else
                    {
                        NSString *large;
                        if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] rangeOfString:@"_ipad.png"].location != NSNotFound)
                        {
                            large =[[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] stringByReplacingOccurrencesOfString:@"_ipad.png" withString:@".png"];
                            img_vw.image=[UIImage imageNamed:large];
                        }
                        
                    }
                    
                    img_vw.contentMode = UIViewContentModeTop;
                    [img_vw setClipsToBounds:YES];


                
                 }

                if (self.view.frame.size.width>500)
                {
                    imgVw_days.frame=CGRectMake(new_x*1.99,new_y*2.77, 395, 129);
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
                    NSString *str=[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"];
                    [self label:34 balloonY:42 HX:40 HY:50 BX:34 BY:55 PX:34 PY:42 SX:40 SY:43  str:str];
                    lbldaysleft.textAlignment=NSTextAlignmentCenter;
                    lbltext.frame=CGRectMake(120, 40, 100, 25);
                    TxtVwtitle.frame=CGRectMake(120, 60, 200, 25);
                   
                }
                else if (self.view.frame.size.width==375)
                {
                    imgVw_days.frame=CGRectMake(new_x*1.85, new_y*2.3, 213, 70);
                    
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
                    NSString *str=[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"];
                    [self label:10 balloonY:10 HX:17 HY:17 BX:8 BY:17 PX:12 PY:13 SX:10 SY:13  str:str];
                    lbldaysleft.textAlignment=NSTextAlignmentCenter;
                    lbltext.frame=CGRectMake(75, 12, 100, 25);
                    TxtVwtitle.frame=CGRectMake(75, 31, 120, 25);
                    [self font];
                }
                
                else
                {
                    imgVw_days.frame=CGRectMake(new_x*1.30,new_y*2.19, 213, 70);
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
                    NSString *str=[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"];
                   
                    
                    
                     [self label:10 balloonY:10 HX:17 HY:17 BX:8 BY:17 PX:10 PY:14 SX:10 SY:13  str:str];
                    if ([[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]isEqualToString:@"new_hand.png"])
                    {
                         [self label:10 balloonY:10 HX:13 HY:17 BX:8 BY:17 PX:10 PY:14 SX:10 SY:13  str:str];
                    }

                    
                    
                    lbldaysleft.textAlignment=NSTextAlignmentCenter;
                    lbltext.frame=CGRectMake(75, 12, 100, 25);
                    TxtVwtitle.frame=CGRectMake(75, 31, 120, 25);
                      [self font];
                }
                
            
            
            }
        // TODO:  2,
            else if([array_result count]==2)
            {
                
                
                
                if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"cam"] || [[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"gal"])
                {
                    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
                    NSString *documentsDirectory = [paths objectAtIndex:0];
                    NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:[@"/" stringByAppendingString:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"]]];
                    img_vw.image=[UIImage imageWithContentsOfFile:getImagePath];
                    if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"cam"])
                    {
                        img_vw.image=[self imageWithImage_for_cam:img_vw.image scaledToSize:img_vw.image.size andcount_height:2 andcount_width:1  andmode:UIViewContentModeScaleAspectFill and_number:img_vw.image.imageOrientation];
                    }
                    else
                    {
                    img_vw.image=[self imageWithImage_for_gal:img_vw.image scaledToSize:img_vw.image.size andcount_height:2 andcount_width:1  andmode:UIViewContentModeScaleAspectFill and_number:img_vw.image.imageOrientation];
                    }
                    
                }
                else
                {
                
                    UIImage *img_obj;
                    img_obj=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"]];
                    img_vw.image=img_obj;
                    
                    if (self.view.frame.size.width>500)
                    {
                        NSString *large;
                        if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] rangeOfString:@"_ipad.png"].location == NSNotFound)
                        {
                            large =[[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] stringByReplacingOccurrencesOfString:@".png" withString:@"_ipad.png"];
                            img_vw.image=[UIImage imageNamed:large];
                        }
                        
                    }
                    
                    else
                    {
                        NSString *large;
                        if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] rangeOfString:@"_ipad.png"].location != NSNotFound)
                        {
                            large =[[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] stringByReplacingOccurrencesOfString:@"_ipad.png" withString:@".png"];
                            img_vw.image=[UIImage imageNamed:large];
                        }
                        
                    }
                    
                    img_vw.contentMode = UIViewContentModeTop;
                    [img_vw setClipsToBounds:YES];

                }
                
                 NSString *str=[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"];
                imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];

                if (self.view.frame.size.width>500)
                {
                    imgVw_days.frame=CGRectMake(new_x*1.99, new_y*1.17, 395, 129);
                    [self label:34 balloonY:42 HX:40 HY:50 BX:34 BY:55 PX:34 PY:42 SX:40 SY:43  str:str];
                    lbltext.frame=CGRectMake(120, 42, 100, 25);
                    TxtVwtitle.frame=CGRectMake(120, 60, 200, 25);
                     [self font];
                }
                else if(self.view.frame.size.width==375)
                {
                    imgVw_days.frame=CGRectMake(new_x*1.85, new_y, 213, 70);
                    [self label:10 balloonY:10 HX:17 HY:17 BX:8 BY:17 PX:10 PY:13 SX:10 SY:13  str:str];
                    lbltext.frame=CGRectMake(75, 12, 100, 25);
                    TxtVwtitle.frame=CGRectMake(75, 31, 120, 25);
                       [self font];
                }

                
                else
                {
                   imgVw_days.frame=CGRectMake(new_x*1.30, new_y/1.05, 213, 65);
                    
                    
                    
                    [self label:10 balloonY:7 HX:17 HY:17 BX:8 BY:14 PX:10 PY:10 SX:10 SY:10  str:str];
                    if ([[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]isEqualToString:@"new_hand.png"])
                    {
                        [self label:10 balloonY:7 HX:13 HY:17 BX:8 BY:14 PX:10 PY:10 SX:10 SY:10  str:str];
                    }
                    
                    
                    lbltext.frame=CGRectMake(75, 11, 100, 25);
                    TxtVwtitle.frame=CGRectMake(75, 27, 100, 25);
                    [self font];
                }
       
                
            
            }
            // TODO:  3
            else if ([array_result count]==3)
            {

                if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"cam"] || [[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"gal"])
                {
                    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
                    NSString *documentsDirectory = [paths objectAtIndex:0];
                    NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:[@"/" stringByAppendingString:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"]]];
                    img_vw.image=[UIImage imageWithContentsOfFile:getImagePath];
                    if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"cam"] || [[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] containsString:@"gal"])
                    {
                        img_vw.image=[self imageWithImage_for_cam:img_vw.image scaledToSize:img_vw.image.size andcount_height:3 andcount_width:1  andmode:UIViewContentModeScaleAspectFill and_number:img_vw.image.imageOrientation];
                    }
                    else
                    {
                    img_vw.image=[self imageWithImage_for_gal:img_vw.image scaledToSize:img_vw.image.size andcount_height:3 andcount_width:1  andmode:UIViewContentModeScaleAspectFill and_number:img_vw.image.imageOrientation];
                    }
                    
                }
                else
                {
                    UIImage *img_obj;
                    img_obj=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"]];
                    img_vw.image=img_obj;
                    
                    if (self.view.frame.size.width>500)
                    {
                        NSString *large;
                        if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] rangeOfString:@"_ipad.png"].location == NSNotFound)
                        {
                            large =[[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] stringByReplacingOccurrencesOfString:@".png" withString:@"_ipad.png"];
                            img_vw.image=[UIImage imageNamed:large];
                        }
                        
                    }
                    
                    else
                    {
                        NSString *large;
                        if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] rangeOfString:@"_ipad.png"].location != NSNotFound)
                        {
                            large =[[[array_result objectAtIndex:indexPath.row] valueForKey:@"image2"] stringByReplacingOccurrencesOfString:@"_ipad.png" withString:@".png"];
                            img_vw.image=[UIImage imageNamed:large];
                        }
                        
                    }
                    
                    img_vw.contentMode = UIViewContentModeTop;
                    [img_vw setClipsToBounds:YES];

                }
                
                imgVw_days.frame=CGRectMake(10, img_vw.frame.size.height/2-20, 250, 90);
                 NSString *str=[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"];
                if (self.view.frame.size.width>500)
                {

                    imgVw_days.frame=CGRectMake(new_x*1.99, new_y/1.58, 395, 129);
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
                    [self label:34 balloonY:42 HX:40 HY:50 BX:34 BY:55 PX:34 PY:42 SX:40 SY:43  str:str];
                    lbltext.frame=CGRectMake(120, 42, 100, 25);
                    TxtVwtitle.frame=CGRectMake(120, 60, 250, 25);
                    [self font];
                }
                else if(self.view.frame.size.width==375)
                {
                    imgVw_days.frame=CGRectMake(new_x*1.85, new_y/2, 213, 70);
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
                    [self label:10 balloonY:10 HX:17 HY:17 BX:8 BY:17 PX:10 PY:13 SX:10 SY:13  str:str];
                    lbltext.frame=CGRectMake(75, 12, 100, 25);
                    TxtVwtitle.frame=CGRectMake(75, 31, 120, 25);
                     [self font];
                }

                else
                {
                    NSLog(@"===============%f",new_y);
                    imgVw_days.frame=CGRectMake(new_x*1.30, new_y/2, 213, 70);
                    imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
                    
                    
                    
                     [self label:10 balloonY:10 HX:17 HY:17 BX:8 BY:17 PX:10 PY:13 SX:10 SY:13  str:str];
                    if ([[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]isEqualToString:@"new_hand.png"])
                    {
                         [self label:10 balloonY:10 HX:13 HY:17 BX:8 BY:17 PX:10 PY:13 SX:10 SY:13  str:str];
                    }
                    
                   
                    lbltext.frame=CGRectMake(75, 12, 100, 25);
                    TxtVwtitle.frame=CGRectMake(75, 31, 120, 25);
                     [self font];
                }
             

            
            }
         // TODO:  4
            else if ([array_result count]==4)
            {
                NSLog(@"%ld",(long)indexPath.row);
                if (indexPath.row==1||indexPath.row==2)
                {
                    img_vw.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image"]];
                    
                    if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image"] containsString:@"cam"] || [[[array_result objectAtIndex:indexPath.row] valueForKey:@"image"] containsString:@"gal"])
                    {
                        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
                        NSString *documentsDirectory = [paths objectAtIndex:0];
                        NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:[@"/" stringByAppendingString:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image"]]];
                        img_vw.image=[UIImage imageWithContentsOfFile:getImagePath];
                    }

                    
                    
                    NSString *str=[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarsmallimage"];
                    

                    if (self.view.frame.size.width>500)
                    {
                        imgVw_days.frame=CGRectMake(new_x/1.1, new_y/1.2, 213, 70);
                        imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarsmallimage"]];
                        lbltext.frame=CGRectMake(65, 16, 100, 25);
                        TxtVwtitle.frame=CGRectMake(65, 30, 150, 25);
                       lbldaysleft.textAlignment=NSTextAlignmentCenter;
                        [self label:10 balloonY:10 HX:17 HY:17 BX:8 BY:17 PX:10 PY:12 SX:10 SY:13  str:str];
                    }
                    
                    else if(self.view.frame.size.width==375)
                    {
                        imgVw_days.frame=CGRectMake([[[array_result objectAtIndex:indexPath.row]valueForKey:@"x"] intValue],new_y/2, 135, 48);
                        imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarsmallimage"]];
                        [self label:-1 balloonY:0 HX:0 HY:5 BX:-2 BY:7 PX:-1 PY:3 SX:1 SY:3  str:str];
                        lbltext.frame=CGRectMake(50, 7, 100, 25);
                        TxtVwtitle.frame=CGRectMake(50, 20, 80, 25);
                        [self font_diff];
                    }

                    
                    else
                    {
                        imgVw_days.frame=CGRectMake([[[array_result objectAtIndex:indexPath.row]valueForKey:@"x"] intValue]/2, new_y/2, 135, 48);
                        imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarsmallimage"]];
                        [self label:-1 balloonY:0 HX:0 HY:5 BX:-2 BY:7 PX:-1 PY:3 SX:1 SY:3  str:str];
                        lbltext.frame=CGRectMake(50, 5, 100, 25);
                        TxtVwtitle.frame=CGRectMake(50, 20, 80, 25);
                         [self font_diff];
                        
                        if ([str isEqualToString:@"new_half-hand.png"])
                        {
                             imgVw_days.frame=CGRectMake([[[array_result objectAtIndex:indexPath.row]valueForKey:@"x"] intValue]/2, new_y/2, 155, 48);
                            [self label:-1 balloonY:0 HX:3 HY:7 BX:-2 BY:7 PX:-1 PY:3 SX:1 SY:3  str:str];
                             [lbldaysleft setFont:[UIFont fontWithName:@"Helvetica" size:15]];
                        }
                       
                    }
              
                
                }
                else if (indexPath.row==0||indexPath.row==3)
                {
//                    NSString *str=[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"];
//
//                    
//                    
//
//                     [self font];
//                    if (self.view.frame.size.width>500)
//                    {
//                        imgVw_days.frame=CGRectMake(new_x*1.99, new_y/1.58, 395, 129);
//                        imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
//                        [self label:34 balloonY:42 HX:40 HY:50 BX:34 BY:55 PX:34 PY:42 SX:40 SY:43  str:str];
//
//                        lbltext.frame=CGRectMake(120, 42, 100, 25);
//                        TxtVwtitle.frame=CGRectMake(120, 60, 120, 25);
//                        
//                    }
//                    else if(self.view.frame.size.width==375)
//                    {
//                        imgVw_days.frame=CGRectMake(new_x*1.85, new_y/2, 213, 70);
//                        imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
//                        [self label:10 balloonY:10 HX:17 HY:17 BX:8 BY:17 PX:10 PY:13 SX:10 SY:13  str:str];
//                        lbltext.frame=CGRectMake(75, 13, 100, 25);
//                        TxtVwtitle.frame=CGRectMake(75, 30, 120, 25);
//                    }
//                    else
//                    {
//                        imgVw_days.frame=CGRectMake(new_x*1.30,new_y/2, 213, 70);
//                        imgVw_days.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]];
//                       
//                        
//                        
//                         [self label:10 balloonY:10 HX:17 HY:17 BX:8 BY:17 PX:10 PY:13 SX:10 SY:13  str:str];
//                        if ([[[array_result objectAtIndex:indexPath.row]valueForKey:@"eventbarlargeimage"]isEqualToString:@"new_hand.png"])
//                        {
//                             [self label:10 balloonY:10 HX:13 HY:17 BX:8 BY:17 PX:10 PY:13 SX:10 SY:13  str:str];
//                        }
//                        
//                        
//                        lbltext.frame=CGRectMake(75, 13, 100, 25);
//                        TxtVwtitle.frame=CGRectMake(75, 30, 100, 25);
//                    }
                
                }
            
        }
            else
            {
                  NSLog(@"%ld",(long)indexPath.row);
                img_vw.image=[UIImage imageNamed:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image"]];
                if ([[[array_result objectAtIndex:indexPath.row] valueForKey:@"image"] containsString:@"cam"] || [[[array_result objectAtIndex:indexPath.row] valueForKey:@"image"] containsString:@"gal"])
                {
                    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
                    NSString *documentsDirectory = [paths objectAtIndex:0];
                    NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:[@"/" stringByAppendingString:[[array_result objectAtIndex:indexPath.row] valueForKey:@"image"]]];
                    img_vw.image=[UIImage imageWithContentsOfFile:getImagePath];
                }

            }

        
    }
    

    if (img_vw.image==nil)
    {
        
        
        if (self.view.frame.size.width>500)
        {
            img_vw.image=[UIImage imageNamed:@"defaulf_full_ipad"];
        }
        else
        {
             img_vw.image=[UIImage imageNamed:@"defaulf_full_iphone"];
        }
        img_vw.contentMode = UIViewContentModeTop;
        [img_vw setClipsToBounds:YES];

    }
   
    imgVw_days.center=img_vw.center;
    
//    cell.backgroundColor=[UIColor redColor];
    
    return cell;
}



-(UIImage*)imageWithImage_for_cam:(UIImage*)image_obj
                     scaledToSize:(CGSize)newSize andcount_height:(int)count_height andcount_width:(int)count_width andmode:(UIViewContentMode)content_mode and_number:(UIImageOrientation)number;
{
    NSLog(@"height=%f",newSize.height);
    NSLog(@"width=%f",newSize.width);
    
    double refWidth = CGImageGetWidth(image_obj.CGImage);
    double refHeight = CGImageGetHeight(image_obj.CGImage);
    
    double x = (refWidth - newSize.width) / 2.0;
    double y = (refHeight - newSize.height) / 2.0;
    
    NSLog(@"=====%ld",number);
    
    UIImage* properlyRotatedImage;
    if (number==0)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:UIImageOrientationUp];
    }
    
    else if(number==1)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:1];
    }
    else if(number==2)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:2];
    }

    else if(number==3)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_height, newSize.width/count_width);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:3];
    }
   

    return properlyRotatedImage;
}


-(UIImage*)imageWithImage_for_gal:(UIImage*)image_obj
             scaledToSize:(CGSize)newSize andcount_height:(int)count_height andcount_width:(int)count_width andmode:(UIViewContentMode)content_mode and_number:(UIImageOrientation)number;
{
    NSLog(@"height===%f",newSize.height);
    NSLog(@"width===%f",newSize.width);
    
     NSLog(@"=====%ld",number);
    
    double refWidth = CGImageGetWidth(image_obj.CGImage);
    double refHeight = CGImageGetHeight(image_obj.CGImage);
    
    double x = (refWidth - newSize.width) / 2.0;
    double y = (refHeight - newSize.height) / 2.0;
    
    UIImage* properlyRotatedImage;
    if (number==0)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:UIImageOrientationUp];
    }
    
    else if(number==1)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:1];
    }
    else if(number==2)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:2];
    }
    
    else if(number==3)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_height, newSize.width/count_width);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:3];
    }
    
    return properlyRotatedImage;
}







#pragma mark did select item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    FullEventViewController *full=[self.storyboard instantiateViewControllerWithIdentifier:@"full"];
    full.array_value=[array_result objectAtIndex:indexPath.row];
    float new_x=[[[array_result objectAtIndex:indexPath.row]valueForKey:@"x"] intValue]*1.7;
    float new_y=[[[array_result objectAtIndex:indexPath.row]valueForKey:@"y"] intValue];
 
    full.x_from_home_to_full=[[array_result objectAtIndex:indexPath.row]valueForKey:@"x"];
    full.y_from_home_to_full=[[array_result objectAtIndex:indexPath.row]valueForKey:@"y"];
    if (self.view.frame.size.width>500)
    {
        full.x_from_home=[NSString stringWithFormat:@"%f",new_x*1.99];
        full.y_from_home=[NSString stringWithFormat:@"%f",new_y*2.77];
        full.widh_form_home=[NSString stringWithFormat:@"%d",395];
        full.height_from_home=[NSString stringWithFormat:@"%d",129];
    }
    else if (self.view.frame.size.width==375)
    {
        full.x_from_home=[NSString stringWithFormat:@"%f",new_x*1.85];
        full.y_from_home=[NSString stringWithFormat:@"%f",new_y*2.3];
        full.widh_form_home=[NSString stringWithFormat:@"%d",213];
        full.height_from_home=[NSString stringWithFormat:@"%d",70];
    }
    else
    {
        full.x_from_home=[NSString stringWithFormat:@"%f",new_x*1.30];
        full.y_from_home=[NSString stringWithFormat:@"%f",new_y*2.19];
        full.widh_form_home=[NSString stringWithFormat:@"%d",213];
        full.height_from_home=[NSString stringWithFormat:@"%d",70];
    }
  [self.navigationController pushViewController:full animated:YES];
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 0, 90, 0);
}

#pragma mark sizeForItemAtIndexPath

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        if ([array_result count]==1)
        {
            return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
        }
        else if ([array_result count]==2)
        {
        return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height/2);
        }
        else if ([array_result count]>2)
        {
            return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height/3);
        }
    }
    if (indexPath.row%3==0&&[array_result count]==3)
    {
        return CGSizeMake(collectionVwImages.frame.size.width, collectionVwImages.frame.size.height/3);
    }
    else if (indexPath.row%3==0)
    {
        return CGSizeMake(collectionVwImages.frame.size.width, collectionVwImages.frame.size.height/3);
    }
    else
    {
        if ([array_result count]==1)
        {
            return CGSizeMake(collectionVwImages.frame.size.width, collectionVwImages.frame.size.height);
        }
        else if ([array_result count]==2)
        {
            return CGSizeMake(collectionVwImages.frame.size.width, collectionVwImages.frame.size.height/2);
        }
        if ([array_result count]==3)
        {
            return CGSizeMake(collectionVwImages.frame.size.width, collectionVwImages.frame.size.height/3);
        }
        
        else if ([array_result count]==4)
        {
            if (indexPath.row==1)
            {
                return CGSizeMake(collectionVwImages.frame.size.width/2, collectionVwImages.frame.size.height/3);
            }
            else if (indexPath.row==2)
            {
                return CGSizeMake(collectionVwImages.frame.size.width/2, collectionVwImages.frame.size.height/3);
            }
            else if (indexPath.row==3)
            {
                return CGSizeMake(collectionVwImages.frame.size.width, collectionVwImages.frame.size.height/3);
            }
            else if (indexPath.row==4)
            {
                return CGSizeMake(collectionVwImages.frame.size.width, collectionVwImages.frame.size.height/3);
            }
        }
        else
        {
          
              NSLog(@"index path.row=%ld",(long)indexPath.row);
            return CGSizeMake(collectionVwImages.frame.size.width /2, collectionVwImages.frame.size.height /3);
        }
    }
    return CGSizeMake(0, 0);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 0;
}


-(IBAction)Addevent:(id)sender
{
    AddEventViewController *addEvent=[self.storyboard instantiateViewControllerWithIdentifier:@"addevent"];
    [self.navigationController pushViewController:addEvent animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)label:(int)bsx balloonY:(int)bsy HX:(int)hx HY:(int)hy BX:(int)bx BY:(int)by  PX:(int)px PY:(int)py SX:(int)sx SY:(int)sy str:(NSString*)string
{
    if ([string isEqualToString:@"new_bag.png"]||[string isEqualToString:@"new_half-bag.png"]||[string isEqualToString:@"new_full-bag-ipad.png"])
    {
        lbldaysleft.frame=CGRectMake(bx, by, 40, 44);
    }
    else if([string isEqualToString:@"new_hand.png"]||[string isEqualToString:@"new_half-hand.png"]|[string isEqualToString:@"new_full-hand-ipad.png"])
    {
        lbldaysleft.frame=CGRectMake(hx, hy, 40, 44);
    }
    else if([string isEqualToString:@"new_sun.png"]||[string isEqualToString:@"new_half-sun.png"]|[string isEqualToString:@"new_full-sun-ipad.png"])
    {
        lbldaysleft.frame=CGRectMake(sx, sy, 40, 44);
    }
    else if([string isEqualToString:@"new_baloon.png"]||[string isEqualToString:@"new_half-baloon.png"]|[string isEqualToString:@"new_full-baloon-ipad.png"])
    {
        lbldaysleft.frame=CGRectMake(bsx, bsy, 40, 44);
    }
    else
    {
        lbldaysleft.frame=CGRectMake(px, py, 40, 44);
    }

}


-(void)font
{
    [lbldaysleft setFont:[UIFont fontWithName:@"Helvetica" size:22]];
    [lbltext setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [TxtVwtitle setFont:[UIFont fontWithName:@"Helvetica" size:18]];
}

-(void)font_diff
{
    [lbldaysleft setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [lbltext setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [TxtVwtitle setFont:[UIFont fontWithName:@"Helvetica" size:14]];
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



#pragma mark crop image
-(UIImage*)crop_image:(UIImage*)img_obj scaledToSize:(CGSize)newSize andcount_height:(int)count_height
{
    NSLog(@"%f",newSize.height);
    NSLog(@"%f",newSize.width);
    CGRect clippedRect  = CGRectMake(0,0, newSize.width, newSize.height/3);
    CGImageRef imageRef = CGImageCreateWithImageInRect([img_obj CGImage], clippedRect);
    UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    NSLog(@"%f",newImage.size.height);
    NSLog(@"%f",newImage.size.width);
    return newImage;
}




#pragma mark app next delegate

- (void)noAds
{
    NSLog(@"no adds");
}

- (void)AdLoaded
{
    [self.appNextView1 showPopup];
}
- (void)PopupOpened
{
}

- (void)PopupClosed
{
    
    NSNumber *value1 = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value1 forKey:@"orientation"];
}

- (void)PopupClicked
{
    
}

@end

