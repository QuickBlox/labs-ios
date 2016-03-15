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
    
    MessageViewComponent *messageViewComponent =
    
    [super newWithComponent:
     [CKStackLayoutComponent
      newWithView:{
          [UIView class],
          {CKComponentTapGestureAttribute(@selector(didTap)),
              {@selector(setBackgroundColor:), [UIColor whiteColor]}}
          
      }
      size:{}
      style:{
          .alignItems = CKStackLayoutAlignItemsStretch
      }
      children:{
          {
              [QMIncomingMessageView newWithText:message.text context:context]
          }
      }
      ]];
    
    return messageViewComponent;
    
}

- (void)didTap {
    
    NSLog(@"Did Tap");
}

+ (id)initialState
{
    return @NO;
}

- (std::vector<CKComponentAnimation>)animationsFromPreviousComponent:(MessageViewComponent *)previousComponent
{
    if (previousComponent->_overlay == nil && _overlay != nil) {
        return {{_overlay, scaleToAppear()}}; // Scale the overlay in when it appears.
    }
    else {
        return {};
    }
}

static CAAnimation *scaleToAppear()
{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)];
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    scale.duration = 0.2;
    return scale;
}

@end
