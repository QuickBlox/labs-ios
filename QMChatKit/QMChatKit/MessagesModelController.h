//
//  MessagesModelController.h
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MessagesPage;

@interface MessagesModelController : NSObject

- (MessagesPage *)fetchNewMessagesPageWithCount:(NSUInteger)count;

@end
