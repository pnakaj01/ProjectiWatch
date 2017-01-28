//
//  Support_view_controller.m
//  iwatch30may
//
//  Created by Jaspreet on 17/06/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import "Support_view_controller.h"

@interface Support_view_controller ()

@end

@implementation Support_view_controller

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.kbfredag.se/apps"]]];
    [self.view addSubview:webView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)back_btn:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
