//
//  QMIncomingMessageView.m
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "QMIncomingMessageView.h"
#import "MessagesContext.h"

@implementation QMIncomingMessageView

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
                           {@selector(setBackgroundColor:), [UIColor colorWithRed:0.136 green:0.6521 blue:0.1201 alpha:1.0]},
                           {@selector(setUserInteractionEnabled:), @NO},
                       }
                       size:{ }],
                      .alignSelf = CKStackLayoutAlignSelfEnd
                  },
              }]]];
    
}

@end
