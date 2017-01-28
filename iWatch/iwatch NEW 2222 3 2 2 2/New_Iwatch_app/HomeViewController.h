//
//  HomeViewController.h
//  NewIwatch_app
//
//  Created by Sahil1 on 16/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//    NEW BUILD

#import <UIKit/UIKit.h>
#import "AppNextUIView.h"
#import "Utility.h"
#import "constant.h"

@interface HomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,AppnextDelegate>
{
    NSMutableArray *images;
    
    IBOutlet UIImageView *topimgVw;
    IBOutlet UITableView *tableVw;
    UICollectionView*collectionVwImages;
    NSMutableArray *array_data;
    NSArray *notification_array;
    int d;
    NSInteger days;
    NSMutableArray *array_result;
    UIImageView *img_vw;
    UIImageView *imgVw_days;
    UILabel *TxtVwtitle;
    UILabel *lbldaysleft;
    UILabel *lbltext;
    NSArray *sort_arr;
    UIButton *btn_event;
}
-(IBAction)Addevent:(id)sender;
-(IBAction)setting_btn:(id)sender;
@property (retain, nonatomic) AppNextUIView *appNextView1;



@end
