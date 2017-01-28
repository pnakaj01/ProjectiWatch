//
//  Event.h
//  New_Iwatch_app
//
//  Created by Sahil1 on 20/03/15.
//  Copyright (c) 2015 Trigma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * image2;
@property (nonatomic, retain) NSNumber*  date;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * createdOn;
@property (nonatomic, retain) NSDate * modifiedOn;
@property (nonatomic, retain) NSDate * eventDate;
@property (nonatomic, retain) NSString * alpha;
@property (nonatomic, retain) NSDate * notificationDate;
@property (nonatomic, retain) NSString * notOnOff;
@property (nonatomic, retain) NSString * ringtoneName;
@property (nonatomic,strong) NSString *inAppBaloonStatus;
@property (nonatomic,strong) NSString *inAppBagStatus;
@property (nonatomic,strong) NSString *inAppSunStatus;
@property (nonatomic,strong) NSString *inAppHandStatus;

@property (nonatomic,strong) NSString *x;
@property (nonatomic,strong) NSString *y;

@property (nonatomic,strong) NSString *device_id;

@property (nonatomic, retain) NSString * eventbarsmallimage;
@property (nonatomic, retain) NSString * eventbarlargeimage;

@end
