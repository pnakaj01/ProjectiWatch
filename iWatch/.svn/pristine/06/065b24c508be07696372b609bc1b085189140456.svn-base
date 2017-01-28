//
//  AddEventViewController.m
//  New_Iwatch_app
//
//  Created by Sahil1 on 20/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "AddEventViewController.h"
#import "constant.h"
#import "Utility.h"
#import "StoreViewController.h"
#import "EventBarViewController.h"
#import "HomeViewController.h"
#import "ImagePackViewController.h"


int index_obj;
@implementation AddEventViewController
{
    int up;
    int down;
    float x_axis;
    float y_axis;
    BOOL cam;
    UIImage *chosenImage;
    int new_val;
  
}
#pragma mark add crashlystic
-(void)viewDidLoad
{
    
    if (![[[NSUserDefaults standardUserDefaults] valueForKey:@"ads"]isEqualToString:@"remove"])
    {
         appNextView=[[AppNextUIView alloc] init];
        [appNextView setID:@"eebcda98-2f8d-476f-9200-65e727476497"];
        [appNextView setAppnextDelegate:self];
    }

    
   

    
    
    camera=NO;
    Txttitle.delegate=self;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(poptoroot) name:@"poproot" object:nil];
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(update_arrays) name:@"update_arrays" object:nil];
    
    
    
   
    [self update_arrays];
    ring_tones_array=[[NSArray alloc]initWithObjects:@"Apex",@"Beacon",@"Bulletin",@"By The Seaside",@"Chimes",@"Circuit",@"Constellation",@"Cosmic",@"Crystals",@"Hillside",@"Illuminate",@"Night Owl",@"Opening",@"Playtime",@"Presto",@"Radar",@"Radiate",@"Ripples",@"Sencha",@"Signal",@"Silk",@"Slow Rise",@"Stargaze",@"Summit",@"Twinkle",@"Uplift",@"Waves",nil];
    
    tableVw.dataSource=self;
    tableVw.delegate=self;
    onOff=NO;
    
    [slider addTarget:self action:@selector(slider_move:) forControlEvents:UIControlEventValueChanged];
    photo_img_Vw.image=[UIImage imageNamed:[arr_images1 objectAtIndex:1]];
    [switchOnOff addTarget:self action:@selector(switchOnOFF:) forControlEvents:UIControlEventValueChanged];
    dict_info=[[NSMutableDictionary alloc]init];
    UIPanGestureRecognizer *pgr = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [Vw_event_bar addGestureRecognizer:pgr];
    
   }

-(void)viewWillDisappear:(BOOL)animated
{
}

#pragma mark view will appear


-(void)update_arrays
{
  
    
    if (self.view.frame.size.width>500)
    {
        arr_images1 =[[NSArray alloc]initWithObjects:@"camera-icon.png",
                      @"img1-1_extraipad.png",@"img1-2_extraipad.png",@"img1-3_full_ipad.png",@"img1-4_extraipad.png",@"img1-5_extraipad.png",
                      @"img2-1_extraipad.png",@"img2-2_extraipad.png",@"img2-3_extraipad.png",@"img2-4_extraipad.png",@"img2-5_extraipad.png",
                      @"img3-1_extraipad.png",@"img3-2_extraipad.png",@"img3-3_extraipad.png",@"img3-4_extraipad.png",@"img3-5_extraipad.png",
                      @"img4-1_extraipad.png",@"img4-2_extraipad.png",@"img4-3_extraipad.png",@"img4-4_extraipad.png",@"img4-5_extraipad.png",
                      @"img5-1_extraipad.png",@"img5-2_extraipad.png",@"img5-3_extraipad.png",@"img5-4_extraipad.png",@"img5-5_extraipad.png",
                      @"img6-1_extraipad.png",@"img6-2_extraipad.png",@"img6-3_extraipad.png",@"img6-4_extraipad.png",@"img6-5_extraipad.png",
                      @"img7-1_extraipad.png",@"img7-2_extraipad.png",@"img7-3_extraipad.png",@"img7-4_extraipad.png",@"img7-5_extraipad.png",
                      nil];
        
        
       arr_images5=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img1-1_full_ipad.png",@"img1-2_full_ipad.png",@"img1-3_full_ipad.png",@"img1-4_full_ipad.png",@"img1-5_full_ipad.png",
                     @"img2-1_full_ipad.png",@"img2-2_full_ipad.png",@"img2-3_full_ipad.png",@"img2-4_full_ipad.png",@"img2-5_full_ipad.png",
                     @"img3-1_full_ipad.png",@"img3-2_full_ipad.png",@"img3-3_full_ipad.png",@"img3-4_full_ipad.png",@"img3-5_full_ipad.png",
                     @"img4-1_full_ipad.png",@"img4-2_full_ipad.png",@"img4-3_full_ipad.png",@"img4-4_full_ipad.png",@"img4-5_full_ipad.png",
                     @"img5-1_full_ipad.png",@"img5-2_full_ipad.png",@"img5-3_full_ipad.png",@"img5-4_full_ipad.png",@"img5-5_full_ipad.png",
                     @"img6-1_full_ipad.png",@"img6-2_full_ipad.png",@"img6-3_full_ipad.png",@"img6-4_full_ipad.png",@"img6-5_full_ipad.png",
                     @"img7-1_full_ipad.png",@"img7-2_full_ipad.png",@"img7-3_full_ipad.png",@"img7-4_full_ipad.png",@"img7-5_full_ipad.png",
                     nil];
        
        
    }
    else
    {
        arr_images1 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img1-1_extra.png",@"img1-2_extra.png",@"img1-3_extra.png",@"img1-4_extra.png",@"img1-5_extra.png",
                      @"img2-1_extra.png",@"img2-2_extra.png",@"img2-3_extra.png",@"img2-4_extra.png",@"img2-5_extra.png",
                      @"img3-1_extra.png",@"img3-2_extra.png",@"img3-3_extra.png",@"img3-4_extra.png",@"img3-5_extra.png",
                      @"img4-1_extra.png",@"img4-2_extra.png",@"img4-3_extra.png",@"img4-4_extra.png",@"img4-5_extra.png",
                      @"img5-1_extra.png",@"img5-2_extra.png",@"img5-3_extra.png",@"img5-4_extra.png",@"img5-5_extra.png",
                      @"img6-1_extra.png",@"img6-2_extra.png",@"img6-3_extra.png",@"img6-4_extra.png",@"img6-5_extra.png",
                      @"img7-1_extra.png",@"img7-2_extra.png",@"img7-3_extra.png",@"img7-4_extra.png",@"img7-5_extra.png",
                      nil];
        
        
        arr_images5=[[NSArray alloc]initWithObjects:@"camera-icon.png",
                     @"img1-1_full.png",@"img1-2_full.png",@"img1-3_full.png",@"img1-4_full.png",@"img1-5_full.png",
                     @"img2-1_full.png",@"img2-2_full.png",@"img2-3_full.png",@"img2-4_full.png",@"img2-5_full.png",
                     @"img3-1_full.png",@"img3-2_full.png",@"img3-3_full.png",@"img3-4_full.png",@"img3-5_full.png",
                     @"img4-1_full.png",@"img4-2_full.png",@"img4-3_full.png",@"img4-4_full.png",@"img4-5_full.png",
                     @"img5-1_full.png",@"img5-2_full.png",@"img5-3_full.png",@"img5-4_full.png",@"img5-5_full.png",
                     @"img6-1_full.png",@"img6-2_full.png",@"img6-3_full.png",@"img6-4_full.png",@"img6-5_full.png",
                     @"img7-1_full.png",@"img7-2_full.png",@"img7-3_full.png",@"img7-4_full.png",@"img7-5_full.png",
                     nil];
        
    }
    
    photo_img_Vw.image=[UIImage imageNamed:[arr_images1 objectAtIndex:1]];
    [tableVw reloadData];
}





-(void)viewWillAppear:(BOOL)animated
{
    [_ring_picker removeFromSuperview];
    [ring_toolbar removeFromSuperview];
    up_value=1;
    down_value=1;
    count=[arr_images1 count];
    NSString *str_img_name=[[NSUserDefaults standardUserDefaults]valueForKey:@"event_bar_image"];
    if (self.view.frame.size.width>500)
    {
        if (str_img_name)
        {
            img_event_bar.image=[UIImage imageNamed:str_img_name];
        }
        else
        {
            img_event_bar.image=[UIImage imageNamed:@"new_full-pantagun-ipad"];
        }
    }
    else
    {
        if (str_img_name)
        {
            img_event_bar.image=[UIImage imageNamed:str_img_name];
        }
        else
        {
            img_event_bar.image=[UIImage imageNamed:@"new_pantagun"];
        }
    }
    
    [photo_img_Vw addSubview:Vw_event_bar];
    
    x_axis=Vw_event_bar.frame.origin.x;
    y_axis=Vw_event_bar.frame.origin.y;
    
    
    
    
    if ([str_img_name isEqualToString:@"new_hand.png"])
    {
        lbl_event_bar.frame=CGRectMake(lbl_event_bar.frame.origin.x, lbl_event_bar.frame.origin.y, lbl_event_bar.frame.size.width, lbl_event_bar.frame.size.height);
    }
    else if ([str_img_name isEqualToString:@"new_sun.png"] )
    {
    lbl_event_bar.frame=CGRectMake(lbl_event_bar.frame.origin.x+2, lbl_event_bar.frame.origin.y, lbl_event_bar.frame.size.width, lbl_event_bar.frame.size.height);
    }
    else
    {
    lbl_event_bar.frame=CGRectMake(lbl_event_bar.frame.origin.x-2, lbl_event_bar.frame.origin.y, lbl_event_bar.frame.size.width, lbl_event_bar.frame.size.height);
    }
    
    
}


- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 250;
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor), recognizer.view.center.y + (velocity.y * slideFactor));
        if (self.view.frame.size.width>500)
        {
            finalPoint.x = MIN(MAX(finalPoint.x, 200.5), self.view.bounds.size.width - 457);
            finalPoint.y = MIN(MAX(finalPoint.y + 0, 68), self.view.bounds.size.height - 656);
        }
       else if (self.view.frame.size.width==375)
        {
            finalPoint.x = MIN(MAX(finalPoint.x, 98),photo_img_Vw.bounds.size.width/2+25);
            finalPoint.y = MIN(MAX(finalPoint.y + 0, 31.5), photo_img_Vw.bounds.size.height-30);
        }
       else if (self.view.frame.size.width==414)
       {
           finalPoint.x = MIN(MAX(finalPoint.x, 106),photo_img_Vw.bounds.size.width/2+25);
           finalPoint.y = MIN(MAX(finalPoint.y + 0, 36), photo_img_Vw.bounds.size.height-37);
       }

        else
        {
            finalPoint.x = MIN(MAX(finalPoint.x, 82),photo_img_Vw.bounds.size.width/2+24);
            finalPoint.y = MIN(MAX(finalPoint.y + 0, 22.75), photo_img_Vw.bounds.size.height-24);
        }
        
        [UIView animateWithDuration:slideFactor delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
        
        NSLog(@"x=%f",recognizer.view.frame.origin.x);
        NSLog(@"y=%f",recognizer.view.frame.origin.y);
        
        x_axis=recognizer.view.frame.origin.x;
        y_axis=recognizer.view.frame.origin.y;
    }
}

#pragma mark UP_tableview
-(IBAction)UP_tableview:(id)sender
{
    if (tableVw.contentOffset.y<cell_height* [arr_images1 count]+tableVw.frame.size.height+cell_height)
    {
        [tableVw setContentOffset:CGPointMake(0,tableVw.contentOffset.y+cell_height) animated:YES];
    }
}

#pragma mark down_tableVw
-(IBAction)down_tableVw:(id)sender
{
    NSLog(@"%f",tableVw.contentOffset.y);
    if (tableVw.contentOffset.y>=0)
    {
        [tableVw setContentOffset:CGPointMake(0,tableVw.contentOffset.y-cell_height) animated:YES];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-(void)poptoroot
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark save
-(IBAction)save:(id)sender
{
    if (index==0)
    {
        index=1;
    }
    if ([Txttitle.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please Enter Event Text" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else if ([lbltime.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please Enter Event Time" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
        
        NSString *str_img_name=[[NSUserDefaults standardUserDefaults]valueForKey:@"event_bar_image"];
        UIDevice *device = [UIDevice currentDevice];
        NSString *currentDeviceId = [[device identifierForVendor]UUIDString];
        [dict_info setValue:currentDeviceId forKey:@"device_id"];
        
        
        NSString *str=[NSString stringWithFormat:@"%ld",(long)days];
        NSString *str_alpha=[NSString stringWithFormat:@"%f",slider.value];
        
        if (camera==YES)
        {
            [self camera];
        }
       
        str_normal=[arr_images1 objectAtIndex:index];
       // str_horizontal=[arr_images3 objectAtIndex:index];
        str_fullPage=[arr_images5 objectAtIndex:index];
     //   str_halfPage=[arr_images4 objectAtIndex:index];
        
        
        [dict_info setValue:Txttitle.text forKey:@"title"];
        [dict_info setValue:str forKey:@"daysLeft"];
        [dict_info setValue:[NSDate date] forKey:@"date"];
        [dict_info setValue:datepicker.date forKey:@"eventDate"];
        [dict_info setValue:str_alpha forKey:@"alpha"];
        [dict_info setValue:[NSDate date] forKey:@"notificationDate"];
        [dict_info setValue:lblsound_name.text forKey:@"ringtoneName"];
        
        if (onOff==YES)
        {
        [dict_info setValue:@"YES" forKey:@"notOnOff"];
        }
        else
        {
         [dict_info setValue:@"NO" forKey:@"notOnOff"];
        }
        
        if (camera==YES)
        {
            [dict_info setValue:[str_camera lastPathComponent] forKey:@"image_data"];
            [dict_info setValue:[str_camera lastPathComponent] forKey:@"image_data1"];
       //     [dict_info setValue:[str_camera lastPathComponent] forKey:@"image_data2"];
//            [dict_info setValue:[str_camera lastPathComponent] forKey:@"image_data3"];
        }
        else
        {
            [dict_info setValue:str_normal forKey:@"image_data"];
            [dict_info setValue:str_fullPage forKey:@"image_data1"];
//            [dict_info setValue:str_horizontal forKey:@"image_data2"];
            //[dict_info setValue:str_halfPage   forKey:@"image_data3"];
        }
        if (self.view.frame.size.width>500)
        {
            if ([str_img_name isEqualToString:@"new_full-baloon-ipad.png"])
            {
                [dict_info setValue:@"new_full-baloon-ipad.png" forKey:@"eventbarlargeimage"];
                [dict_info setValue:@"new_baloon.png" forKey:@"eventbarsmallimage"];
            }
            else if ([str_img_name isEqualToString:@"new_full-bag-ipad.png"])
            {
                [dict_info setValue:@"new_full-bag-ipad.png" forKey:@"eventbarlargeimage"];
                [dict_info setValue:@"new_bag.png" forKey:@"eventbarsmallimage"];
            }
            else if ([str_img_name isEqualToString:@"new_full-sun-ipad.png"])
            {
                [dict_info setValue:@"new_full-sun-ipad.png" forKey:@"eventbarlargeimage"];
                [dict_info setValue:@"new_sun.png" forKey:@"eventbarsmallimage"];
                
            }
            else if ([str_img_name isEqualToString:@"new_full-hand-ipad.png"])
            {
                [dict_info setValue:@"new_full-hand-ipad.png" forKey:@"eventbarlargeimage"];
                [dict_info setValue:@"new_hand.png" forKey:@"eventbarsmallimage"];
                
            }
            else
            {
                   [dict_info setValue:@"new_full-pantagun-ipad.png" forKey:@"eventbarlargeimage"];
                [dict_info setValue:@"new_pantagun.png" forKey:@"eventbarsmallimage"];
            }
            
            
        }
        else
        {
            if ([str_img_name isEqualToString:@"new_baloon.png"])
            {
                [dict_info setValue:@"new_baloon.png" forKey:@"eventbarlargeimage"];
                [dict_info setValue:@"new_half-baloon.png" forKey:@"eventbarsmallimage"];
                
            }
            else if ([str_img_name isEqualToString:@"new_bag.png"])
            {
                [dict_info setValue:@"new_bag.png" forKey:@"eventbarlargeimage"];
                [dict_info setValue:@"new_half-bag.png" forKey:@"eventbarsmallimage"];
            }
            else if ([str_img_name isEqualToString:@"new_sun.png"])
            {
                [dict_info setValue:@"new_sun.png" forKey:@"eventbarlargeimage"];
                [dict_info setValue:@"new_half-sun.png" forKey:@"eventbarsmallimage"];
                
            }
            else if ([str_img_name isEqualToString:@"new_hand.png"])
            {
                [dict_info setValue:@"new_hand.png" forKey:@"eventbarlargeimage"];
                [dict_info setValue:@"new_half-hand.png" forKey:@"eventbarsmallimage"];
            }
            else
            {
                [dict_info setValue:@"new_pantagun.png" forKey:@"eventbarlargeimage"];
                [dict_info setValue:@"new_half-pantagun.png" forKey:@"eventbarsmallimage"];
            }
            
        }
        
        camera=NO;
        // TODO: work here

        [dict_info setValue:[NSString stringWithFormat:@"%f",x_axis] forKey:@"x"];
        [dict_info setValue:[NSString stringWithFormat:@"%f",y_axis] forKey:@"y"];
        
        
        [Utility insertdata:dict_info];
        [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"value_save"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"iwatch" object:nil];
       

        if (onOff==YES)
        {
            UILocalNotification* reminderNote=[[UILocalNotification alloc]init];
            reminderNote.fireDate = datepicker.date;
            reminderNote.repeatInterval = 0;
            reminderNote.alertBody = Txttitle.text;
            reminderNote.alertAction = @"View";
            reminderNote.soundName = [NSString stringWithFormat:@"%@.m4r",lblsound_name.text];
            NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:datepicker.date, @"notificationDate", nil];
            reminderNote.userInfo=infoDict;
            NSLog(@"notificationDate=%@",[infoDict valueForKey:@"notificationDate"]);
            [[UIApplication sharedApplication] scheduleLocalNotification:reminderNote];
        }
        else
        {
            UILocalNotification* reminderNote=[[UILocalNotification alloc]init];
            reminderNote.fireDate = datepicker.date;
            reminderNote.repeatInterval = 0;
            reminderNote.alertBody = Txttitle.text;
            reminderNote.alertAction = @"View";
            NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:str_normal, @"img1",str_fullPage, @"img3",Txttitle.text,@"title",nil];
            reminderNote.userInfo=infoDict;
            NSLog(@"fire date=%@",reminderNote.fireDate);
            [[UIApplication sharedApplication] scheduleLocalNotification:reminderNote];
        }
    }
}


-(void)camera
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
    NSString*str_date=[format stringFromDate:[NSDate date]];
    NSString *str;
    if (cam==YES)
    {
        str=[NSString stringWithFormat:@"%@cam.png",str_date];
    }
    else
    {
        str=[NSString stringWithFormat:@"%@gal.png",str_date];
    }
    
    NSData *data=(UIImageJPEGRepresentation(chosenImage, 0));
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:str];
    [data writeToFile:filePath atomically:YES];
    str_camera=[self documentsPathForFileName:str];
}


- (NSString *)documentsPathForFileName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    return [documentsPath stringByAppendingPathComponent:name];
}

-      (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    Txttitle.text=[self uppercase:Txttitle.text];
    [Txttitle resignFirstResponder];
}


#pragma mark text field
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    textField.text=[self uppercase:textField.text];
    [Txttitle resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [datepicker removeFromSuperview];
    [numberToolbar removeFromSuperview];
    [self animateTextField:textField up:YES];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    lbl_lower.text=Txttitle.text;
    if (self.view.frame.origin.y!=0)
    {
         [self animateTextField:textField up:NO];
    }
   
}


-(void)animateTextField:(id)sender up:(BOOL)up
{
    int movementDistance=0 ;
    float movementDuration=0.0;
    movementDistance = -100;
    
    // tweak as needed
    movementDuration = 0.3f;     // tweak as needed
    int movement = (up ? movementDistance: -movementDistance);
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

-(IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)switchOnOFF:(UISwitch *)sender
{
    if (sender.on) {
        onOff=YES;
    }
    else
    {
        
        onOff=NO;
    }
}


-(IBAction)notification_sound:(id)sender
{
    Txttitle.text=[self uppercase:Txttitle.text];
    [Txttitle resignFirstResponder];
    [numberToolbar removeFromSuperview];
    [datepicker removeFromSuperview];
    
    [_ring_picker removeFromSuperview];
    [ring_toolbar removeFromSuperview];
    
    ring_toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-212, self.view.frame.size.width, 50)];
    ring_toolbar.barStyle = UIBarStyleBlackTranslucent;
    ring_toolbar.items = [NSArray arrayWithObjects:
                          [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel_ring_picker)],
                          [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                          [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(select_ring)],
                          nil];
    [self.view addSubview:ring_toolbar];
    
    _ring_picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-162 ,self.view.frame.size.width, 162)];
    _ring_picker.backgroundColor=[UIColor colorWithRed:0/255.0 green:168/255.0 blue:198/255.0 alpha:1];
    _ring_picker.showsSelectionIndicator = YES;
    _ring_picker.hidden = NO;
    _ring_picker.delegate = self;
    [self.view addSubview:_ring_picker];
}
-(void)cancel_ring_picker
{
    [ring_toolbar removeFromSuperview];
    [_ring_picker removeFromSuperview];
}

-(void)select_ring
{
    if (str_ringName)
    {
        lblsound_name.text=[NSString stringWithFormat:@"%@",str_ringName];
    }
    else
    {
        lblsound_name.text=@"Apex";
    }
    [_ring_picker removeFromSuperview];
    [ring_toolbar removeFromSuperview];
}

-(void)slider_move:(UISlider *)sender
{
    Vw_event_bar.alpha=sender.value;
}

#pragma mark Ring tones
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//Rows in each Column

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [ring_tones_array count];
}

-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [ring_tones_array objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    str_ringName=[ring_tones_array objectAtIndex:row];
}

#pragma mark Event_time
-(IBAction)Event_time:(id)sender
{
    Txttitle.text=[self uppercase:Txttitle.text];
    [Txttitle resignFirstResponder];
    
    [datepicker removeFromSuperview];
    [numberToolbar removeFromSuperview];
    numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-212, self.view.frame.size.width, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(canceldatepicker)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)],
                           nil];
    //[numberToolbar sizeToFit];
    [self.view addSubview:numberToolbar];
    
    datepicker=[[UIDatePicker alloc] init ];
    datepicker.frame=CGRectMake(0, self.view.frame.size.height-162, self.view.frame.size.width, 162);
    NSLog(@"%f",self.view.frame.size.height);
    datepicker.datePickerMode = UIDatePickerModeDateAndTime;
    datepicker.hidden = NO;
    datepicker.backgroundColor=[UIColor colorWithRed:0/255.0 green:168/255.0 blue:198/255.0 alpha:1];
    datepicker.date = [NSDate date];
    datepicker.minimumDate=[NSDate date];
    [self.view addSubview:datepicker];
    

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [arr_images1 count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.view.frame.size.width>500)
    {
        cell_height=130;
        up=cell_height;
        down=cell_height;
        return 150;
    }
       {
        cell_height=80;
        up=cell_height;
        down=cell_height;
        return 100;
    }
    
}

#pragma mark cell for row

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell identifier"];
    
    if(cell == nil)
    {
        
    }
    
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell identifier"];
    
    for(UIView *cellView in [cell.contentView subviews])
    {
        [cellView removeFromSuperview];
    }
    
    listimageview =nil;
    
    if ([cell.contentView viewWithTag:1001])
    {
        listimageview = (UIImageView *)[cell.contentView viewWithTag:1001];
        btn_purchase= (UIButton *)[cell.contentView viewWithTag:1002];
        btn_camera=(UIButton *)[cell.contentView viewWithTag:1003];
    }
    else
    {
        listimageview = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, tableVw.frame.size.width-10,cell_height)];
        listimageview.tag = 1001;
        listimageview.userInteractionEnabled=YES;
        
        [cell.contentView addSubview:listimageview];
        
        btn_purchase=[UIButton buttonWithType:UIButtonTypeCustom];
        
        btn_purchase.tag=1002;
        
        
        [[NSUserDefaults standardUserDefaults] setObject:[NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",nil] forKey:@"arr_one"];
         [[NSUserDefaults standardUserDefaults] synchronize];
        

        
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_one"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_two"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_three"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_four"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_five"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_six"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_seven"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]])
        {
            // NSLog(@"buyed");
        }
        else
        {
            [listimageview addSubview:btn_purchase];

        }
        
        
        
        btn_camera=[UIButton buttonWithType:UIButtonTypeCustom];
        
        btn_camera.tag=1003;
        
        
        if (self.view.frame.size.width>500)
        {
            btn_camera.frame=CGRectMake(listimageview.frame.size.width/2-28.5, listimageview.frame.size.height/2-26, 57, 52);

            
            [btn_camera setBackgroundImage:[UIImage imageNamed:@"camera-ico-ipad.png"] forState:UIControlStateNormal];
            
            btn_purchase.frame=CGRectMake(listimageview.frame.size.width-45, listimageview.frame.size.height-50, 45, 50);
            [btn_purchase setBackgroundImage:[UIImage imageNamed:@"download-btn_ipad.png"] forState:UIControlStateNormal];
        }
        else
        {
            btn_camera.frame=CGRectMake(listimageview.frame.size.width/2-9.5, listimageview.frame.size.height/2-9, 19, 18);
            [btn_camera setBackgroundImage:[UIImage imageNamed:@"camera.png"] forState:UIControlStateNormal];
            btn_purchase.frame=CGRectMake(listimageview.frame.size.width-25, listimageview.frame.size.height-25, 25, 25);
            [btn_purchase setBackgroundImage:[UIImage imageNamed:@"download-btn.png"] forState:UIControlStateNormal];
        }
        btn_camera.center=listimageview.center;
        if (indexPath.row==0)
        {
            [btn_purchase setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
            btn_purchase.userInteractionEnabled=NO;
            [listimageview addSubview:btn_purchase];
        }
    }
    
    listimageview.image=[UIImage imageNamed:[arr_images1 objectAtIndex:indexPath.row]];
    
    cell.backgroundColor=[UIColor clearColor];
    index_obj=indexPath.row;
    
    return cell;
}

-(void)goto_store
{
    NSArray *store_images1,*store_images2,*store_images3,*store_images4,*store_images5,*store_images6,*store_images7;

    
    
    if (self.view.frame.size.width>600)
    {
    store_images1=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img1-1_extraipad.png", @"img1-2_extraipad.png",@"img1-3_full_ipad.png",@"img1-4_extraipad.png",@"img1-5_extraipad.png", nil];
    store_images2=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img2-1_extraipad.png",@"img2-2_extraipad.png", @"img2-3_full_ipad.png",@"img2-4_extraipad.png",@"img2-5_extraipad.png", nil];
    store_images3=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img3-1_extraipad.png",@"img3-2_extraipad.png", @"img3-3_full_ipad.png",@"img3-4_extraipad.png",@"img3-5_extraipad.png", nil];
    store_images4=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img4-1_extraipad.png",@"img4-2_extraipad.png", @"img4-3_full_ipad.png",@"img4-4_extraipad.png",@"img4-5_extraipad.png", nil];
    store_images5=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img5-1_extraipad.png",@"img5-2_extraipad.png", @"img5-3_full_ipad.png",@"img5-4_extraipad.png",@"img5-5_extraipad.png", nil];
    store_images6=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img6-1_extraipad.png",@"img6-2_extraipad.png", @"img6-3_full_ipad.png",@"img6-4_extraipad.png",@"img6-5_extraipad.png", nil];
    store_images7=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img7-1_extraipad.png",@"img7-2_extraipad.png", @"img7-3_full_ipad.png",@"img7-4_extraipad.png",@"img7-5_extraipad.png", nil];
    }
    else
    {
        store_images1 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img1-1_extra.png",@"img1-2_extra.png", @"img3-full.png", @"img1-4_extra.png",@"img1-5_extra.png",nil];
        store_images2 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img2-1_extra.png",@"img2-2_extra.png", @"img2-3_full.png", @"img2-4_extra.png",@"img2-5_extra.png",nil];
        store_images3 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img3-1_extra.png",@"img3-2_extra.png", @"img3-3_full.png", @"img3-4_extra.png",@"img3-5_extra.png",nil];
        store_images4 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img4-1_extra.png",@"img4-2_extra.png", @"img4-3_full.png", @"img4-4_extra.png",@"img4-5_extra.png",nil];
        store_images5 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img5-1_extra.png",@"img5-2_extra.png", @"img5-3_full.png", @"img5-4_extra.png",@"img5-5_extra.png",nil];
        store_images6 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img6-1_extra.png",@"img6-2_extra.png", @"img6-3_full.png", @"img6-4_extra.png",@"img6-5_extra.png",nil];
        store_images7 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img7-1_extra.png",@"img7-2_extra.png", @"img7-3_full.png", @"img7-4_extra.png",@"img7-5_extra.png",nil];
    }

    
    
   
    
    
    ImagePackViewController *img=[self.storyboard instantiateViewControllerWithIdentifier:@"imagepack"];
    if (index<=5)
    {
        img.bundle_str=@"Adventure Pack Bundle!";
        img.from_store_images=store_images1;
        img.arr_result1=[[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5", nil];
        img.tag_from_store=@"1";
    }
   
    else if (index>=6 && index<=10)
    {
        img.bundle_str=@"Children Pack Bundle!";
        img.from_store_images=store_images2;
        img.arr_result2=[[NSMutableArray alloc] initWithObjects:@"6",@"7",@"8",@"9",@"10", nil];
        img.tag_from_store=@"2";
    }
    else if (index>=10 && index<=15)
    {
        img.bundle_str=@"Party Pack Bundle!";
        img.from_store_images=store_images3;
        img.arr_result3=[[NSMutableArray alloc] initWithObjects:@"11",@"12",@"13",@"14",@"15", nil];;

        img.tag_from_store=@"3";
    }
    else if (index>=15 && index<=20)
    {
        img.bundle_str=@"Romantic Pack Bundle!";
        img.from_store_images=store_images4;
        img.arr_result4=[[NSMutableArray alloc] initWithObjects:@"16",@"17",@"18",@"19",@"20", nil];
        img.tag_from_store=@"4";
    }
    else if (index>=20 && index<=25)
    {
        img.bundle_str=@"Sports Pack Bundle!";
        img.from_store_images=store_images5;
        img.arr_result5=[[NSMutableArray alloc] initWithObjects:@"21",@"22",@"23",@"24",@"25", nil];
        img.tag_from_store=@"5";
    }
    else if (index>=25 && index<=30)
    {
        img.bundle_str=@"Travel Pack Bundle!";
        img.from_store_images=store_images6;
        img.arr_result6=[[NSMutableArray alloc] initWithObjects:@"26",@"27",@"28",@"29",@"30", nil];
        img.tag_from_store=@"6";
    }
    else if (index>=30 && index<=35)
    {
     img.bundle_str=@"Vocation Pack Bundle!";
     img.from_store_images=store_images7;
    img.arr_result7=[[NSMutableArray alloc] initWithObjects:@"31",@"32",@"33",@"34",@"35", nil];
     img.tag_from_store=@"7";
    }
    
    
    [self.navigationController pushViewController:img animated:YES];
}

#pragma mark did select

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did select=%@",[arr_images1 objectAtIndex:indexPath.row]);
    index=indexPath.row;
    if (indexPath.row==0)
    {
        [self pick_image];
    }
    else
    {
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_one"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_two"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_three"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_four"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_five"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_six"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]||
            [[[NSUserDefaults standardUserDefaults] valueForKey:@"arr_seven"] containsObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]])
        {
            
            photo_img_Vw.image=[UIImage imageNamed:[arr_images1 objectAtIndex:indexPath.row]];
        }
        else
        {
            [self goto_store];
        }

        
    }
    NSLog(@"index path==%lu",(unsigned long)index);
}

-(IBAction)Event_bar:(id)sender
{
    EventBarViewController *event=[self.storyboard instantiateViewControllerWithIdentifier:@"eventbar"];
    [self.navigationController pushViewController:event animated:YES];
}

-(void)done
{
    
    NSDate *now3=[NSDate date];
    NSDate *now5=datepicker.date;
    
    NSTimeInterval distanceBetweenDates = [now5 timeIntervalSinceDate:now3];
    
    double secondsInAnHour = 3600*24;
    double sec = 3600;
    double min=60;
    
    NSInteger daysBetweenDates = distanceBetweenDates / secondsInAnHour;
    NSUInteger hoursBetweenDates=distanceBetweenDates / sec;
    NSUInteger minutesbetweenDates=distanceBetweenDates/min;
    
    NSLog(@"current time =%@",now3);
    NSLog(@"selected time=%@",now5);
    
    
    if ([now5 compare:now3] == NSOrderedDescending)
    {
        if (hoursBetweenDates==0)
        {
            lbltime.text=[NSString stringWithFormat:@"%ld Min Left",(long)minutesbetweenDates];
            lbl_upper.text=@"MINUTE LEFT";
            lbl_event_bar.text=[NSString stringWithFormat:@"%ld",(unsigned long)minutesbetweenDates];
        }
        else if (daysBetweenDates==0)
        {
            
            lbltime.text=[NSString stringWithFormat:@"%ld Hr Left",(long)hoursBetweenDates];
            lbl_upper.text=@"HOUR LEFT";
            lbl_event_bar.text=[NSString stringWithFormat:@"%ld",(unsigned long)hoursBetweenDates];
        }
        else
        {
            if ([NSString stringWithFormat:@"%ld",(long)daysBetweenDates].length>3)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Number of days should not exceed three digits." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                 lbltime.text=@"";
            }
            else
            {
            lbltime.text=[NSString stringWithFormat:@"%ld Days Left",(long)daysBetweenDates];
            lbl_upper.text=@"DAYS LEFT";
            lbl_event_bar.text=[NSString stringWithFormat:@"%ld",(long)daysBetweenDates];
            }
        }
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Event time should not be the current time." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
         lbltime.text=@"";
    }
    
    [datepicker removeFromSuperview];
    [numberToolbar removeFromSuperview];
    
}
-(void)canceldatepicker
{
    lbltime.text=@"";
    [datepicker removeFromSuperview];
    [numberToolbar removeFromSuperview];
}
-(void)pick_image
{
        UIActionSheet* action=[[UIActionSheet alloc]initWithTitle:@"Choose" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"Photo Library", nil];
        [action showInView:self.view];
}
- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
        cam=YES;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            image_picker=[[UIImagePickerController alloc]init];
            image_picker.delegate=self;
            image_picker.allowsEditing=NO;
            image_picker.sourceType=UIImagePickerControllerSourceTypeCamera;
            if (self.view.frame.size.width>500)
            {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self presentViewController:image_picker animated:YES completion:nil];
                }];
            }
            else
            {
                [self presentViewController:image_picker animated:YES completion:nil];
            }
            
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Camera not available" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
    }
    else if (buttonIndex==1){
        cam=NO;
        image_picker=[[UIImagePickerController alloc]init];
        image_picker.delegate=self;
        image_picker.allowsEditing=NO;
        image_picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        if (self.view.frame.size.width>500)
        {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self presentViewController:image_picker animated:YES completion:nil];
            }];
        }
        else
        {
            [self presentViewController:image_picker animated:YES completion:nil];
        }
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker1 {
    
    [picker1 dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker1 didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    chosenImage = info[UIImagePickerControllerOriginalImage];
    CGFloat imageWidth = chosenImage.size.width;
    CGFloat imageHeight =chosenImage.size.height;
    
    NSLog(@"%f",imageWidth);
    NSLog(@"%f",imageHeight);
    
    if (imageWidth<5000)
    {
        camera=YES;
        
        
        photo_img_Vw.image=chosenImage;
        photo_img_Vw.image=[self image_function:photo_img_Vw.image scaledToSize:photo_img_Vw.image.size andcount_height:1 andcount_width:1  andmode:UIViewContentModeScaleToFill and_number:photo_img_Vw.image.imageOrientation];

    }
    else
    {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"This image is not allowed." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    
    }
    
    
    
   
    
    
    [picker1 dismissViewControllerAnimated:YES completion:NULL];
    
}

-(NSString*)uppercase:(NSString*)input
{
    if ([input length]==0)
    {
        return @"";
    }
    /* create a locale where diacritic marks are not considered important, e.g. US English */
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en-US"];
    
    /* get first char */
    NSString *firstChar = [input substringToIndex:1];
    
    /* remove any diacritic mark */
    NSString *folded = [firstChar stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:locale];
    
    /* create the new string */
    NSString *result = [[folded uppercaseString] stringByAppendingString:[input substringFromIndex:1]];
    
    return result;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}



#pragma mark app next delegate

- (void)noAds
{
    NSLog(@"no adds");
}
- (void)AdLoaded
{
    [appNextView showPopup];
}
- (void)PopupOpened
{
}
- (void)PopupClosed
{
    

    
}
- (void)PopupClicked
{
    
}


- (void) adjustViewsForOrientation:(UIInterfaceOrientation) orientation {
    
    switch (orientation)
    {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            //load the portrait view
        }
            
            break;
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
        {
            //load the landscape view
        }
            break;
        case UIInterfaceOrientationUnknown:break;
    }
}



-(UIImage*)image_function:(UIImage*)image_obj
             scaledToSize:(CGSize)newSize andcount_height:(int)count_height andcount_width:(int)count_width andmode:(UIViewContentMode)content_mode and_number:(UIImageOrientation)number;
{
    
    double refWidth = CGImageGetWidth(image_obj.CGImage);
    double refHeight = CGImageGetHeight(image_obj.CGImage);
    
    double x = (refWidth - newSize.width) / 2.0;
    double y = (refHeight - newSize.height) / 2.0;
    
    //  NSLog(@"In edit=====%ld",number);
    
    UIImage* properlyRotatedImage;
    if (number==0)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        photo_img_Vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:UIImageOrientationUp];
    }
    
    else if(number==1)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        photo_img_Vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:1];
    }
    else if(number==2)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        photo_img_Vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:2];
    }
    
    else if(number==3)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_height, newSize.width/count_width);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        photo_img_Vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:3];
    }
    
    
    return properlyRotatedImage;
    
}


@end
