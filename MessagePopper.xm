#import "MessagePopper.h"

%hook CKMessagesController

- (void)prepareForSuspend {
    NSLog(@"[MessagePopper] Returning to Conversation list on application suspension...");
	[self showConversationList:NO];
	%orig();
}

%end
