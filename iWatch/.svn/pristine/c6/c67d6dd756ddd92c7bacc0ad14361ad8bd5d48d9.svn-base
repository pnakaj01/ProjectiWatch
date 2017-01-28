//
//  ImagePackViewController.m
//  New_Iwatch_app
//
//  Created by Sahil1 on 02/04/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "ImagePackViewController.h"
#define imagepack @"com.kbfredag.greatdays.imagepacks"
#define bundle @"com.kbfredag.greatdays.Bundle"




#define ChildrenImagePack @"com.kbfredag.greatdays.ChildrenImagePack"
#define PartyImagePack @"com.kbfredag.greatdays.PartyImagePack"
#define RomanticImagePack @"com.kbfredag.greatdays.RomanticImagePack"
#define SportyImagePack @"com.kbfredag.greatdays.SportyImagePack"
#define TravelVocationImagePack @"com.kbfredag.greatdays.TravelVocationImagePack"
#define TravelWayImagePack @"com.kbfredag.greatdays.TravelWayImagePack"


#import "Reachability.h"
#import "proxyService.h"

@interface ImagePackViewController ()
{
}
@end

@implementation ImagePackViewController
@synthesize productsRequest,skPaymentQueue;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    top_img_vw.backgroundColor=[UIColor colorWithRed:0/255.0 green:168/255.0 blue:198/255.0 alpha:1];
    // Do any additional setup after loading the view.
}
-(IBAction)back_btn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    _bundle.text=_bundle_str;
    [collectionVwImages removeFromSuperview];
    UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 5.0f;
    layout.minimumLineSpacing = 5.0f;
    collectionVwImages
    = [[UICollectionView alloc]initWithFrame:CGRectMake(0 , 64, self.view.frame.size.width, image_pack_obj.frame.origin.y-100) collectionViewLayout:layout];
    collectionVwImages.backgroundColor = [UIColor clearColor];
    [collectionVwImages registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    collectionVwImages.delegate=self;
    collectionVwImages.dataSource=self;
    collectionVwImages.hidden=NO;
    [self.view addSubview:collectionVwImages];
    
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"image_pack"] isEqualToString:_bundle_str])
    {
        [bundle_btn setTitle:@" USE THIS BUNDLE" forState:UIControlStateNormal];
    }
    
 //   NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:_tag_from_store]);
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:_tag_from_store] isEqualToString:_tag_from_store])
    {
        [image_pack_obj setTitle:@"USE THIS IMAGE PACK" forState:UIControlStateNormal];
    }
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  [_from_store_images count]-1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    img_vw=nil;
    if ([cell.contentView viewWithTag:10001])
    {
        img_vw=(UIImageView*)[cell.contentView viewWithTag:10001];
    }
    else
    {
        img_vw=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
        img_vw.tag=10001;
        [cell.contentView addSubview:img_vw];
    }
    img_vw.image=[UIImage imageNamed:[_from_store_images objectAtIndex:indexPath.row+1]];

    
    if (indexPath.row==2)
    {
        img_vw.contentMode = UIViewContentModeTop;
        [img_vw setClipsToBounds:YES];

    }
    
    
    
      return cell;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 3, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    
    if (indexPath.row==2)
    {
        if (self.view.frame.size.width>500)
        {
            return CGSizeMake(self.view.frame.size.width, 254);
        }
        else
        {
        return CGSizeMake(self.view.frame.size.width, 200);
        }
    }
    else
    {
        if (self.view.frame.size.width>500)
        {
            return CGSizeMake(collectionVwImages.frame.size.width / 2-3, 254);
        }
        else
        {
          return CGSizeMake(collectionVwImages.frame.size.width / 2-3, 200);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreat14ed.
}


#pragma mark image pack

- (IBAction)image_pack:(id)sender
{
    
    
    if ([[sender currentTitle]isEqualToString:@"USE THIS IMAGE PACK"])
    {
        if ([_tag_from_store isEqualToString:@"1"])
        {
            [[NSUserDefaults standardUserDefaults] setObject:_arr_result1 forKey:@"arr_one"];
        }
        else if ([_tag_from_store isEqualToString:@"2"])
        {
            [[NSUserDefaults standardUserDefaults] setObject:_arr_result2 forKey:@"arr_two"];
        }
        else if ([_tag_from_store isEqualToString:@"3"])
        {
            [[NSUserDefaults standardUserDefaults] setObject:_arr_result3 forKey:@"arr_three"];
        }
        else if ([_tag_from_store isEqualToString:@"4"])
        {
            [[NSUserDefaults standardUserDefaults] setObject:_arr_result4 forKey:@"arr_four"];
        }
        else if ([_tag_from_store isEqualToString:@"5"])
        {
            [[NSUserDefaults standardUserDefaults] setObject:_arr_result5 forKey:@"arr_five"];
        }
        else if ([_tag_from_store isEqualToString:@"6"])
        {
            [[NSUserDefaults standardUserDefaults] setObject:_arr_result6 forKey:@"arr_six"];
        }
        else if ([_tag_from_store isEqualToString:@"7"])
        {
            [[NSUserDefaults standardUserDefaults] setObject:_arr_result7 forKey:@"arr_seven"];
        }
        
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"update_arrays" object:nil];
        return;
    }

    
    
    
    UIActionSheet* action=[[UIActionSheet alloc]initWithTitle:@"Choose an option" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Buy",@"Restore", nil];
    [action showInView:self.view];
    
}










#pragma mark Actionsheet Delegates :-

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    BOOL checkNet = [[proxyService sharedProxy] checkReachability];
    if(checkNet == TRUE)
    {
        if (buttonIndex==0)
            {
                if ([[proxyService sharedProxy] checkReachability])
                    {
                    if([SKPaymentQueue canMakePayments])
                    {
                        NSLog(@"User can make payments");
                        
                       if ([_tag_from_store isEqualToString:@"2"])
                        {
                           productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:ChildrenImagePack]];
                        }
                       else if ([_tag_from_store isEqualToString:@"3"])
                       {
                           productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:PartyImagePack]];
                       }
                       else if ([_tag_from_store isEqualToString:@"4"])
                       {
                           productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:RomanticImagePack]];
                       }
                       else if ([_tag_from_store isEqualToString:@"5"])
                       {
                           productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:SportyImagePack]];
                       }
                       else if ([_tag_from_store isEqualToString:@"6"])
                       {
                           productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:TravelWayImagePack]];
                       }
                       else if ([_tag_from_store isEqualToString:@"7"])
                       {
                           productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:TravelVocationImagePack]];
                       }

                        
                        
                        productsRequest.delegate = self;
                        [productsRequest start];
                        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        hud.labelText = @"Loading..";
                    }
                    }

                
            }
            else if (buttonIndex==1)
            {
                [self performSelector:@selector(hide_hud) withObject:nil afterDelay:45];
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.labelText = @"Loading..";
               
                [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
                [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
            }
        }
    
    else
    {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Check your network connectivity." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
    }
    
    
}


-(void)hide_hud
{
 [MBProgressHUD hideHUDForView:self.view animated:NO];
}


#pragma mark InApp
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    SKProduct *validProduct = nil;
    NSUInteger count = [response.products count];
    if(count > 0){
        validProduct = [response.products objectAtIndex:0];
        NSLog(@"Products Available!");
        [self purchase:validProduct];
    }
    else if(!validProduct){
        NSLog(@"No products available");
        [MBProgressHUD hideHUDForView:self.view animated:NO];
    }
}

- (void) completeTransaction: (SKPaymentTransaction *)transaction
{
    NSLog(@"Transaction Completed");
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

- (void)purchase:(SKProduct *)product
{
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}





- (void) paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
    NSLog(@"received restored transactions: %lu", (unsigned long)queue.transactions.count);
    for (SKPaymentTransaction *transaction in queue.transactions)
    {
        if(SKPaymentTransactionStateRestored){
            NSLog(@"Transaction state -> Restored");
            //called when the user successfully restores a purchase
            
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
            [self completeTransaction:transaction];
            
            break;
        }
    }
}








- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions{
    for(SKPaymentTransaction *transaction in transactions){
        switch (transaction.transactionState){
            case SKPaymentTransactionStatePurchasing: NSLog(@"Transaction state -> Purchasing");
                //called when the user is in the process of purchasing, do not add any of your own code here.
                break;
            case SKPaymentTransactionStatePurchased:
                //this is called when the user has successfully purchased the package (Cha-Ching!)
                [self do_the_rest]; //you can add your code for what you want to happen when the user buys the purchase here, for this tutorial we use removing ads
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                
                [self completeTransaction:transaction];
                NSLog(@"Transaction state -> Purchased");
                [MBProgressHUD hideHUDForView:self.view animated:NO];
                break;
            case SKPaymentTransactionStateRestored:
                
                
                NSLog(@"Transaction state -> Restored");
                for (SKPaymentTransaction * transaction in transactions)
                {
                    NSLog(@"Purchased indentifier : %@", transaction.payment.productIdentifier);
                    
                    NSString *restore_id = [NSString stringWithFormat:@"%@",transaction.payment.productIdentifier];
                    
                    
                    if ([restore_id isEqualToString:ChildrenImagePack] && [_tag_from_store isEqualToString:@"2"])
                    {
                        [image_pack_obj setTitle:@"USE THIS IMAGE PACK" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults] setObject:_tag_from_store forKey:_tag_from_store];
                        [[NSUserDefaults standardUserDefaults] synchronize];

                    }
                    else if ([restore_id isEqualToString:PartyImagePack] && [_tag_from_store isEqualToString:@"3"])
                    {
                        [image_pack_obj setTitle:@"USE THIS IMAGE PACK" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults] setObject:_tag_from_store forKey:_tag_from_store];
                        [[NSUserDefaults standardUserDefaults] synchronize];

                        
                    }
                    else if ([restore_id isEqualToString:RomanticImagePack] && [_tag_from_store isEqualToString:@"4"])
                    {
                        [image_pack_obj setTitle:@"USE THIS IMAGE PACK" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults] setObject:_tag_from_store forKey:_tag_from_store];
                        [[NSUserDefaults standardUserDefaults] synchronize];

                    }
                    else if ([restore_id isEqualToString:SportyImagePack] && [_tag_from_store isEqualToString:@"5"])
                    {
                        
                        [image_pack_obj setTitle:@"USE THIS IMAGE PACK" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults] setObject:_tag_from_store forKey:_tag_from_store];
                        [[NSUserDefaults standardUserDefaults] synchronize];

                    }
                    else if ([restore_id isEqualToString:TravelWayImagePack] && [_tag_from_store isEqualToString:@"6"])
                    {
                        [image_pack_obj setTitle:@"USE THIS IMAGE PACK" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults] setObject:_tag_from_store forKey:_tag_from_store];
                        [[NSUserDefaults standardUserDefaults] synchronize];

                        
                    }
                     else if ([restore_id isEqualToString:TravelVocationImagePack] && [_tag_from_store isEqualToString:@"7"])
                    {
                       
                        [image_pack_obj setTitle:@"USE THIS IMAGE PACK" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults] setObject:_tag_from_store forKey:_tag_from_store];
                        [[NSUserDefaults standardUserDefaults] synchronize];

                    }
                }

                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                [self completeTransaction:transaction];
                [MBProgressHUD hideHUDForView:self.view animated:NO];
                break;
                
                
            case SKPaymentTransactionStateFailed:
                //called when the transaction does not finnish
                [MBProgressHUD hideHUDForView:self.view animated:NO];
                if(transaction.error.code != SKErrorPaymentCancelled){
                    
                   
                    NSLog(@"Transaction state -> Cancelled");
                    //the user cancelled the payment ;(
                    [MBProgressHUD hideHUDForView:self.view animated:NO];
                }
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                [self completeTransaction:transaction];
                break;
        }
    }
}

-(void)do_the_rest
{
    [image_pack_obj setTitle:@"USE THIS IMAGE PACK" forState:UIControlStateNormal];
    [[NSUserDefaults standardUserDefaults] setObject:_tag_from_store forKey:_tag_from_store];
    [[NSUserDefaults standardUserDefaults] synchronize];
}




@end
