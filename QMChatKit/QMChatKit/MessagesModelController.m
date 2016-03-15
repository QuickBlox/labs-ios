//
//  MessagesModelController.m
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "MessagesModelController.h"
#import "MessagesPage.h"
#import "QBChatMessage.h"

@implementation MessagesModelController {
    
    NSInteger _numberOfObjects;
}

- (MessagesPage *)fetchNewMessagesPageWithCount:(NSUInteger)count {
    
    NSArray * messages = generateRandomMessages(count);
    MessagesPage *messagesPage = [[MessagesPage alloc] initWithMessages:messages position:count];
    _numberOfObjects += count;
    
    return messagesPage;
}

#pragma mark - Random Quote Generation

static NSArray *generateRandomMessages(NSInteger count) {
    
    NSMutableArray *_messages = [NSMutableArray array];

    for (NSUInteger i = 0; i< count; i++) {
        
        NSDictionary *randomMessages = generateRandomMessageInfo();

        NSString *senderNick = randomMessages[@"author"];
        NSString *text = randomMessages[@"text"];
        
        QBChatMessage *message = [[QBChatMessage alloc] initWithSenderNick:senderNick text:text];
        [_messages addObject:message];
    }
    return _messages;
}


static NSDictionary *generateRandomMessageInfo() {
    
    NSArray *messages = messagesList();
    return messages[arc4random_uniform((uint32_t)[messages count])];
}


static NSArray *messagesList() {
    
    static NSArray *messages;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        messages = @[
                   @{
                       @"text": @"I have the simplest tastes. I am always satisfied with the best.",
                       @"senderNick": @"Anton Socolchenko",
                       },
                   @{
                       @"text": @"A thing is not necessarily true because a man dies for it.",
                       @"senderNick": @"Igor Khomenko",
                       },
                   @{
                       @"text": @"A poet can survive everything but a misprint.",
                       @"senderNick": @"Vitali Gorbachev",
                       },
                   @{
                       @"text": @"He is really not so ugly after all, provided, of course, that one shuts one's eyes, and does not look at him.",
                       @"senderNick": @"Katerina Pidubna",
                       },
                   @{
                       @"text": @"People who count their chickens before they are hatched act very wisely because chickens run about so absurdly that it's impossible to count them accurately.",
                       @"senderNick": @"Taras Filatov",
                       },
                   @{
                       @"text": @"It is better to have a permanent income than to be fascinating.",
                       @"senderNick": @"Vitali Guru",
                       },
                   @{
                       @"text": @"Education is an admirable thing. But it is well to remember from time to time that nothing that is worth knowing can be taught.",
                       @"senderNick": @"Kate Suchkova",
                       },
                   @{
                       @"text": @"Art is the only serious thing in the world. And the artist is the only person who is never serious.",
                       @"senderNick": @"Quickblox user",
                       },
                   @{
                       @"text": @"A man who does not think for himself does not think at all.",
                       @"senderNick": @"Andrey Ivanov",
                       },
                   @{
                       @"text": @"Prayer must never be answered: if it is, it ceases to be prayer and becomes correspondence.",
                       @"senderNick": @"Bender Ben",
                       },
                   @{
                       @"text":@"The philosophers have only interpreted the world, in various ways. The point, however, is to change it.",
                       @"senderNick": @"Anonymous",
                       },
                   @{
                       @"text":@"To improve is to change, so to be perfect is to have changed often.",
                       @"senderNick": @"Anonymous",
                       },
                   @{
                       @"text":@"False words are not only evil in themselves, but they infect the soul with evil.",
                       @"senderNick": @"Anonymous",
                       },
                   @{
                       @"text":@"It has been said that love robs those who have it of their wit, and gives it to those who have none.",
                       @"senderNick": @"Anonymous",
                       },
                   @{
                       @"text":@"The greatest honor history can bestow is the title of peacemaker.",
                       @"senderNick": @"Anonymous",
                       },
                   @{
                       @"text":@"The guest who has escaped from the roof, will think twice before he comes back in by the door.",
                       @"senderNick": @"Anonymous",
                       },
                   @{
                       @"text":@"I'll not assert that it was a diversion which prevented a war, but nevertheless, it was a diversion.",
                       @"senderNick": @"Anonymous",
                       },
                   @{
                       @"text":@"I gyve unto my wief my second best bed with the furniture.",
                       @"senderNick": @"Anonymous",
                       },
                   @{
                       @"text":@"He who knows when he can fight and when he cannot will be victorious.",
                       @"senderNick": @"Anonymous",
                       },
                   @{
                       @"text":@"Sticks and stones may break my bones but words will never hurt me.",
                       @"senderNick": @"Anonymous",
                       },
                   @{
                       @"text":@"It'll be boring when it's not fun any more.",
                       @"senderNick": @"Anonymous",
                       }
                   ];
    });
    return messages;
}

@end
