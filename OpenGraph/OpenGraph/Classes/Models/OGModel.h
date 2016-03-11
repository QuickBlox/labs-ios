//
//  OGModel.h
//  OpenGraph
//
//  Created by Andrey Ivanov on 10/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OpenGraphProtocol.h"

@class HTMLNode;

/**
 *  Model provides Open Graph protocol
 * @see http://ogp.me
 */
@interface OGModel : NSObject <OpenGraphProtocol>

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithHeadNode:(HTMLNode *)node;

@end
