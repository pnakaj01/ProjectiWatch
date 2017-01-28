//
//  FullEventViewController.m
//  New_Iwatch_app
//
//  Created by Sahil1 on 26/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "FullEventViewController.h"
#import "EditEventViewController.h"
#import <Social/Social.h>
#import "constant.h"


@implementation FullEventViewController
{
    UIImage *screenshot_share;
    NSString *str;
    NSString *link_of_app;
}
-(void)viewDidLoad
{
    
    
    
    if (![[[NSUserDefaults standardUserDefaults] valueForKey:@"ads"]isEqualToString:@"remove"])
    {
        appNextView=[[AppNextUIView alloc] init];
        [appNextView setID:@"eebcda98-2f8d-476f-9200-65e727476497"];
        [appNextView setAppnextDelegate:self];
    }

    
    
    
    link_of_app=@"Create your own event countdowns for FREE with Great Days: https://itunes.apple.com/us/app/great-days-event-countdown/id988383516?ls=1&mt=8";
    str=@"Great Days";
    self.navigationController.navigationBarHidden=YES;
    top_img_vw.backgroundColor=[UIColor colorWithRed:0/255.0 green:168/255.0 blue:198/255.0 alpha:1];
    full_img_vw.userInteractionEnabled=YES;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mySelector)];
    tapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
    
    NSDate *date=[_array_value valueForKey:@"eventDate"];
    NSDate *date1=[NSDate date];
    NSTimeInterval distanceBetweenDates = [date timeIntervalSinceDate:date1];
    double secondsInAnHour = 3600*24;
    double sec = 3600;
    double min=60;
    NSInteger daysBetweenDates = distanceBetweenDates / secondsInAnHour;
    NSUInteger hoursBetweenDates=distanceBetweenDates / sec;
    NSUInteger minutebetweenDates=distanceBetweenDates/min;
    NSLog(@"%ld",(long)hoursBetweenDates);
    
    if (hoursBetweenDates==0)
    {
        lbldaystext.text=@"Minute Left";
        lbldaysleft.text=[NSString stringWithFormat:@"%lu",(unsigned long)minutebetweenDates];
    }
    
    else if (daysBetweenDates==0)
    {
        lbldaystext.text=@"Hour Left";
        lbldaysleft.text=[NSString stringWithFormat:@"%lu",(unsigned long)hoursBetweenDates];
    }
    else
    {
        lbldaystext.text=@"Days Left";
        lbldaysleft.text=[NSString stringWithFormat:@"%ld",(long)daysBetweenDates];
    }
    
    
    
    
    
    
    
    
    
    
    
    
    full_img_vw.image=[UIImage imageNamed:[_array_value valueForKey:@"image2"]];
    
    
    
    UIImage *img_obj;
    img_obj=[UIImage imageNamed:[_array_value  valueForKey:@"image2"]];
    full_img_vw.image=img_obj;
    
    if (self.view.frame.size.width>500)
    {
        NSString *large;
        if ([[_array_value  valueForKey:@"image2"] rangeOfString:@"_ipad.png"].location == NSNotFound)
        {
            large =[[_array_value valueForKey:@"image2"] stringByReplacingOccurrencesOfString:@".png" withString:@"_ipad.png"];
            full_img_vw.image=[UIImage imageNamed:large];
        }
        
    }
    
    else
    {
        NSString *large;
        if ([[_array_value  valueForKey:@"image2"] rangeOfString:@"_ipad.png"].location != NSNotFound)
        {
            large =[[_array_value  valueForKey:@"image2"] stringByReplacingOccurrencesOfString:@"_ipad.png" withString:@".png"];
            full_img_vw.image=[UIImage imageNamed:large];
        }
        
    }

    
    
    
    
    
    if ([[_array_value valueForKey:@"image2"] containsString:@"cam"] || [[_array_value valueForKey:@"image2"] containsString:@"gal"])
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:[@"/" stringByAppendingString:[_array_value valueForKey:@"image2"]]];
        full_img_vw.image=[UIImage imageWithContentsOfFile:getImagePath];
         full_img_vw.image=[self image_function:full_img_vw.image scaledToSize:full_img_vw.image.size andcount_height:1 andcount_width:1  andmode:UIViewContentModeScaleAspectFill and_number:full_img_vw.image.imageOrientation];
        
        if (full_img_vw.image==nil)
        {
            
            
            if (self.view.frame.size.width>500)
            {
                full_img_vw.image=[UIImage imageNamed:@"defaulf_full_ipad"];
            }
            else
            {
                full_img_vw.image=[UIImage imageNamed:@"defaulf_full_iphone"];
            }
        }
    }
    
    
    lbltitle.text=[_array_value valueForKey:@"title"];
    top_lbl_title.text=[_array_value valueForKey:@"title"];
    
    NSArray *str_to_arr=[[_array_value valueForKey:@"eventbarlargeimage"] componentsSeparatedByString:@"_"];
 //   NSArray *str_to_arr_1=[[str_to_arr objectAtIndex:1] componentsSeparatedByString:@"."];
    NSString *image_name=[@"detail_" stringByAppendingString:[_array_value valueForKey:@"eventbarlargeimage"]];
    NSLog(@"=====%@",image_name);
    
    NSLog(@"%f",self.view.frame.size.width);
    
   if (self.view.frame.size.width>500)
    {
        event_bar_img_vw.image=[UIImage imageNamed:[_array_value valueForKey:@"eventbarlargeimage"]];
        NSString *str1=[_array_value valueForKey:@"eventbarlargeimage"];
       [self label:124 balloonY:37 HX:132 HY:45 BX:124 BY:50 PX:140 PY:34 SX:140 SY:38  str:str1];
        event_bar_img_vw.frame=CGRectMake(19,[_y_from_home intValue],730,180);
    }
    else if(self.view.frame.size.width==375)
    {
        event_bar_img_vw.image=[UIImage imageNamed:[_array_value valueForKey:@"eventbarlargeimage"]];
        NSString *str1=[_array_value valueForKey:@"eventbarlargeimage"];
        [self label:28 balloonY:40 HX:35 HY:47 BX:26 BY:47 PX:30 PY:42 SX:28 SY:43  str:str1];
         event_bar_img_vw.frame=CGRectMake(10,[_y_from_home intValue]-10,355,130);
        if ([_y_from_home intValue]>500)
        {
            event_bar_img_vw.frame=CGRectMake(10,[_y_from_home intValue]-45,355,130);
        }
    }
    else if (self.view.frame.size.width==414)
    {
        event_bar_img_vw.image=[UIImage imageNamed:image_name];
        NSString *str1=[_array_value valueForKey:@"eventbarlargeimage"];
        [self label:64 balloonY:19 HX:75 HY:33 BX:66 BY:33 PX:68 PY:23 SX:75 SY:25  str:str1];
        event_bar_img_vw.frame=CGRectMake(10,[_y_from_home intValue],self.view.frame.size.width-20,95);
        
    }
    else
    {
        event_bar_img_vw.image=[UIImage imageNamed:image_name];
        NSString *str1=[_array_value valueForKey:@"eventbarlargeimage"];
        [self label:18 balloonY:23 HX:31 HY:37 BX:20 BY:37 PX:22 PY:27 SX:22 SY:26  str:str1];
         event_bar_img_vw.frame=CGRectMake(10,[_y_from_home intValue],self.view.frame.size.width-20,95);
    }
    
    event_bar_img_vw.contentMode=UIViewContentModeScaleAspectFit;
    
    NSString *str1=[_array_value valueForKey:@"alpha"];
    CGFloat alp=[str1 floatValue];
    event_bar_img_vw.alpha=alp;
    
    

}



-(UIImage*)image_function:(UIImage*)image_obj
                     scaledToSize:(CGSize)newSize andcount_height:(int)count_height andcount_width:(int)count_width andmode:(UIViewContentMode)content_mode and_number:(UIImageOrientation)number;
{
    
    double refWidth = CGImageGetWidth(image_obj.CGImage);
    double refHeight = CGImageGetHeight(image_obj.CGImage);
    
    double x = (refWidth - newSize.width) / 2.0;
    double y = (refHeight - newSize.height) / 2.0;
    
   // NSLog(@"In full=====%ld",number);
    
    UIImage* properlyRotatedImage;
    if (number==0)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        full_img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:UIImageOrientationUp];
    }
    
    else if(number==1)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        full_img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:1];
    }
    else if(number==2)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_width, newSize.width/count_height);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        full_img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:2];
    }

    else if(number==3)
    {
        CGRect cropRect = CGRectMake(x, y, newSize.height/count_height, newSize.width/count_width);
        CGImageRef imageRef = CGImageCreateWithImageInRect([image_obj CGImage], cropRect);
        UIImage *newImage   = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        full_img_vw.contentMode=content_mode;
        CGImageRef imageReff = [newImage CGImage];
        properlyRotatedImage = [UIImage imageWithCGImage:imageReff scale:1.0 orientation:3];
    }
    
 return properlyRotatedImage;
}






-(void)viewWillAppear:(BOOL)animated
{
    [btn_edit_event removeFromSuperview];
    screenshot_share=[self screenshot];
    
    bool_from_appdelegate=YES;
    
}
-(void)mySelector
{
    btn_edit_event=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn_edit_event addTarget:self action:@selector(push_edit) forControlEvents:UIControlEventTouchUpInside];
    if (self.view.frame.size.width>500)
    {
        btn_edit_event.frame=CGRectMake(15, self.view.frame.size.height-86, self.view.frame.size.width-30, 71);
        btn_edit_event.titleLabel.font = [UIFont systemFontOfSize:35];
    }
    else
    {
        btn_edit_event.frame=CGRectMake(15, self.view.frame.size.height-60, self.view.frame.size.width-30, 45);
        btn_edit_event.titleLabel.font = [UIFont systemFontOfSize:22];
        
    }
    
    [btn_edit_event setBackgroundColor:[UIColor colorWithRed:52/255.0 green:152/255.0 blue:186/255.0 alpha:1]];
    [btn_edit_event setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_edit_event setTitle:@"Edit Event" forState:UIControlStateNormal];
    
    
    
    
    
    [self.view addSubview:btn_edit_event];
}
-(void)push_edit
{
    EditEventViewController *edit=[self.storyboard instantiateViewControllerWithIdentifier:@"EditEvent"];
    edit.x_from_full_to_edit=_x_from_home_to_full;
    edit.y_from_full_to_edit=_y_from_home_to_full;
    edit.array_value=_array_value;
    [self.navigationController pushViewController:edit animated:YES];
}
-(IBAction)back_btn:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}
-(IBAction)share_btn:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:str delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Facebook", @"Twitter", @"Mail",@"SMS", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    {
        if (buttonIndex == 0) //
        {
            [self facebook];
        }
        else if (buttonIndex == 1)//
        {
            [self twitter];
        }
        else if(buttonIndex == 2)//
        {
            [self mail];
        }
        else if(buttonIndex == 3)//
        {
            [self sms];
        }
        else //cancel
        {
            
        }
    }
}


-(void)facebook
{
    SLComposeViewController *composeController;
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        composeController = [SLComposeViewController
                             composeViewControllerForServiceType:SLServiceTypeFacebook];
        [composeController setInitialText:link_of_app];
        [composeController addImage:screenshot_share];
        [self presentViewController:composeController animated:YES completion:nil];
        [composeController setCompletionHandler:^(SLComposeViewControllerResult result) {
            
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"Post Canceled");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"Post Sucessful");
                    break;
                    
                default:
                    break;
            }
        }];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please login to facebook from setting and try again" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

-(void)twitter
{
    SLComposeViewController *composeController;
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        composeController = [SLComposeViewController
                             composeViewControllerForServiceType:SLServiceTypeTwitter];
        [composeController addImage:screenshot_share];
        [composeController setInitialText:link_of_app];
        [self presentViewController:composeController animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please login to twitter from setting and try again" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

-(void)mail
{
    if([MFMailComposeViewController canSendMail])
    {
       
        NSMutableString *emailBody = [[NSMutableString alloc] initWithString:@"<html><body>"];
        NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(screenshot_share)];
        NSString *base64String =  [imageData base64EncodedStringWithOptions:0];
        [emailBody appendString:[NSString stringWithFormat:@"<p><b><img src='data:image/png;base64,%@'></b></p>",base64String]];
        [emailBody appendString:@"<p>Create your own event countdowns for FREE with Great Days: https://itunes.apple.com/us/app/great-days-event-countdown/id988383516?ls=1&mt=8</p>"];
       [emailBody appendString:@"</body></html>"];
        
        MFMailComposeViewController *emailDialog = [[MFMailComposeViewController alloc] init];
        emailDialog.mailComposeDelegate = self;
        [emailDialog setSubject:str];
        [emailDialog setMessageBody:emailBody isHTML:YES];
        [self presentViewController:emailDialog animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please add a mail account from setting and try again" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

-(void)sms
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendAttachments])
    {
        controller.body = link_of_app;
        [controller addAttachmentData:UIImagePNGRepresentation(screenshot_share) typeIdentifier:@"public.data" filename:@"image.png"];
        controller.delegate = self;
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MessageComposeResultSent:
        {
            break;
        }
        case MessageComposeResultFailed:
            NSLog(@"Result: failed");
            break;
        default:
            NSLog(@"Result: not sent");
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    switch (result)
    {
        case MessageComposeResultSent:
        {
            NSLog(@"sent");
            break;
        }
        case MessageComposeResultFailed:
            NSLog(@"Result: failed");
            break;
        default:
            NSLog(@"Result: not sent");
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)label:(int)bsx balloonY:(int)bsy HX:(int)hx HY:(int)hy BX:(int)bx BY:(int)by  PX:(int)px PY:(int)py SX:(int)sx SY:(int)sy str:(NSString*)string
{
    if ([string isEqualToString:@"new_bag.png"]||[string isEqualToString:@"new_half-bag.png"]||[string isEqualToString:@"new_full-bag-ipad.png"])
    {
        lbldaysleft.frame=CGRectMake(bx, by, 48, 44);
    }
    else if([string isEqualToString:@"new_hand.png"]||[string isEqualToString:@"new_half-hand.png"]|[string isEqualToString:@"new_full-hand-ipad.png"])
    {
        lbldaysleft.frame=CGRectMake(hx-8, hy, 48, 44);
    }
    else if([string isEqualToString:@"new_sun.png"]||[string isEqualToString:@"new_half-sun.png"]|[string isEqualToString:@"new_full-sun-ipad.png"])
    {
        lbldaysleft.frame=CGRectMake(sx, sy, 48, 44);
    }
    else if([string isEqualToString:@"new_baloon.png"]||[string isEqualToString:@"new_half-baloon.png"]|[string isEqualToString:@"new_full-baloon-ipad.png"])
    {
        lbldaysleft.frame=CGRectMake(bsx, bsy, 48, 44);
    }
    else
    {
        lbldaysleft.frame=CGRectMake(px-4, py, 48, 44);
    }
    
}





-(UIImage*)screenshot
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(self.view.bounds.size);
    
    [full_img_vw.layer renderInContext:UIGraphicsGetCurrentContext()];
    

    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}




#pragma mark app next delegate

- (void)noAds
{
    NSLog(@"no adds");
}
- (void)AdLoaded
{
    if (bool_from_appdelegate==YES)
    {
        [appNextView showPopup];
    }
    
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


@end
