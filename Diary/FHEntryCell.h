//
//  FHEntryCell.h
//  Diary
//
//  Created by Faris Halteh on 04/08/14.
//  Copyright (c) 2014 FarisHalteh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FHDiaryEntry;

@interface FHEntryCell : UITableViewCell

+(CGFloat) heightForEntry:(FHDiaryEntry*) entry;
-(void) configureCellForEntry: (FHDiaryEntry*) entry;

@end
