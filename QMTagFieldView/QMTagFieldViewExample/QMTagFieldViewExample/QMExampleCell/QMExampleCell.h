//
//  QMExampleCell.h
//  QMTagFieldViewExample
//
//  Created by Vitaliy Gorbachov on 3/25/16.
//  Copyright © 2016 Vitaliy Gorbachov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QMExampleCell : UITableViewCell

@property (strong, nonatomic, readonly) NSString *title;
@property (assign, nonatomic, getter=isChecked) BOOL check;

+ (NSString *)cellIdentifier;
+ (CGFloat)height;

- (void)setTitle:(NSString *)title;

@end
