//
//  QBChatMessage.m
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "QBChatMessage.h"

@implementation QBChatMessage

- (instancetype)initWithSenderNick:(NSString *)sencerNick text:(NSString *)text {
    
    self = [super init];
    if (self) {
    
        _text = text;
        _senderNick = sencerNick;        
    }
    
    return self;
}

@end
