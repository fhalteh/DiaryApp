//
//  FHEntryCell.m
//  Diary
//
//  Created by Faris Halteh on 04/08/14.
//  Copyright (c) 2014 FarisHalteh. All rights reserved.
//

#import "FHEntryCell.h"
#import "FHDiaryEntry.h"

@interface FHEntryCell()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIImageView *moodImageView;

@end

@implementation FHEntryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat) heightForEntry:(FHDiaryEntry*) entry{
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 80.0f;
    const CGFloat minHeight = 106.0f;

    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [entry.body boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) + topMargin + bottomMargin);
    
}

-(void) configureCellForEntry: (FHDiaryEntry*) entry{
    self.bodyLabel.text = entry.body;
    self.locationLabel.text = entry.location;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"EEEE, MMMM d yyyy"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:entry.date];
    
    self.dateLabel.text = [dateFormatter stringFromDate:date];
    if(entry.imageData){
        self.imageView.image = [UIImage imageWithData: entry.imageData];
        
    }else {
        self.mainImageView.image = [UIImage imageNamed:@"icn_noimage"];
        
    }
    if(entry.mood == FHDiaryEntryMoodGood){
        self.imageView.image = [UIImage imageNamed:@"icn_happy"];

    } else if(entry.mood == FHDiaryEntryMoodAverage){
                self.mainImageView.image = [UIImage imageNamed:@"icn_average"];
    } else if (entry.mood == FHDiaryEntryMoodBad){
                self.imageView.image = [UIImage imageNamed:@"icn_bad"];
    }
    
}


@end
