//
//  OGPreviewCell.h
//  OpenGraph
//
//  Created by Andrey Ivanov on 10/03/16.
//  Copyright © 2016 Andrey Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kOGPreviewCellIdentifier;

@interface OGPreviewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *ogTitle;
@property (weak, nonatomic) IBOutlet UILabel *ogDescription;
@property (weak, nonatomic) IBOutlet UILabel *ogSiteName;

@end
