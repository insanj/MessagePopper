#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface CKMessagesController : UIViewController

- (void)showConversationList:(BOOL)animated;
- (void)prepareForSuspend;
- (void)prepareForResume;

@end

@interface SMSApplication : UIApplication <UIApplicationDelegate>

@property (nonatomic,retain) CKMessagesController *messagesController;

- (void)_prepareForSuspend;

@end