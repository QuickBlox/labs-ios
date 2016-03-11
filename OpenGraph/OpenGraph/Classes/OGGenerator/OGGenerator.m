//
//  OGGenerator.m
//  OpenGraph
//
//  Created by Andrey Ivanov on 10/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "OGGenerator.h"
#import "HTMLDocument.h"
#import "OGModel.h"

@implementation OGGenerator

#pragma mark - Public Getters

//TODO: temp
- (void)generate:(void (^)(OGModel *model))newModel {
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    
        
        NSError *error = nil;
        HTMLDocument *doc = [HTMLDocument documentWithContentsOfURL:[NSURL URLWithString:@"https://www.youtube.com/watch?v=b2gjUZGprLM"]
                                                              error:&error];
        HTMLNode *head = [doc head];
        OGModel *model = [[OGModel alloc] initWithHeadNode:head];
        
        newModel (model);
}


@end
