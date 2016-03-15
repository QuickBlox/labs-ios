//
//  MessageViewComponent.h
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>

@class QBChatMessage;
@class MessagesContext;

@interface MessageViewComponent : CKCompositeComponent

+ (instancetype)newWithMessage:(QBChatMessage *)message context:(MessagesContext *)context;

@end
