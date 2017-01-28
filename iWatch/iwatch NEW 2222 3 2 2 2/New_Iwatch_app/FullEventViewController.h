//
//  FullEventViewController.h
//  New_Iwatch_app
//
//  Created by Sahil1 on 26/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditEventViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMessageComposeViewController.h>
#import "AppNextUIView.h"


@interface FullEventViewController : UIViewController<MFMessageComposeViewControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate,UIActionSheetDelegate,AppnextDelegate>
{
    IBOutlet UILabel *lbldaysleft;
    IBOutlet UILabel *lbldaystext;
    IBOutlet UIImageView *full_img_vw;
    IBOutlet UIImageView *top_img_vw;
    UIButton *btn_edit_event;
    IBOutlet UILabel *lbltitle;
    IBOutlet UILabel *top_lbl_title;
    IBOutlet UIImageView *event_bar_img_vw;
}
@property(strong,nonatomic) NSMutableArray *array_value;

@property(strong,nonatomic) NSString *x_from_home;
@property(strong,nonatomic) NSString *y_from_home;
@property(strong,nonatomic) NSString *widh_form_home;
@property(strong,nonatomic) NSString *height_from_home;

@property(strong,nonatomic) NSString *x_from_home_to_full;
@property(strong,nonatomic) NSString *y_from_home_to_full;



-(IBAction)back_btn:(id)sender;
-(IBAction)share_btn:(id)sender;

@end
