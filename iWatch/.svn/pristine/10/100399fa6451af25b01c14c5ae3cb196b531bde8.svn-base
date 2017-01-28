//
//  StoreViewController.m
//  New_Iwatch_app
//
//  Created by Sahil1 on 02/04/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "StoreViewController.h"
#import "ImagePackViewController.h"
#define removeads @"com.iwatch.removeads"

#import "proxyService.h"
#import "Reachability.h"

@interface StoreViewController ()

@end

@implementation StoreViewController
@synthesize productsRequest,skPaymentQueue;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.view.frame.size.width>500)
    {
        scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,self.view.frame.size.height+2960);
    }
    else if (self.view.frame.size.width==320)
    {
     scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,self.view.frame.size.height+1450);
    }
    else if (self.view.frame.size.width==414)
    {
        scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,self.view.frame.size.height+1850);
    }
    else
    {
        scrollVw.contentSize=CGSizeMake(self.view.frame.size.width,self.view.frame.size.height+1660);
    }
    
    scrollVw.userInteractionEnabled=YES;
    self.navigationController.navigationBarHidden=YES;
    top_img_vw.backgroundColor=[UIColor colorWithRed:0/255.0 green:168/255.0 blue:198/255.0 alpha:1];
    
    
    
    
    if (self.view.frame.size.width>600)
    {
        store_images1=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img1-1_extraipad.png", @"img1-2_extraipad.png",@"img1-3_full_ipad.png",@"img1-4_extraipad.png",@"img1-5_extraipad.png", nil];
        store_images2=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img2-1_extraipad.png",@"img2-2_extraipad.png", @"img2-3_full_ipad.png",@"img2-4_extraipad.png",@"img2-5_extraipad.png", nil];
        store_images3=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img3-1_extraipad.png",@"img3-2_extraipad.png", @"img3-3_full_ipad.png",@"img3-4_extraipad.png",@"img3-5_extraipad.png", nil];
        store_images4=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img4-1_extraipad.png",@"img4-2_extraipad.png", @"img4-3_full_ipad.png",@"img4-4_extraipad.png",@"img4-5_extraipad.png", nil];
        store_images5=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img5-1_extraipad.png",@"img5-2_extraipad.png", @"img5-3_full_ipad.png",@"img5-4_extraipad.png",@"img5-5_extraipad.png", nil];
        store_images6=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img6-1_extraipad.png",@"img6-2_extraipad.png", @"img6-3_full_ipad.png",@"img6-4_extraipad.png",@"img6-5_extraipad.png", nil];
        store_images7=[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img7-1_extraipad.png",@"img7-2_extraipad.png", @"img7-3_full_ipad.png",@"img7-4_extraipad.png",@"img7-5_extraipad.png", nil];
    }
    else
    {
        store_images1 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img1-1_extra.png",@"img1-2_extra.png", @"img1-3_full.png", @"img1-4_extra.png",@"img1-5_extra.png",nil];
        store_images2 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img2-1_extra.png",@"img2-2_extra.png", @"img2-3_full.png", @"img2-4_extra.png",@"img2-5_extra.png",nil];
        store_images3 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img3-1_extra.png",@"img3-2_extra.png", @"img3-3_full.png", @"img3-4_extra.png",@"img3-5_extra.png",nil];
        store_images4 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img4-1_extra.png",@"img4-2_extra.png", @"img4-3_full.png", @"img4-4_extra.png",@"img4-5_extra.png",nil];
        store_images5 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img5-1_extra.png",@"img5-2_extra.png", @"img5-3_full.png", @"img5-4_extra.png",@"img5-5_extra.png",nil];
        store_images6 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img6-1_extra.png",@"img6-2_extra.png", @"img6-3_full.png", @"img6-4_extra.png",@"img6-5_extra.png",nil];
        store_images7 =[[NSArray alloc]initWithObjects:@"camera-icon.png",@"img7-1_extra.png",@"img7-2_extra.png", @"img7-3_full.png", @"img7-4_extra.png",@"img7-5_extra.png",nil];
    }

}

-(IBAction)img_btn_pressed:(id)sender
{

    ImagePackViewController *img=[self.storyboard instantiateViewControllerWithIdentifier:@"imagepack"];
    if ([sender tag]==1)
    {
        img.bundle_str=@"Adventure Pack Bundle!";
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"1"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        img.from_store_images=store_images1;
        img.arr_result1=[[NSMutableArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5", nil];
        [self.navigationController pushViewController:img animated:YES];
    }
    else if ([sender tag]==2)
    {
        img.from_store_images=store_images2;
        img.bundle_str=@"Children Pack Bundle!";
        img.arr_result2=[[NSMutableArray alloc] initWithObjects:@"6",@"7",@"8",@"9",@"10", nil];
        
        [self.navigationController pushViewController:img animated:YES];
    }
    else if ([sender tag]==3)
    {
        img.from_store_images=store_images3;
        img.bundle_str=@"Party Pack Bundle!";
        img.arr_result3=[[NSMutableArray alloc] initWithObjects:@"11",@"12",@"13",@"14",@"15", nil];;
        [self.navigationController pushViewController:img animated:YES];
    }
    else if ([sender tag]==4)
    {
        img.from_store_images=store_images4;
        img.bundle_str=@"Romantic Pack Bundle!";
        img.arr_result4=[[NSMutableArray alloc] initWithObjects:@"16",@"17",@"18",@"19",@"20", nil];
        [self.navigationController pushViewController:img animated:YES];
    }
    else if ([sender tag]==5)
    {
        img.from_store_images=store_images5;
        img.bundle_str=@"Sports Pack Bundle!";
        img.arr_result5=[[NSMutableArray alloc] initWithObjects:@"21",@"22",@"23",@"24",@"25", nil];
        [self.navigationController pushViewController:img animated:YES];
    }
    else if ([sender tag]==6)
    {
        img.from_store_images=store_images6;
        img.bundle_str=@"Travel Pack Bundle!";
        img.arr_result6=[[NSMutableArray alloc] initWithObjects:@"26",@"27",@"28",@"29",@"30", nil];
        [self.navigationController pushViewController:img animated:YES];
    }
    else if ([sender tag]==7)
    {
        img.from_store_images=store_images7;
        img.bundle_str=@"Vocation Pack Bundle!";
        img.arr_result7=[[NSMutableArray alloc] initWithObjects:@"31",@"32",@"33",@"34",@"35", nil];
        [self.navigationController pushViewController:img animated:YES];
    }
   
  
    img.tag_from_store=[NSString stringWithFormat:@"%ld",(long)[sender tag]];
}

-(IBAction)back_btn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)remove_ads:(id)sender
{
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"ads"]isEqualToString:@"remove"])
    {
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Ads has already been removed." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    if ([[proxyService sharedProxy] checkReachability])
    {
    if([SKPaymentQueue canMakePayments])
    {
        NSLog(@"User can make payments");
        productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:removeads]];
        productsRequest.delegate = self;
        [productsRequest start];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"Loading..";
    }
}


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
        //this is called if your product id is not valid, this shouldn't be called unless that happens.
        [MBProgressHUD hideHUDForView:self.view animated:NO];
    }
}

- (void) completeTransaction: (SKPaymentTransaction *)transaction
{
    NSLog(@"Transaction Completed");
    // You can create a method to record the transaction.
    // [self recordTransaction: transaction];
    
    // You should make the update to your app based on what was purchased and inform user.
    // [self provideContent: transaction.payment.productIdentifier];
    
    
    // Finally, remove the transaction from the payment queue.
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

- (IBAction)purchase:(SKProduct *)product
{
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (IBAction) restore
{
    //this is called when the user restores purchases, you should hook this up to a button
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
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
                [self doRemoveAds]; //you can add your code for what you want to happen when the user buys the purchase here, for this tutorial we use removing ads
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                
                [self completeTransaction:transaction];
                NSLog(@"Transaction state -> Purchased");
                [MBProgressHUD hideHUDForView:self.view animated:NO];
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"Transaction state -> Restored");
                //add the same code as you did from SKPaymentTransactionStatePurchased here
                [self doRemoveAds];
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                [self completeTransaction:transaction];
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

- (void)doRemoveAds
{
    
    [[NSUserDefaults standardUserDefaults]setValue:@"remove" forKey:@"ads"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}


@end
