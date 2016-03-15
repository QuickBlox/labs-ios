//
//  MessageViewComponent.m
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "MessageViewComponent.h"
#import "QBChatMessage.h"

@implementation MessageViewComponent

+ (instancetype)newWithMessage:(QBChatMessage *)message context:(MessagesContext *)context {
    
    CKComponentScope scope(self);
    const BOOL revealAnswer = [scope.state() boolValue];
    
    return nil;
    
}

@end
