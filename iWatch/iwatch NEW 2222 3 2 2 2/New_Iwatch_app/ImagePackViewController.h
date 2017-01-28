//
//  ImagePackViewController.h
//  New_Iwatch_app
//
//  Created by Sahil1 on 02/04/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "MBProgressHUD.h"

@interface ImagePackViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,SKProductsRequestDelegate,SKPaymentTransactionObserver,SKRequestDelegate,SKStoreProductViewControllerDelegate>

{
    IBOutlet UIImageView *top_img_vw;
     UICollectionView*collectionVwImages;
    UIImageView *img_vw;
    __weak IBOutlet UIButton *image_pack_obj;
    __weak IBOutlet UIButton *bundle_btn;
}
-(IBAction)back_btn:(id)sender;
@property(strong,nonatomic)NSArray *from_store_images;;
@property(strong,nonatomic)NSArray *arr_result1;
@property(strong,nonatomic)NSArray *arr_result2;
@property(strong,nonatomic)NSArray *arr_result3;
@property(strong,nonatomic)NSArray *arr_result4;
@property(strong,nonatomic)NSArray *arr_result5;
@property(strong,nonatomic)NSArray *arr_result6;
@property(strong,nonatomic)NSArray *arr_result7;
@property(strong,nonatomic)NSString *tag_from_store;
@property (weak, nonatomic) IBOutlet UILabel *bundle;
@property (weak, nonatomic) NSString *bundle_str;


@property (strong, nonatomic) SKProductsRequest *productsRequest;
@property (strong, nonatomic) SKPaymentQueue *skPaymentQueue;

@end
