//
//  EventBarViewController.m
//  New_Iwatch_app
//
//  Created by Sahil1 on 01/04/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "EventBarViewController.h"
#import <StoreKit/StoreKit.h>
#import "Utility.h"
#define allimages @"com.kbfredag.greatdays.eventbarpack"
#define eventbarsingle @"com.kbfredag.greatdays.eventbarsingle"
#define removeads @"com.iwatch.removeads"


#define eventbarBag @"com.kbfredag.greatdays.EventBag"
#define eventbarSun @"com.kbfredag.greatdays.EventSun"
#define eventbarBalloon @"com.kbfredag.greatdays.EventBalloon"
#define eventbarHand @"com.kbfredag.greatdays.EventHand"




#import "Reachability.h"
#import "proxyService.h"

@interface EventBarViewController ()
{
    NSMutableArray *item_array;
    BOOL images;
    NSString *in_app;
}
@end

@implementation EventBarViewController
@synthesize productsRequest,skPaymentQueue;
- (void)viewDidLoad
{
    
    self.navigationController.navigationBarHidden=YES;
    top_img_vw.backgroundColor=[UIColor colorWithRed:0/255.0 green:168/255.0 blue:198/255.0 alpha:1];
    if (self.view.frame.size.width>500)
    {
        scrollVW.contentSize=CGSizeMake(self.view.frame.size.width,2500);
    }
    else if(self.view.frame.size.width==414)
    {
        scrollVW.contentSize=CGSizeMake(self.view.frame.size.width,1900);
    }
    else if(self.view.frame.size.width==375)
    {
        scrollVW.contentSize=CGSizeMake(self.view.frame.size.width,1700);
    }
    else
    {
        
        scrollVW.contentSize=CGSizeMake(self.view.frame.size.width,1500);
        
    }
    scrollVW.userInteractionEnabled=YES;
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




-(void)viewWillAppear:(BOOL)animated
{
    
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    NSArray*result= [Utility fetchRequest:nil];
    
    result_value=[result lastObject];
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"baloonPurchased"]isEqualToString:@"baloon_purchased"])
    {
        [ballon_obj setTitle:@"USE" forState:UIControlStateNormal];
    }
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"sunPurchased"]isEqualToString:@"sun_purchased"])
    {
        [sun_obj setTitle:@"USE" forState:UIControlStateNormal];
    }
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"handPurchased"]isEqualToString:@"hand_purchased"])
    {
        [hand_obj setTitle:@"USE" forState:UIControlStateNormal];
    }
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"bagPurchased"]isEqualToString:@"bag_purchased"])
    {
        [bag_obj setTitle:@"USE" forState:UIControlStateNormal];
    }
}


- (void)doRemoveAds
{
    if (images==YES)
    {
        if ([item_array containsObject:@"baloon"])
        {
            [ballon_obj setTitle:@"USE" forState:UIControlStateNormal];
            [[NSUserDefaults standardUserDefaults]setValue:@"baloon_purchased" forKey:@"baloonPurchased"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
        }
        if ([item_array containsObject:@"bag"])
        {
            [bag_obj setTitle:@"USE" forState:UIControlStateNormal];
            [[NSUserDefaults standardUserDefaults]setValue:@"bag_purchased" forKey:@"bagPurchased"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }
        if ([item_array containsObject:@"sun"])
        {
            [sun_obj setTitle:@"USE" forState:UIControlStateNormal];
            [[NSUserDefaults standardUserDefaults]setValue:@"sun_purchased" forKey:@"sunPurchased"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }
        if ([item_array containsObject:@"hand"])
        {
            [hand_obj setTitle:@"USE" forState:UIControlStateNormal];
            [[NSUserDefaults standardUserDefaults]setValue:@"hand_purchased" forKey:@"handPurchased"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }
    }
    else
    {
        [[NSUserDefaults standardUserDefaults]setValue:@"remove" forKey:@"ads"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    [MBProgressHUD hideHUDForView:self.view animated:NO];
}


#pragma mark buttons

-(IBAction)pantagon:(id)sender
{
    images=YES;
    item_array=[[NSMutableArray alloc] init];
    if (self.view.frame.size.width>500)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"new_full-pantagun-ipad.png" forKey:@"pantagun"];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"new_pantagun.png" forKey:@"pantagun"];
    }
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSUserDefaults standardUserDefaults]setObject:[[NSUserDefaults standardUserDefaults] valueForKey:@"pantagun"] forKey:@"event_bar_image"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}




-(IBAction)ballon_buy:(id)sender
{
    images=YES;
    item_array=[[NSMutableArray alloc] init];
    if (self.view.frame.size.width>500)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"new_full-baloon-ipad.png" forKey:@"baloon"];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"new_baloon.png" forKey:@"baloon"];
    }
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    if ([[sender currentTitle]isEqualToString:@"USE"])
    {
        [[NSUserDefaults standardUserDefaults]setObject:[[NSUserDefaults standardUserDefaults] valueForKey:@"baloon"] forKey:@"event_bar_image"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        return;
    }
    
    
    
    UIActionSheet* action=[[UIActionSheet alloc]initWithTitle:@"Choose an option" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Buy",@"Restore", nil];
    [action showInView:self.view];
    
    in_app=@"balloon";
    purchase_item=@"baloon";
    
    
}



-(IBAction)bag_buy:(id)sender
{
    images=YES;
    item_array=[[NSMutableArray alloc] init];
    
    if (self.view.frame.size.width>500)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"new_full-bag-ipad.png" forKey:@"bag"];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"new_bag.png" forKey:@"bag"];
    }
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    if ([[sender currentTitle]isEqualToString:@"USE"])
    {
        [[NSUserDefaults standardUserDefaults]setObject:[[NSUserDefaults standardUserDefaults] valueForKey:@"bag"] forKey:@"event_bar_image"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        return;
    }
    
    
    UIActionSheet* action=[[UIActionSheet alloc]initWithTitle:@"Choose an option" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Buy",@"Restore", nil];
    [action showInView:self.view];
    
     in_app=@"bag";
    purchase_item=@"bag";
}

-(IBAction)sun_buy:(id)sender
{
    images=YES;
    item_array=[[NSMutableArray alloc] init];
    
    
    if (self.view.frame.size.width>500)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"new_full-sun-ipad.png" forKey:@"sun"];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"new_sun.png" forKey:@"sun"];
    }
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    if ([[sender currentTitle]isEqualToString:@"USE"])
    {
        [[NSUserDefaults standardUserDefaults]setObject:[[NSUserDefaults standardUserDefaults] valueForKey:@"sun"] forKey:@"event_bar_image"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        return;
    }
    
    UIActionSheet* action=[[UIActionSheet alloc]initWithTitle:@"Choose an option" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Buy",@"Restore", nil];
    [action showInView:self.view];
    
     in_app=@"sun";
    purchase_item=@"sun";
    
}
-(IBAction)hand_buy:(id)sender
{
    images=YES;
    item_array=[[NSMutableArray alloc] init];
    
    if (self.view.frame.size.width>500)
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"new_full-hand-ipad.png" forKey:@"hand"];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults]setObject:@"new_hand.png" forKey:@"hand"];
    }
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    if ([[sender currentTitle]isEqualToString:@"USE"])
    {
        [[NSUserDefaults standardUserDefaults]setObject:[[NSUserDefaults standardUserDefaults] valueForKey:@"hand"] forKey:@"event_bar_image"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        return;
    }
    
     UIActionSheet* action=[[UIActionSheet alloc]initWithTitle:@"Choose an option" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Buy",@"Restore", nil];
    [action showInView:self.view];
    
     in_app=@"hand";
    purchase_item=@"hand";
    
    
    
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

#pragma mark all images

- (IBAction)all_images:(id)sender
{
    images=YES;
    item_array=[[NSMutableArray alloc] init];
    if ([[ballon_obj currentTitle]isEqualToString:@"USE"]&&[[bag_obj currentTitle]isEqualToString:@"USE"]&&[[sun_obj currentTitle]isEqualToString:@"USE"]&&[[hand_obj currentTitle]isEqualToString:@"USE"])
    {
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"All the images has been purchased already." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    in_app=@"all_images";
    
    UIActionSheet* action=[[UIActionSheet alloc]initWithTitle:@"Choose an option" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Buy",@"Restore", nil];
    [action showInView:self.view];
}

#pragma mark remove_ads_inapp

- (IBAction)remove_ads_inapp:(id)sender
{
    images=NO;
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"ads"]isEqualToString:@"remove"])
    {
        UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Ads has already been removed." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    in_app=@"remove_ads";
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
                    
                    if ([in_app isEqualToString:@"remove_ads"])
                    {
                    NSLog(@"User can make payments");
                    productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:removeads]];
                    }
                    else if([in_app isEqualToString:@"all_images"])
                    {
                        if (self.view.frame.size.width>500)
                        {
                            [[NSUserDefaults standardUserDefaults]setObject:@"new_full-baloon-ipad.png" forKey:@"baloon"];
                            [[NSUserDefaults standardUserDefaults]setObject:@"new_full-bag-ipad.png" forKey:@"bag"];
                            [[NSUserDefaults standardUserDefaults]setObject:@"new_full-sun-ipad.png" forKey:@"sun"];
                            [[NSUserDefaults standardUserDefaults]setObject:@"new_full-hand-ipad.png" forKey:@"hand"];
                        }
                        else
                        {
                            [[NSUserDefaults standardUserDefaults]setObject:@"new_bag.png" forKey:@"bag"];
                            [[NSUserDefaults standardUserDefaults]setObject:@"new_sun.png" forKey:@"sun"];
                            [[NSUserDefaults standardUserDefaults]setObject:@"new_hand.png" forKey:@"hand"];
                            [[NSUserDefaults standardUserDefaults]setObject:@"new_baloon.png" forKey:@"baloon"];
                        }
                        [[NSUserDefaults standardUserDefaults]synchronize];
                        NSLog(@"User can make payments");
                        [item_array addObject:@"baloon"];
                        [item_array addObject:@"bag"];
                        [item_array addObject:@"sun"];
                        [item_array addObject:@"hand"];
                        productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:allimages]];
                    }
                    
                    
                    else if([in_app isEqualToString:@"balloon"])
                    {
                        NSLog(@"User can make payments");
                        
                        [item_array addObject:purchase_item];
                        productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:eventbarBalloon]];
                        
                    }
                    else if([in_app isEqualToString:@"bag"])
                    {
                        NSLog(@"User can make payments");
                        
                        [item_array addObject:purchase_item];
                        productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:eventbarBag]];
                        
                    }
                    
                    else if([in_app isEqualToString:@"sun"])
                    {
                        NSLog(@"User can make payments");
                        
                        [item_array addObject:purchase_item];
                        productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:eventbarSun]];
                        
                    }
                    
                    else if([in_app isEqualToString:@"hand"])
                    {
                        NSLog(@"User can make payments");
                        
                        [item_array addObject:purchase_item];
                        productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:eventbarHand]];
                        
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
            
            
            
            
            if ([in_app isEqualToString:@"all_images"])
            {
                if (self.view.frame.size.width>500)
                {
                    [[NSUserDefaults standardUserDefaults]setObject:@"new_full-baloon-ipad.png" forKey:@"baloon"];
                    [[NSUserDefaults standardUserDefaults]setObject:@"new_full-bag-ipad.png" forKey:@"bag"];
                    [[NSUserDefaults standardUserDefaults]setObject:@"new_full-sun-ipad.png" forKey:@"sun"];
                    [[NSUserDefaults standardUserDefaults]setObject:@"new_full-hand-ipad.png" forKey:@"hand"];
                }
                else
                {
                    [[NSUserDefaults standardUserDefaults]setObject:@"new_bag.png" forKey:@"bag"];
                    [[NSUserDefaults standardUserDefaults]setObject:@"new_sun.png" forKey:@"sun"];
                    [[NSUserDefaults standardUserDefaults]setObject:@"new_hand.png" forKey:@"hand"];
                    [[NSUserDefaults standardUserDefaults]setObject:@"new_baloon.png" forKey:@"baloon"];
                }
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                NSLog(@"User can make payments");
                [item_array addObject:@"baloon"];
                [item_array addObject:@"bag"];
                [item_array addObject:@"sun"];
                [item_array addObject:@"hand"];
            }
        else  if([purchase_item isEqualToString:@"hand"] || [purchase_item isEqualToString:@"sun"] || [purchase_item isEqualToString:@"baloon"] || [purchase_item isEqualToString:@"bag"])
            {
                NSLog(@"User can make payments");
                [item_array addObject:purchase_item];

            }
            
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
        //this is called if your product id is not valid, this shouldn't be called unless that happens.
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
                

                [self doRemoveAds];
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                 [self completeTransaction:transaction];
                NSLog(@"Transaction state -> Purchased");
                [MBProgressHUD hideHUDForView:self.view animated:NO];
                break;
                
            case SKPaymentTransactionStateRestored:
                
                
                
                
                
                
                
                for (SKPaymentTransaction * transaction in transactions)
                {
                    NSLog(@"Purchased indentifier : %@", transaction.payment.productIdentifier);
                    
                    NSString *restore_id = [NSString stringWithFormat:@"%@",transaction.payment.productIdentifier];
                    
                    
                    if ([restore_id isEqualToString:@"com.kbfredag.greatdays.EventBalloon"])
                    {
                        [ballon_obj setTitle:@"USE" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults]setValue:@"baloon_purchased" forKey:@"baloonPurchased"];
                        [[NSUserDefaults standardUserDefaults]synchronize];
                       
                    }
                    else if ([restore_id isEqualToString:@"com.kbfredag.greatdays.EventBag"])
                    {
                        [bag_obj setTitle:@"USE" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults]setValue:@"bag_purchased" forKey:@"bagPurchased"];
                        [[NSUserDefaults standardUserDefaults]synchronize];

                        
                    }
                    else if ([restore_id isEqualToString:@"com.kbfredag.greatdays.EventSun"])
                    {
                        [sun_obj setTitle:@"USE" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults]setValue:@"sun_purchased" forKey:@"sunPurchased"];
                        [[NSUserDefaults standardUserDefaults]synchronize];
                    }
                    else if ([restore_id isEqualToString:@"com.kbfredag.greatdays.EventHand"])
                    {
                        [hand_obj setTitle:@"USE" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults]setValue:@"hand_purchased" forKey:@"handPurchased"];
                        [[NSUserDefaults standardUserDefaults]synchronize];

                    }
                    
                    
                    else if ([restore_id isEqualToString:@"com.iwatch.removeads"])
                    {
                        [[NSUserDefaults standardUserDefaults]setValue:@"remove" forKey:@"ads"];
                        [[NSUserDefaults standardUserDefaults]synchronize];
                        
                    }
                    
                    
                    else if ([restore_id isEqualToString:@"com.kbfredag.greatdays.eventbarpack"])
                    {
                        [ballon_obj setTitle:@"USE" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults]setValue:@"baloon_purchased" forKey:@"baloonPurchased"];
                        
                        [bag_obj setTitle:@"USE" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults]setValue:@"bag_purchased" forKey:@"bagPurchased"];

                        [sun_obj setTitle:@"USE" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults]setValue:@"sun_purchased" forKey:@"sunPurchased"];
                        
                        [hand_obj setTitle:@"USE" forState:UIControlStateNormal];
                        [[NSUserDefaults standardUserDefaults]setValue:@"hand_purchased" forKey:@"handPurchased"];
                        [[NSUserDefaults standardUserDefaults]synchronize];

                    }
                }

              
                NSLog(@"Transaction state -> Restored");
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

@end
