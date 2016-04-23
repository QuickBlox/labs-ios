//
//  MessageViewComponent.m
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "MessageViewComponent.h"
#import "QBChatMessage.h"
#import "QMIncomingMessageView.h"

@implementation MessageViewComponent {
    
    CKComponent *_overlay;
}

+ (instancetype)newWithMessage:(QBChatMessage *)message context:(MessagesContext *)context {
    
    CKComponentScope scope(self);
    
    CKComponentViewConfiguration stackMessageViewComponnentConfiguration = {
        //CKComponentViewClass
        [UIView class], {
            //CKComponentViewAttributeValue
            CKComponentTapGestureAttribute(@selector(didTap)), {
                @selector(setBackgroundColor:), [UIColor whiteColor]
            }
        }
    };
    
    CKStackLayoutComponent *layoutComponent =
    [CKStackLayoutComponent newWithView:stackMessageViewComponnentConfiguration
                                   size:{}
                                  style:{
                                      .alignItems = CKStackLayoutAlignItemsStretch
                                  }
                               children:{
                                   {
                                       [QMIncomingMessageView newWithText:message.text context:context]
                                   }
                               }
     ];
    
    return [super newWithComponent:layoutComponent];
    
}

- (void)didTap {
    
    NSLog(@"Did Tap");
}

@end
