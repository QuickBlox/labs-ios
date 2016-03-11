//
//  OGGenerator.h
//  OpenGraph
//
//  Created by Andrey Ivanov on 10/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OGModel;

@interface OGGenerator : NSObject

/**
 *  Generate Open graph model 
 *  @see http://ogp.me
 *
 *  @param model OGModel instance
 */
- (void)generate:(void (^)(OGModel *model))model;

@end
