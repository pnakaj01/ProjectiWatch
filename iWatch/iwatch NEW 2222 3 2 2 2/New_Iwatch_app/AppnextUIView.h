
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AdSupport/ASIdentifierManager.h>

@protocol AppnextDelegate <NSObject>
@optional
- (void)noAds;
- (void)AdLoaded;
- (void)PopupOpened;
- (void)PopupClosed;
- (void)PopupClicked;

@end


id apnxtDelegate;

@interface AppNextUIView : UIView

- (void)hidePopup;
- (void)showPopup;
- (void)refreshAds;
- (void)setID:(NSString *)appid;
- (BOOL)isReady;

- (void)setAppnextDelegate:(id)delegate;
@end
