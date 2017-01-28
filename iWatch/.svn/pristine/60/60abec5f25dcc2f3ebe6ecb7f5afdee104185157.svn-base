//
//  AddEventViewController.h
//  New_Iwatch_app
//
//  Created by Sahil1 on 20/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppNextUIView.h"

@interface AddEventViewController : UIViewController<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,AppnextDelegate>
{
    IBOutlet UIImageView *photo_img_Vw;
    IBOutlet UISlider* slider;
    IBOutlet UISwitch * switchOnOff;
    IBOutlet UILabel * lblsound_name;
    IBOutlet UITextField * Txttitle;
    IBOutlet UILabel * lbltime;
    UIImagePickerController *image_picker;
    NSString* title;
    UIDatePicker * datepicker;
    UIToolbar* numberToolbar;
    IBOutlet UITableView *tableVw;
    UIImageView *listimageview;
    BOOL onOff;
    NSMutableDictionary *dict_info;
    NSInteger days;
    NSInteger hours;
    BOOL camera;
    
    NSArray *arr_images;
    NSArray *arr_images1;
  //  NSArray *arr_images2;
    //NSArray *arr_images3;
    NSArray *arr_images4;
    NSArray *arr_images5;
    
    UIButton *btn_purchase;
    NSString *str_image_name;
    NSUInteger index;
    UIButton *btn_camera;
    NSString *str_camera;
    
    NSString *str_normal;
   // NSString *str_horizontal;
    NSString *str_fullPage;
    NSString *str_halfPage;
    
    IBOutlet UIImageView *img_event_bar;
    IBOutlet UILabel *lbl_event_bar;
    IBOutlet UILabel *lbl_upper;
    IBOutlet UILabel *lbl_lower;
    IBOutlet UIView *Vw_event_bar;
    
    int up_value;
    int down_value;
    int cell_height;
    NSUInteger count;
    
    NSArray *ring_tones_array;
    UIToolbar *ring_toolbar;
    NSString *str_ringName;
    UIPickerView *_ring_picker;
}

- (IBAction)UP_tableview:(id)sender;
-(IBAction)down_tableVw:(id)sender;
-(IBAction)notification_sound:(id)sender;
-(IBAction)save:(id)sender;
-(IBAction)cancel:(id)sender;
-(IBAction)Event_time:(id)sender;
-(IBAction)Event_bar:(id)sender;

//@property (retain, nonatomic) AppNextUIView *appNextView;

@end
