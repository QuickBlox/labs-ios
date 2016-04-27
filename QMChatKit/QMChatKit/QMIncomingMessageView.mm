//
//  QMIncomingMessageView.m
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "QMIncomingMessageView.h"
#import "MessagesContext.h"
#import <ComponentKit/CKComponentSubclass.h>

@implementation QMIncomingMessageView

+ (id)initialState
{
    return @NO;
}

+ (instancetype)newWithText:(NSString *)text context:(MessagesContext *)context {
    
    CKComponentScope scope(self);
    NSNumber *state = scope.state();
    
    CKStackLayoutComponent *stackLayout =
    [CKStackLayoutComponent
     newWithView: {
         
     } size: {
         
     } style: {
         
     } children: {
         {
             { //Top label
                 [CKLabelComponent
                  newWithLabelAttributes: {
                      
                      .string = @"Andrey Ivanov",
                      .font = [UIFont boldSystemFontOfSize:17]
                      
                  } viewAttributes: {
                      
                      {
                          @selector(setUserInteractionEnabled:), @NO
                      }
                      
                  } size: {
                      
                  }],
                 
                 .alignSelf = CKStackLayoutAlignSelfStart
             }, // TopLabel end
             { // MessageText
                 
                 [CKLabelComponent
                  newWithLabelAttributes: {
                      
                      .string = text,
                      .font = [UIFont fontWithName:@"Baskerville" size:17]
                      
                  } viewAttributes: {
                      
                      {
                          @selector(setUserInteractionEnabled:), @NO
                      },
                      
                  } size: {
                      
                  }],
                 
                 .alignSelf = CKStackLayoutAlignSelfStart
             }, // Message text end
             { // bottom label
                 
                 [CKLabelComponent
                  newWithLabelAttributes: {
                      
                      .string = @"11:54:65",
                      .font = [UIFont fontWithName:@"Baskerville" size:17]
                      
                  } viewAttributes: {
                      
                      {
                          @selector(setUserInteractionEnabled:), @NO
                      },
                      
                  } size: {
                      
                  }],
                 
                 .alignSelf = CKStackLayoutAlignSelfEnd
             },
             {
                 
                 [CKTextComponent
                  newWithTextAttributes:{
                      
                      .attributedString = [[NSAttributedString alloc] initWithString:text],
                      .maximumNumberOfLines = static_cast<NSUInteger>([state boolValue] ? 0 : 1),
                      
                  }
                  viewAttributes:{
                      //CKComponentViewAttributeValue
                      CKComponentTapGestureAttribute(@selector(didTapContinueReading)), {
                          @selector(setBackgroundColor:),
                          [state boolValue] ? [UIColor grayColor] : [UIColor colorWithRed:0.5 green:0.2496 blue:0.3252 alpha:1.0]
                      }
                      
                  }
                  accessibilityContext:{}
                  size:{}],
             }
         },
     }];
    
    UIEdgeInsets insets = {.top = 5, .bottom = 5, .left = 5, .right = 5};
    
    return [super newWithComponent:[CKInsetComponent newWithInsets:insets component:stackLayout]];
    
}

- (void)didTapContinueReading {
    
    [self updateState:^(NSNumber *oldState) {
        return [oldState boolValue] ? @NO : @YES;
        
    } mode:CKUpdateModeSynchronous];
}


@end
