//
//  InterfaceController.h
//  Great Days WatchKit Extension
//
//  Created by Jaspreet on 23/06/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (weak, nonatomic) NSArray *arr;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *image_view;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *button;

@end
