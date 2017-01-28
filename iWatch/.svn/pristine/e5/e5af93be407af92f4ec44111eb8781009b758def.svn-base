//
//  StoreViewController.h
//  New_Iwatch_app
//
//  Created by Sahil1 on 02/04/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "MBProgressHUD.h"

@interface StoreViewController : UIViewController<SKProductsRequestDelegate,SKPaymentTransactionObserver,SKRequestDelegate,SKStoreProductViewControllerDelegate>

{
    NSArray *store_images1;
     NSArray *store_images2;
     NSArray *store_images3;
     NSArray *store_images4;
     NSArray *store_images5;
     NSArray *store_images6;
     NSArray *store_images7;
    NSArray *arr_value1;
    NSArray *arr_value2;
    NSArray *arr_value3;
    NSArray *arr_value4;
    NSArray *arr_value5;
    NSArray *arr_value6;
    NSArray *arr_value7;
    IBOutlet UIImageView *top_img_vw;
    IBOutlet UIScrollView *scrollVw;
}
@property (strong, nonatomic) SKProductsRequest *productsRequest;
@property (strong, nonatomic) SKPaymentQueue *skPaymentQueue;

-(IBAction)img_btn_pressed:(id)sender;
-(IBAction)back_btn:(id)sender;

@end
