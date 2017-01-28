//
//  EventBarViewController.h
//  New_Iwatch_app
//
//  Created by Sahil1 on 01/04/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "MBProgressHUD.h"
@interface EventBarViewController : UIViewController<SKProductsRequestDelegate,SKPaymentTransactionObserver,SKRequestDelegate,SKStoreProductViewControllerDelegate,UIActionSheetDelegate>
{
    IBOutlet UIImageView *top_img_vw;
    
    IBOutlet UIScrollView *scrollVW;
    
    NSDictionary * dict_pict;
    
    NSMutableArray *arr_pic;
   
      
    NSString *purchase_item;
    
    NSArray *result_value;
    __weak IBOutlet UIButton *ballon_obj;
    __weak IBOutlet UIButton *bag_obj;
    __weak IBOutlet UIButton *sun_obj;
    __weak IBOutlet UIButton *hand_obj;
}

@property (strong, nonatomic) SKProductsRequest *productsRequest;

@property (strong, nonatomic) SKPaymentQueue *skPaymentQueue;

-(IBAction)back_btn:(id)sender;

-(IBAction)ballon_buy:(id)sender;

-(IBAction)bag_buy:(id)sender;

-(IBAction)sun_buy:(id)sender;

-(IBAction)hand_buy:(id)sender;

@end
