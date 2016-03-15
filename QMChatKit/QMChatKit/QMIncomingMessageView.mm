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
            
            [CKInsetComponent newWithInsets:{.top = 70, .bottom = 25, .left = 20, .right = 20}
                                  component: [CKStackLayoutComponent
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
                                                           {@selector(setBackgroundColor:), [UIColor clearColor]},
                                                           {@selector(setUserInteractionEnabled:), @NO},
                                                       }
                                                       size:{ }],
                                                      .alignSelf = CKStackLayoutAlignSelfCenter
                                                  },
                                              }]]];
    
}

@end
