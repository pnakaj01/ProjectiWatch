//
//  EditEventViewController.h
//  New_Iwatch_app
//
//  Created by Sahil1 on 26/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Proxy.h"

@interface EditEventViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UIAlertViewDelegate,UINavigationControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    IBOutlet UIImageView *topImg_vw;
    IBOutlet UIImageView *photo_img_Vw;
    IBOutlet UITableView *tableVw;
    IBOutlet UITextField* Txttitle;
    IBOutlet UILabel *lbltime;
    IBOutlet UISlider *slider;
    IBOutlet UISwitch *switchOnOff;
    IBOutlet UILabel * lblsound_name;
    UIDatePicker * datepicker;
    UIToolbar* numberToolbar;
    BOOL onOff;
    NSString* title;
    UIImageView *listimageview;
    NSArray *arr_images;
    NSArray *arr_images1;
   // NSArray *arr_images2;
   // NSArray *arr_images3;
    NSArray *arr_images4;
    NSArray *arr_images5;
    BOOL date_change;
    UIButton *btn_purchase;
    NSUInteger index;
    IBOutlet UIScrollView *scrollVw;
    UIImagePickerController *image_picker;
    BOOL camera;
    UIButton *btn_camera;
    NSString *str_camera;
    
    int up_value;
    int down_value;
    int cell_height;
    NSUInteger count;
    CGFloat yoffset;
    
    NSString*img_change;
    
    NSString *str_lblsound;
    
    NSString *switch_value;
    
    NSArray *ring_tones_array;
    
    UIToolbar *ring_toolbar;
    
    NSString *str_ringName;
    
    
    NSString *str_normal;
    NSString *str_horizontal;
    NSString *str_fullPage;
    NSString *str_halfPage;
    
    IBOutlet UIImageView *img_event_bar;
    IBOutlet UILabel *lbl_event_bar;
    IBOutlet UILabel *lbl_upper;
    IBOutlet UILabel *lbl_lower;
    IBOutlet UIView *Vw_event_bar;
}
@property (nonatomic, strong) UIPickerView *ring_picker;
@property(strong,nonatomic)NSMutableArray *array_value;

@property(strong,nonatomic) NSString *x_from_full_to_edit;
@property(strong,nonatomic) NSString *y_from_full_to_edit;

-(IBAction)notification_sound:(id)sender;
-(IBAction)Event_time:(id)sender;
-(IBAction)back_btn:(id)sender;
-(IBAction)save_btn:(id)sender;
-(IBAction)Event_bar:(id)sender;
-(IBAction)btn_delete:(id)sender;
- (IBAction)UP_tableview:(id)sender;
-(IBAction)down_tableVw:(id)sender;
@end
