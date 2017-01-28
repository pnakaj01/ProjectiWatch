//
//  EditEventViewController.m
//  New_Iwatch_app
//
//  Created by Sahil1 on 26/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "EditEventViewController.h"
#import "Utility.h"
#import "constant.h"
#import <CoreData/CoreData.h>
#import "EventBarViewController.h"
#import "StoreViewController.h"
#import "ImagePackViewController.h"

//#import "AppDelegate.h"
@implementation EditEventViewController
{
    float x_axis;
    float y_axis;
    BOOL cam;
    UIImage *chosenImage;
    // Proxy *pro;
}
#pragma mark viewDidLoad
-(void)viewDidLoad
{
    //NSLog(@"====%@",_array_value);
    
    switch_value=@"unchange";
    img_change=@"NO";
    Txttitle.delegate=self;
    date_change=NO;
    self.navigationController.navigationBarHidden=YES;
    topImg_vw.backgroundColor=[UIColor colorWithRed:0/255.0 green:168/255.0 blue:198/255.0 alpha:1];
    photo_img_Vw.image=[UIImage imageNamed:[_array_value valueForKey:@"image"]];
    
    
    if ([[_array_value valueForKey:@"image"] containsString:@"cam"] || [[_array_value valueForKey:@"image"] containsString:@"gal"])
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:[@"/" stringByAppendingString:[_array_value valueForKey:@"image"]]];
        photo_img_Vw.image=[UIImage imageWithContentsOfFile:getImagePath];
        photo_img_Vw.image=[self image_function:photo_img_Vw.image scaledToSize:photo_img_Vw.image.size andcount_height:1 andcount_width:1  andmode:UIViewContentModeScaleToFill and_number:photo_img_Vw.image.imageOrientation];
        
        if (photo_img_Vw.image==nil)
        {
            
            
            if (self.view.frame.size.width>500)
            {
                photo_img_Vw.image=[UIImage imageNamed:@"defaulf_half_ipad"];
            }
            else
            {
                photo_img_Vw.image=[UIImage imageNamed:@"defaulf_half_iphone"];
            }
           
            [photo_img_Vw setClipsToBounds:YES];

        }

        
    }
    NSLog(@"edit imaged====%@",[_array_value valueForKey:@"image"]);
    
    Txttitle.text=[_array_value valueForKey:@"title"];
    lbl_lower.text=[_array_value valueForKey:@"title"];
    lblsound_name.text=[_array_value valueForKey:@"ringtoneName"];
    str_lblsound=lblsound_name.text;
    
    NSDate *date=[_array_value valueForKey:@"eventDate"];
    NSDate *date1=[NSDate date];
    
    NSTimeInterval distanceBetweenDates = [date timeIntervalSinceDate:date1];
    double secondsInAnHour = 3600*24;
    double sec = 3600;
    double min= 60;
    NSInteger daysBetweenDates = distanceBetweenDates / secondsInAnHour;
    NSUInteger hoursBetweenDates=distanceBetweenDates / sec;
    NSUInteger minutebetweenDates=distanceBetweenDates/ min;
    NSLog(@"%ld",(long)hoursBetweenDates);
    
    if (hoursBetweenDates==0)
    {
        lbltime.text=[NSString stringWithFormat:@"%lu Min Left",(unsigned long)minutebetweenDates];
        lbl_event_bar.text=[NSString stringWithFormat:@"%ld",(unsigned long)minutebetweenDates];
        lbl_upper.text=@"MINUTE LEFT";
    }
    
    else if (daysBetweenDates==0)
    {
        
        lbltime.text=[NSString stringWithFormat:@"%lu Hr Left",(unsigned long)hoursBetweenDates];
        lbl_event_bar.text=[NSString stringWithFormat:@"%ld",(unsigned long)hoursBetweenDates];
        lbl_upper.text=@"HOUR LEFT";
        
    }
    else
    {
        
        lbltime.text=[NSString stringWithFormat:@"%ld Days left",(long)daysBetweenDates];
        lbl_event_bar.text=[NSString stringWithFormat:@"%ld",(long)daysBetweenDates];
        lbl_upper.text=@"DAYS LEFT";
    }
    
    
    
    
    ring_tones_array=[[NSArray alloc]initWithObjects:@"Apex",@"Beacon",@"Bulletin",@"By The Seaside",@"Chimes",@"Circuit",@"Constellation",@"Cosmic",@"Crystals",@"Hillside",@"Illuminate",@"Night Owl",@"Opening",@"Playtime",@"Presto",@"Radar",@"Radiate",@"Ripples",@"Sencha",@"Signal",@"Silk",@"Slow Rise",@"Stargaze",@"Summit",@"Twinkle",@"Uplift",@"Waves",nil];
    tableVw.dataSource=self;
    tableVw.delegate=self;
    [slider addTarget:self action:@selector(slider_move:) forControlEvents:UIControlEventValueChanged];
    [switchOnOff addTarget:self action:@selector(switchOnOFF:) forControlEvents:UIControlEventValueChanged];
    NSString *alpha=[NSString stringWithFormat:@"%@",[_array_value valueForKey:@"alpha"]];
    
    float alpha1=[alpha floatValue];
    slider.value=alpha1;
    Vw_event_bar.alpha=alpha1;
    
    
    UIPanGestureRecognizer *pgr = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(handlePan:)];
    [Vw_event_bar addGestureRecognizer:pgr];
    
    
    
    if (self.view.frame.size.width>500)
    {
        scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,640 );
    }
    else if (self.view.frame.size.width==414)
    {
        scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,435 );
        
    }
    else
    {
        scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,400 );
    }
    scrollVw.userInteractionEnabled=YES;
    
}


-(void)update_arrays_in_edit
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
    
    [tableVw reloadData];
}



- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    
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

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [datepicker removeFromSuperview];
    
    [self animateTextField:textField up:YES];
    
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    lbl_lower.text=Txttitle.text;
    [self animateTextField:textField up:NO];
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [Txttitle resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [Txttitle resignFirstResponder];
    return YES;
}
-(IBAction)back_btn:(id)sender
{
    //    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"event_bar_image"];
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)switchOnOFF:(UISwitch *)sender
{
    if (sender.on)
    {
        onOff=@"YES";
        switch_value=@"change";
    }
    else
    {
        onOff=@"NO";
        switch_value=@"changed";
        NSDate *date=[_array_value valueForKey:@"notificationDate"];
        
        NSArray *local=[[UIApplication sharedApplication]scheduledLocalNotifications];
        NSLog(@"%@",local);
        for (int i=0; i<[local count]; i++)
        {
            UILocalNotification *notify=[local objectAtIndex:i];
            NSLog(@"%@",[notify.userInfo valueForKey:@"notificationDate"]);
            NSDate *date3=[notify.userInfo valueForKey:@"notificationDate"];
            if ([date3 compare:date ]==NSOrderedSame)
            {
                UILocalNotification *notify_result=[local objectAtIndex:i];
                NSLog(@"%@",notify_result);
                [[UIApplication sharedApplication]cancelLocalNotification:notify_result];
            }
        }
        
    }
    
}
#pragma mark viewWillAppear
-(void)viewWillAppear:(BOOL)animated
{
    [self update_arrays_in_edit];
  
    
    
    [tableVw reloadData];
    
    
    onOff=[_array_value valueForKey:@"notOnOff"];
    if ([[_array_value valueForKey:@"notOnOff"] isEqualToString:@"YES"])
    {
        [switchOnOff setOn:YES];
    }
    else if ([[_array_value valueForKey:@"notOnOff"] isEqualToString:@"NO"])
    {
        [switchOnOff setOn:NO];
    }
    NSString *str_img_name=[[NSUserDefaults standardUserDefaults]valueForKey:@"event_bar_image"];
    if (str_img_name)
    {
        img_event_bar.image=[UIImage imageNamed:str_img_name];
    }
    else
    {
        img_event_bar.image=[UIImage imageNamed:[_array_value valueForKey: @"eventbarlargeimage"]];
    }
    
    
    
    Vw_event_bar.frame=CGRectMake([_x_from_full_to_edit intValue], [_y_from_full_to_edit intValue], Vw_event_bar.frame.size.width, Vw_event_bar.frame.size.height);
    
    x_axis=Vw_event_bar.frame.origin.x;
    y_axis=Vw_event_bar.frame.origin.y;
    //    Vw_event_bar.center=photo_img_Vw.center;
    
    
    
    
    if ([str_img_name isEqualToString:@"new_hand.png"])
    {
        lbl_event_bar.frame=CGRectMake(lbl_event_bar.frame.origin.x, lbl_event_bar.frame.origin.y, lbl_event_bar.frame.size.width, lbl_event_bar.frame.size.height);
    }
    else if ([str_img_name isEqualToString:@"new_sun.png"] )
    {
        lbl_event_bar.frame=CGRectMake(lbl_event_bar.frame.origin.x+3, lbl_event_bar.frame.origin.y, lbl_event_bar.frame.size.width, lbl_event_bar.frame.size.height);
    }
    else
    {
        lbl_event_bar.frame=CGRectMake(lbl_event_bar.frame.origin.x-2, lbl_event_bar.frame.origin.y, lbl_event_bar.frame.size.width, lbl_event_bar.frame.size.height);
    }
    
    
}






-(IBAction)notification_sound:(id)sender
{
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
    lblsound_name.text=str_ringName;
    if ([str_lblsound isEqualToString:lblsound_name.text])
    {
        
    }
    else
    {
        NSDate *date=[_array_value valueForKey:@"notificationDate"];
        
        NSArray *local=[[UIApplication sharedApplication]scheduledLocalNotifications];
        NSLog(@"%@",local);
        for (int i=0; i<[local count]; i++)
        {
            UILocalNotification *notify=[local objectAtIndex:i];
            //   NSLog(@"%@",[notify.userInfo valueForKey:@"notificationDate"]);
            NSDate *date3=[notify.userInfo valueForKey:@"notificationDate"];
            if ([date3 compare:date ]==NSOrderedSame)
            {
                UILocalNotification *notify_result=[local objectAtIndex:i];
                NSLog(@"%@",notify_result);
                [[UIApplication sharedApplication]cancelLocalNotification:notify_result];
            }
        }
    }
    [_ring_picker removeFromSuperview];
    [ring_toolbar removeFromSuperview];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


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

-(void)slider_move:(UISlider *)sender
{
    Vw_event_bar.alpha=sender.value;
}

-(IBAction)Event_bar:(id)sender
{
    EventBarViewController *event=[self.storyboard instantiateViewControllerWithIdentifier:@"eventbar"];
    [self.navigationController pushViewController:event animated:YES];
}

-(IBAction)Event_time:(id)sender
{
    [Txttitle resignFirstResponder];
    
    [datepicker removeFromSuperview];
    [numberToolbar removeFromSuperview];
    numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-212, self.view.frame.size.width, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(canceldatepicker)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)],
                           nil];
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
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"M-d-yyyy"]; // from here u can change format..
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
        return 150;
    }
    else
    {
        cell_height=80;
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
    }
    else
    {
        listimageview = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, tableVw.frame.size.width-10, cell_height)];
        listimageview.tag = 1001;
        listimageview.userInteractionEnabled=YES;
        [cell.contentView addSubview:listimageview];
        btn_purchase=[UIButton buttonWithType:UIButtonTypeCustom];
        btn_purchase.frame=CGRectMake(listimageview.frame.size.width-25, listimageview.frame.size.height-25, 25, 25);
        btn_purchase.tag=1002;
        [btn_purchase setBackgroundImage:[UIImage imageNamed:@"download-btn.png"] forState:UIControlStateNormal];
        
        //   [btn_purchase addTarget:self action:@selector(goto_store) forControlEvents:UIControlEventTouchUpInside];
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
        [btn_camera addTarget:self action:@selector(pick_image) forControlEvents:UIControlEventTouchUpInside];
    }
    btn_camera.center=listimageview.center;
    if (indexPath.row==0)
    {
        [btn_purchase setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
        btn_purchase.userInteractionEnabled=NO;
        [listimageview addSubview:btn_purchase];
    }
    listimageview.image=[UIImage imageNamed:[arr_images1 objectAtIndex:indexPath.row]];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}

- (IBAction)UP_tableview:(id)sender
{
    if (tableVw.contentOffset.y<cell_height* [arr_images1 count]+tableVw.frame.size.height+cell_height)
    {
        [tableVw setContentOffset:CGPointMake(0,tableVw.contentOffset.y+cell_height) animated:YES];
    }
    
}

-(IBAction)down_tableVw:(id)sender
{
    
    NSLog(@"%f",tableVw.contentOffset.y);
    if (tableVw.contentOffset.y>=0)
    {
        [tableVw setContentOffset:CGPointMake(0,tableVw.contentOffset.y-cell_height) animated:YES];
    }
}

-(void)pick_image
{
    UIActionSheet* action=[[UIActionSheet alloc]initWithTitle:@"Choose" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera",@"Photo Library",nil];
    [action showInView:self.view];
}
- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0)
    {
        cam=YES;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
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
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Camera not available" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
    else if (buttonIndex==1)
    {
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

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker1
{
    [picker1 dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker1 didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    chosenImage = info[UIImagePickerControllerOriginalImage];
    CGFloat imageWidth = chosenImage.size.width;
    CGFloat imageHeight =chosenImage.size.height;
    
    NSLog(@"=======%f",imageWidth);
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


#pragma mark did select row

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    img_change=@"YES";
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
    
    
    
}

-(void)done
{
    //    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    //    [format setDateFormat:@"MM/dd/yy:hh:mm"];
    //    NSString*str_date=[format stringFromDate:datepicker.date];
    //    NSDate* date2=[format dateFromString:str_date];
    //    NSDate* date1 = [NSDate date];
    //    NSTimeInterval distanceBetweenDates = [date2 timeIntervalSinceDate:date1];
    //    double secondsInAnHour = 3600*24;
    //    double sec = 3600;
    //    double min=60;
    //    NSInteger daysBetweenDates = distanceBetweenDates / secondsInAnHour;
    //    NSUInteger hoursBetweenDates=distanceBetweenDates / sec;
    //    NSUInteger minutebetweenDates=distanceBetweenDates/min;
    //    NSLog(@"%ld",(long)hoursBetweenDates);
    //
    //
    //    NSDateFormatter *date_format1=[[NSDateFormatter alloc]init];
    //    [date_format1  setDateFormat:@"MM/dd/yy:hh:mm"];
    //    NSString *now2=[date_format1 stringFromDate:[NSDate date]];
    //    NSDate *now3=[date_format1 dateFromString:now2];
    //
    //    NSDateFormatter *date_format4=[[NSDateFormatter alloc]init];
    //    [date_format4  setDateFormat:@"MM/dd/yy:hh:mm"];
    //    NSString *now4=[date_format4 stringFromDate:datepicker.date];
    //    NSDate *now5=[date_format4 dateFromString:now4];
    //
    //    NSLog(@"current time=%@",now3);
    //    NSLog(@"selected time=%@",now5);
    //    if ([now5 compare:now3] == NSOrderedDescending)
    //    {
    //        if (hoursBetweenDates==0)
    //        {
    //            lbltime.text=[NSString stringWithFormat:@"%ld Min Left",(long)minutebetweenDates];
    //            lbl_upper.text=@"MINUTE LEFT";
    //            lbl_event_bar.text=[NSString stringWithFormat:@"%ld",(unsigned long)minutebetweenDates];
    //        }
    //
    //        else if (daysBetweenDates==0)
    //        {
    //            lbltime.text=[NSString stringWithFormat:@"%ld Hr Left",(long)hoursBetweenDates];
    //            lbl_upper.text=@"HOUR LEFT";
    //            lbl_event_bar.text=[NSString stringWithFormat:@"%ld",(unsigned long)hoursBetweenDates];
    //        }
    //        else
    //        {
    //            lbltime.text=[NSString stringWithFormat:@"%ld Days Left",(long)daysBetweenDates];
    //            lbl_upper.text=@"DAYS LEFT";
    //            lbl_event_bar.text=[NSString stringWithFormat:@"%ld",(long)daysBetweenDates];
    //        }
    //        date_change=YES;
    //    }
    //    else
    //    {
    //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Event time should not be the current time." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //        [alert show];
    //    }
    //
    //
    //
    //    [datepicker removeFromSuperview];
    //    [numberToolbar removeFromSuperview];
    
    
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
        date_change=YES;
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

#pragma mark btn_delete
-(IBAction)btn_delete:(id)sender
{
    //  NSLog(@"%@",_array_value);
    
    NSString *str_image=[_array_value valueForKey:@"image"];
    NSString *str_image1=[_array_value valueForKey:@"image2"];
 
    NSString *str_title=[_array_value valueForKey:@"title"];
    NSPredicate *issuePredicate = [NSPredicate predicateWithFormat:@"image ==%@ AND image2 ==%@ AND  title ==%@ ", str_image,str_image1,str_title];
    NSArray *result=[Utility fetchRequest:issuePredicate];
    [[pro managedObjectContext] deleteObject:[result objectAtIndex:0]];
    NSError *error = nil;
    if (![[pro managedObjectContext] save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return;
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Event deleted successfully" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

#pragma mark save button

-(IBAction)save_btn:(id)sender
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
    else
    {
        NSString *str_img_name=[[NSUserDefaults standardUserDefaults]valueForKey:@"event_bar_image"];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title=%@ AND image=%@ AND eventDate=%@", [_array_value valueForKey:@"title"],[_array_value valueForKey:@"image"],[_array_value valueForKey:@"eventDate"]];
        NSArray *result=[Utility fetchRequest:predicate];
        
        for (NSManagedObjectContext *obj in result)
        {
            NSDateFormatter *format = [[NSDateFormatter alloc] init];
            [format setDateFormat:@"MM/dd/yy:hh:mm"];
            NSString*str_date=[format stringFromDate:[NSDate date]];
            NSDate* date2=[format dateFromString:str_date];
            
            if (camera==YES)
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
            
            [obj setValue:Txttitle.text forKey:@"title"];
            [obj setValue:date2 forKey:@"modifiedOn"];
            [obj setValue:[NSString stringWithFormat:@"%f",slider.value] forKey:@"alpha"];
            [obj setValue:[_array_value valueForKey:@"notOnOff"] forKey:@"notOnOff"];
            [obj setValue:[NSString stringWithFormat:@"%f",x_axis] forKey:@"x"];
            [obj setValue:[NSString stringWithFormat:@"%f",y_axis] forKey:@"y"];
            
            if ([str_lblsound isEqualToString:lblsound_name.text])
            {
                
            }
            else
            {
                [obj setValue:lblsound_name.text forKey:@"ringtoneName"];
            }
            
            if (camera==YES)
            {
                [obj setValue:[str_camera lastPathComponent] forKey:@"image"];
                [obj setValue:[str_camera lastPathComponent] forKey:@"image2"];
            }
            else  if ([img_change isEqualToString:@"YES"])
            {
                [obj setValue:[arr_images1 objectAtIndex:index] forKey:@"image"];
                [obj setValue:[arr_images5 objectAtIndex:index] forKey:@"image2"];
            }
            
            if (date_change==NO)
            {
                [obj setValue:[_array_value valueForKey:@"eventDate"] forKey:@"eventDate"];
            }
            else
            {
//                NSString*str_date=[format stringFromDate:datepicker.date];
//                NSDate* date1=[format dateFromString:str_date];
                [obj setValue:datepicker.date forKey:@"eventDate"];
            }
            
            
            
            if (self.view.frame.size.width>500)
            {
                if ([str_img_name isEqualToString:@"new_full-baloon-ipad.png"])
                {
                    [obj setValue:@"new_full-baloon-ipad.png" forKey:@"eventbarlargeimage"];
                    [obj setValue:@"new_baloon.png" forKey:@"eventbarsmallimage"];
                }
                else if ([str_img_name isEqualToString:@"full-bag-ipad.png"])
                {
                    [obj setValue:@"new_full-bag-ipad.png" forKey:@"eventbarlargeimage"];
                    [obj setValue:@"new_bag.png" forKey:@"eventbarsmallimage"];
                }
                else if ([str_img_name isEqualToString:@"full-sun-ipad.png"])
                {
                    [obj setValue:@"new_full-sun-ipad.png" forKey:@"eventbarlargeimage"];
                    [obj setValue:@"new_sun.png" forKey:@"eventbarsmallimage"];
                    
                }
                else if ([str_img_name isEqualToString:@"full-hand-ipad.png"])
                {
                    [obj setValue:@"new_full-hand-ipad.png" forKey:@"eventbarlargeimage"];
                    [obj setValue:@"new_hand.png" forKey:@"eventbarsmallimage"];
                    
                }
                else
                {
                    [obj setValue:@"new_full-pantagun-ipad.png" forKey:@"eventbarlargeimage"];
                    [obj setValue:@"new_pantagun.png" forKey:@"eventbarsmallimage"];
                }
                
                
            }
            else
            {
                if ([str_img_name isEqualToString:@"new_baloon.png"])
                {
                    [obj setValue:@"new_baloon.png" forKey:@"eventbarlargeimage"];
                    [obj setValue:@"new_half-baloon.png" forKey:@"eventbarsmallimage"];
                    
                }
                else if ([str_img_name isEqualToString:@"new_bag.png"])
                {
                    [obj setValue:@"new_bag.png" forKey:@"eventbarlargeimage"];
                    [obj setValue:@"new_half-bag.png" forKey:@"eventbarsmallimage"];
                }
                else if ([str_img_name isEqualToString:@"new_sun.png"])
                {
                    [obj setValue:@"new_sun.png" forKey:@"eventbarlargeimage"];
                    [obj setValue:@"new_half-sun.png" forKey:@"eventbarsmallimage"];
                    
                }
                else if ([str_img_name isEqualToString:@"new_hand.png"])
                {
                    [obj setValue:@"new_hand.png" forKey:@"eventbarlargeimage"];
                    [obj setValue:@"new_half-hand.png" forKey:@"eventbarsmallimage"];
                }
                else
                {
                    [obj setValue:@"new_pantagun.png" forKey:@"eventbarlargeimage"];
                    [obj setValue:@"new_half-pantagun.png" forKey:@"eventbarsmallimage"];
                }
                
            }
            
            
            
            
            
            
            
            
            [self delete_notification];
            UILocalNotification* reminderNote=[[UILocalNotification alloc]init];
            if (date_change==YES)
            {
//                NSString*str_date1=[format stringFromDate:datepicker.date];
//                NSDate* eventDate=[format dateFromString:str_date1];
                reminderNote.fireDate=datepicker.date;
            }
            else
            {
                reminderNote.fireDate =[_array_value valueForKey:@"eventDate"];
            }
            
            reminderNote.repeatInterval = 0;
            reminderNote.alertBody = Txttitle.text;
            reminderNote.alertAction = @"View";
            reminderNote.soundName = [NSString stringWithFormat:@"%@.m4r",lblsound_name.text];
            NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:reminderNote.fireDate, @"notificationDate", nil];
            reminderNote.userInfo=infoDict;
            
            [[UIApplication sharedApplication] scheduleLocalNotification:reminderNote];
            [obj setValue:[infoDict valueForKey:@"notificationDate"] forKey:@"notificationDate"];
            [pro saveContext];
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        }}
}

-(void)delete_notification
{
    
}

- (NSString *)documentsPathForFileName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    return [documentsPath stringByAppendingPathComponent:name];
}
-(void)canceldatepicker
{
    [datepicker removeFromSuperview];
    [numberToolbar removeFromSuperview];
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
    }    else if(number==2)
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
