//
//  OpenGraphProtocol.h
//  OpenGraph
//
//  Created by Andrey Ivanov on 10/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
The Open Graph protocol enables any web page to become a rich object in a social graph. For instance, this is used on Facebook to allow any web page to have the same functionality as any other object on Facebook.

While many different technologies and schemas exist and could be combined together, there isn't a single technology which provides enough information to richly represent any web page within the social graph. The Open Graph protocol builds on these existing technologies and gives developers one thing to implement. Developer simplicity is a key goal of the Open Graph protocol which has informed many of the technical design decisions.

 */
@protocol OpenGraphProtocol <NSObject, NSCoding>

#pragma mark - Basic Metadata

/**
 *  Original URL
 */
@property (nonatomic, copy, readonly) NSString *originalUrl;

/**
 *  The title of your object as it should appear within the graph (og:title)
 */
@property (nonatomic, copy, readonly) NSString *ogTitle;

/**
 *   The canonical URL of your object that will be used as its permanent ID in the graph (og:url)
 */
@property (nonatomic, copy, readonly) NSString *url;

/**
 *   An image URL which should represent your object within the graph.(og:image)
 */
@property (nonatomic, copy, readonly) NSString *image;

#pragma mark - Optional Metadata

/**
 *  A one to two sentence description of your object. (og:description)
 */
@property (nonatomic, copy, readonly) NSString *ogDescription;

/**
 *  If your object is part of a larger web site, the name which should be displayed for the overall site. (og:site_name)
 */
@property (nonatomic, copy, readonly) NSString *siteName;

@end
