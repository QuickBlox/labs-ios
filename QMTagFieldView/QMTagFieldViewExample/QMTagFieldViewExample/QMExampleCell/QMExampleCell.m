//
//  QMExampleCell.m
//  QMTagFieldViewExample
//
//  Created by Vitaliy Gorbachov on 3/25/16.
//  Copyright © 2016 Vitaliy Gorbachov. All rights reserved.
//

#import "QMExampleCell.h"

static UIColor *selectedColor() {
    
    static UIColor *color = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        color = [UIColor redColor];
    });
    
    return color;
}

static UIColor *deselectedColor() {
    
    static UIColor *color = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        color = [UIColor blackColor];
    });
    
    return color;
}

@interface QMExampleCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic, readwrite) NSString *title;

@end

@implementation QMExampleCell

+ (NSString *)cellIdentifier {
    
    return @"QMExampleCell";
}

+ (CGFloat)height {
    
    return 44.0f;
}

- (void)setTitle:(NSString *)title {
    
    if (![_title isEqualToString:title]) {
        
        _title = title;
        
        self.titleLabel.text = title;
    }
}

- (void)setCheck:(BOOL)check {
    
    if (_check != check) {
        
        _check = check;
        self.titleLabel.textColor = check ? selectedColor() : deselectedColor();
    }
}

@end
