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
//                          @selector(setBackgroundColor:), [UIColor colorWithRed:0.136 green:0.6521 blue:0.1201 alpha:1.0]
//                          
//                      },
//                      {
                          
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
//                          @selector(setBackgroundColor:), [UIColor colorWithRed:0.136 green:0.6521 blue:0.1201 alpha:1.0]
//                          
//                      },
//                      {
                          
                          @selector(setUserInteractionEnabled:), @NO
                      },
                      
                  } size: {
                      
                  }],
                 .alignSelf = CKStackLayoutAlignSelfEnd
             }
         },
     }];
    
    UIEdgeInsets insets = {.top = 5, .bottom = 5, .left = 5, .right = 5};
    
    return [super newWithComponent:[CKInsetComponent newWithInsets:insets component:stackLayout]];
    
}

@end
