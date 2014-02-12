#import <UIKit/UIKit.h>

@interface CKMessagesController : UIViewController
-(void)showConversationList:(BOOL)list;
@end

@interface SMSApplication : UIApplication <UIApplicationDelegate>
@property (nonatomic,retain) UIWindow* window;
@property (nonatomic,retain) CKMessagesController* messagesController;
-(void)systemApplicationDidSuspend;
-(void)systemApplicationDidResume;
@end


%hook SMSApplication        

-(void)systemApplicationDidSuspend{    
    NSLog(@"[MessagePopper] Returning to Conversation list on application resignation...");
    [self.messagesController showConversationList:YES];
    %orig();
}

%end