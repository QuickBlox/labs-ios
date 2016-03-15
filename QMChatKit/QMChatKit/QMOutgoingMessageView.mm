//
//  QMOutgoingMessageView.m
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "QMOutgoingMessageView.h"
#import "MessagesContext.h"


@implementation QMOutgoingMessageView

+ (instancetype)newWithText:(NSString *)text context:(MessagesContext *)context {
    
    return [super newWithComponent:
            /**
             *  Insets
             */
            [CKInsetComponent newWithInsets:{.top = 10, .bottom = 5, .left = 60, .right = 10}
                                  component:
             [CKStackLayoutComponent
              newWithView:{}
              size:{}
              style:{}
              children:{
                  {
                      [CKLabelComponent
                       newWithLabelAttributes:{
                           .string = text,
                           .font = [UIFont fontWithName:@"Baskerville" size:17]
                       }
                       viewAttributes:{
                           {@selector(setBackgroundColor:), [UIColor colorWithRed:0.1517 green:0.4967 blue:0.6033 alpha:1.0]},
                           {@selector(setUserInteractionEnabled:), @NO},
                       }
                       size:{ }],
                      .alignSelf = CKStackLayoutAlignSelfStart
                  },
              }]]];
}

@end
