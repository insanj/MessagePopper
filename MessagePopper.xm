#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface CKMessagesController : UIViewController
-(void)showConversationList:(BOOL)animated;
@end

@interface SMSApplication : UIApplication <UIApplicationDelegate>
@property (nonatomic,retain) CKMessagesController* messagesController;
-(void)_prepareForSuspend;
@end


%hook SMSApplication        

-(void)_prepareForSuspend{    
    NSLog(@"[MessagePopper] Returning to Conversation list on application suspension...");
    [self.messagesController showConversationList:NO];
	%orig();
}

%end