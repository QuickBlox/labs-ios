//
//  QMOutgoingMessageView.h
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>

@class MessagesContext;

@interface QMOutgoingMessageView : CKCompositeComponent

+ (instancetype)newWithText:(NSString *)text context:(MessagesContext *)context;

@end
