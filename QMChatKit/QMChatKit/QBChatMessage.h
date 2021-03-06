//
//  QBChatMessage.h
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QBChatMessage : NSObject

/**
 Message text
 */
@property (nonatomic, copy) NSString *text;

/**
 Message sender nick, use only for group Chat
 */
@property (nonatomic, copy) NSString *senderNick;

/**
 *  Unavailable for this class
 */
- (instancetype)init NS_UNAVAILABLE;

/**
 *  Unavailable for this class
 */
- (instancetype)new NS_UNAVAILABLE;

/**
 *  Designated initializer
 *
 *  @param sencerNick Sender nick
 *  @param text       Message text
 *
 *  @return QBChatMessage instance
 */
- (instancetype)initWithSenderNick:(NSString *)sencerNick text:(NSString *)text NS_DESIGNATED_INITIALIZER;

@end
