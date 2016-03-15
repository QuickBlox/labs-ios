//
//  MessagesPage.m
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "MessagesPage.h"

@implementation MessagesPage

- (instancetype)initWithMessages:(NSArray *)messages position:(NSInteger)position {
    
    self = [super init];
    if (self) {
        
        _messages = messages;
        _position = position;
    }
    
    return self;
}

@end
