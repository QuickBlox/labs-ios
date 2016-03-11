//
//  OGModel.m
//  OpenGraph
//
//  Created by Andrey Ivanov on 10/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import "OGModel.h"
#import "HTMLDocument.h"

@interface HTMLNode()

@property (strong, nonatomic) NSDictionary *title;

@end

@implementation OGModel

- (instancetype)initWithHeadNode:(HTMLNode *)head {
    
    self = [super init];
    if (self) {
        
        for (HTMLNode *node in head.children) {
            
            if ([node.tagName isEqualToString:@"meta"]) {
                
//                [node.attributes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull attribute, BOOL * _Nonnull stop) {
//                    
//                    BOOL property = [key isEqualToString:@"property"];
//                    
//                    
//                    
//                    if (&& [attribute isEqualToString:@"og:title"]) {
//                        
//                        self.title = node;
//                        *stop = YES;
//                    }
//                    
//                    if ([key isEqualToString:@"property"] && [attribute isEqualToString:@"og:description"]) {
//                        
//                        model.ogDescription = [node attributeForName:@"content"];
//                        *stop = YES;
//                    }
//                    
//                    if ([key isEqualToString:@"property"] && [attribute isEqualToString:@"og:url"]) {
//                        
//                        model.url = [node attributeForName:@"content"];
//                        *stop = YES;
//                    }
//                    
//                    if ([key isEqualToString:@"property"] && [attribute isEqualToString:@"og:site_name"]) {
//                        
//                        model.siteName = [node attributeForName:@"content"];
//                        *stop = YES;
//                    }
//                    
//                    if ([key isEqualToString:@"property"] && [attribute isEqualToString:@"og:image"]) {
//                        
//                        model.image = [node attributeForName:@"content"];
//                        *stop = YES;
//                    }
//                }];
            }
        }
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            newModel(model);
//        });
//    });


    }
    return self;
}

#pragma mark - Public Getters

- (NSString *)ogDescription {
    
    return nil;
}

- (NSString *)ogTitle {
    
    return nil;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    return nil;
}

@end
