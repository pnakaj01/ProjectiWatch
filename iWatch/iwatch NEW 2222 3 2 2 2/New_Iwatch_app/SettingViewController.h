
//  SettingViewController.h
//  New_Iwatch_app
//
//  Created by Sahil1 on 26/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController
{
    IBOutlet UIImageView *top_img_vw;
    IBOutlet UIScrollView *scroll_Vw;
    IBOutlet UITextView *txtVw1;
    IBOutlet UITextView *txtVw2;
    IBOutlet UILabel *lblEvents;
  
}
@property(strong,nonatomic)NSArray *arr_value;
-(IBAction)back_btn:(id)sender;
-(IBAction)event_bar:(id)sender;
-(IBAction)remove_ads:(id)sender;
-(IBAction)proffesional_imagepack:(id)sender;

@property (strong, nonatomic) IBOutlet UISwitch *switch_obj;


@end
