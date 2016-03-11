//
//  LinksViewController.m
//  OpenGraph
//
//  Created by Andrey Ivanov on 10/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "LinksViewController.h"
#import "OGPreviewCell.h"
#import "OGModel.h"
#import "OGGenerator.h"

@implementation LinksViewController

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OGPreviewCell *cell = [tableView dequeueReusableCellWithIdentifier:kOGPreviewCellIdentifier];
    
    OGGenerator *generator = [[OGGenerator alloc] init];
    
    [generator generate:^(OGModel *model) {
        
        cell.ogTitle.text = model.ogTitle;
        cell.ogDescription.text = model.ogDescription;
        cell.ogSiteName.text = model.siteName;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            
            
            NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.image]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
               
            });
            
        });
        
    }];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 160;
}

@end
