//
//  ChatCollectionViewController.m
//  QMChatKit
//
//  Created by Andrey Ivanov on 15/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "ChatCollectionViewController.h"
#import <ComponentKit/ComponentKit.h>
#import "MessagesContext.h"
#import "MessagesModelController.h"
#import "MessagesPage.h"
#import "QBChatMessage.h"
#import "MessageViewComponent.h"

@interface ChatCollectionViewController() <CKComponentProvider, UICollectionViewDelegateFlowLayout>

@end

@implementation ChatCollectionViewController {
    
    CKCollectionViewDataSource *_dataSource;
    MessagesModelController *_messagesModelController;
    CKComponentFlexibleSizeRangeProvider *_sizeRangeProvider;
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        
         _sizeRangeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    
    MessagesContext *messagesContext = [[MessagesContext alloc] init];
    
    _dataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:self.collectionView
                                                 supplementaryViewDataSource:nil
                                                           componentProvider:[self class]
                                                                     context:messagesContext
                                                   cellConfigurationFunction:nil];
    
    // Insert the initial section
    CKArrayControllerSections sections;
    sections.insert(0);
    [_dataSource enqueueChangeset:{sections, {}} constrainedSize:{}];
    [self _enqueuePage:[_messagesModelController fetchNewMessagesPageWithCount:4]];
    
}

- (void)_enqueuePage:(MessagesPage *)messagesPage {
    
    NSArray *messages = messagesPage.messages;
    NSInteger position = messagesPage.position;
    
    // Convert the array of quotes to a valid changeset
    CKArrayControllerInputItems items;
    for (NSInteger i = 0; i < [messages count]; i++) {
        items.insert([NSIndexPath indexPathForRow:position + i inSection:0], messages[i]);
    }
    
    [_dataSource enqueueChangeset:{{}, items}
                  constrainedSize:[_sizeRangeProvider sizeRangeForBoundingSize:self.collectionView.bounds.size]];
}

#pragma mark - CKComponentProvider

+ (CKComponent *)componentForModel:(QBChatMessage *)model context:(MessagesContext *)context {
    
    return [MessageViewComponent newWithMessage:model context:context];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView.contentSize.height == 0) {
        return ;
    }
    
    if (scrolledToBottomWithBuffer(scrollView.contentOffset, scrollView.contentSize, scrollView.contentInset, scrollView.bounds)) {
        
        [self _enqueuePage:[_messagesModelController fetchNewMessagesPageWithCount:8]];
    }
}

static BOOL scrolledToBottomWithBuffer(CGPoint contentOffset, CGSize contentSize, UIEdgeInsets contentInset, CGRect bounds) {
    
    CGFloat buffer = CGRectGetHeight(bounds) - contentInset.top - contentInset.bottom;
    const CGFloat maxVisibleY = (contentOffset.y + bounds.size.height);
    const CGFloat actualMaxY = (contentSize.height + contentInset.bottom);
    
    return ((maxVisibleY + buffer) >= actualMaxY);
}

@end
