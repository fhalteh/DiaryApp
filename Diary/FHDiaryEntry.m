//
//  FHDiaryEntry.m
//  Diary
//
//  Created by Faris Halteh on 22/07/14.
//  Copyright (c) 2014 FarisHalteh. All rights reserved.
//

#import "FHDiaryEntry.h"


@implementation FHDiaryEntry

@dynamic date;
@dynamic body;
@dynamic imageData;
@dynamic mood;
@dynamic location;

-(NSString *) sectionName{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MMM yyyy"];
    
    return [dateFormatter stringFromDate:date];
}
@end
