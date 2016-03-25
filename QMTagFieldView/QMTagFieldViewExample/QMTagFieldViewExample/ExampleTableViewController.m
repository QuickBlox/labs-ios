//
//  ExampleTableViewController.m
//  QMTagFieldViewExample
//
//  Created by Vitaliy Gorbachov on 3/25/16.
//  Copyright © 2016 Vitaliy Gorbachov. All rights reserved.
//

#import "ExampleTableViewController.h"
#import "QMExampleCell.h"

#import "QMTagFieldView.h"

@interface ExampleTableViewController () <QMTagFieldViewDelegate>

@property (strong, nonatomic) NSArray *initialData;
@property (strong, nonatomic) NSArray *sortedData;

@property (strong, nonatomic) QMTagFieldView *tagFieldView;

@end

@implementation ExampleTableViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Hide empty separators
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // fill in data
    self.initialData = @[
                         @"Chat code sample",
                         @"WebRTC (VideoChat) code sample",
                         @"Custom Objects (key value data store) code sample",
                         @"Location code sample",
                         @"Push Notifications code sample",
                         @"Users authentication (Facebook, Twitter, OAuth integration) code sample",
                         @"content storage and update code sample",
                         @"Vitaliy Gorbachov",
                         @"Andrey Ivanov",
                         @"Anton Sokolchenko",
                         ];
    self.sortedData = self.initialData.copy;
    
    // init tag field view
    self.tagFieldView = [[QMTagFieldView alloc] initWithFrame:CGRectMake(0.0f,
                                                                         0.0f,
                                                                         CGRectGetWidth(self.view.frame),
                                                                         44.0f)];
    self.tagFieldView.placeholder = @"Type something to search...";
    self.tagFieldView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.tagFieldView.delegate = self;
    self.tagFieldView.maxNumberOfLines = 5;
    self.tableView.tableHeaderView = self.tagFieldView;
}

#pragma mark - QMTagFieldViewDelegate

- (void)tagFieldView:(QMTagFieldView *)tagFieldView didChangeText:(NSString *)text {
    
    if (tagFieldView == _tagFieldView) {
        
        if (text.length > 0) {
            
            NSPredicate *filterPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", text];
            self.sortedData = [self.initialData filteredArrayUsingPredicate:filterPredicate];
        }
        else {
            
            self.sortedData = self.initialData.copy;
        }
        
        [self.tableView reloadData];
    }
}

- (void)tagFieldView:(QMTagFieldView *)tagFieldView didChangeHeight:(CGFloat)height {
    
    if (tagFieldView == _tagFieldView) {
        
        CGRect tagFieldFrame = CGRectMake(0.0f,
                                          0.0f,
                                          CGRectGetWidth(tagFieldView.frame),
                                          height);
        
        __weak __typeof(self)weakSelf = self;
        [UIView animateWithDuration:0.2f animations:^{
            
            __typeof(weakSelf)strongSelf = weakSelf;
            strongSelf.tagFieldView.frame = tagFieldFrame;
            strongSelf.tableView.tableHeaderView = weakSelf.tagFieldView;
        }];
    }
}

- (void)tagFieldView:(QMTagFieldView *)tagFieldView didDeleteTagWithID:(id)tagID {
    
    if (tagFieldView == _tagFieldView) {
        
        for (QMExampleCell *cell in self.tableView.visibleCells) {
            
            if ([cell.title isEqualToString:tagID]) {
                
                cell.check = NO;
            }
        }
    }
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QMExampleCell *cell = [tableView dequeueReusableCellWithIdentifier:[QMExampleCell cellIdentifier] forIndexPath:indexPath];
    
    NSString *text = self.sortedData[indexPath.row];
    [cell setTitle:text];
    cell.check = [self.tagFieldView.tagIDs containsObject:text];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.sortedData.count;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [QMExampleCell height];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *text = self.sortedData[indexPath.row];
    
    QMExampleCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (cell.isChecked) {
        
        [self.tagFieldView removeTagWithID:text];
    }
    else {
        
        [self.tagFieldView addTag:text tagID:text animated:YES];
        [self.tagFieldView scrollToTextField:YES];
    }
    
    cell.check = !cell.isChecked;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    // hide keyboard on scrollView
    [self.view endEditing:YES];
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    
    // hide keyboard on scrollView
    [self.view endEditing:YES];
}

@end
