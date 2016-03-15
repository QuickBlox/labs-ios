//
//  MessagesPage.h
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessagesPage : NSObject

@property (strong, nonatomic, readonly) NSArray *messages;
@property (assign, nonatomic, readonly) NSInteger position;

- (instancetype)initWithMessages:(NSArray *)messages position:(NSInteger)position;

@end
