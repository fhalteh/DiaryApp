//
//  FHDiaryEntry.h
//  Diary
//
//  Created by Faris Halteh on 22/07/14.
//  Copyright (c) 2014 FarisHalteh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ENUM(int16_t, FHDiaryEntryMood){
    FHDiaryEntryMoodGood = 0,
    FHDiaryEntryMoodAverage = 1,
    FHDiaryEntryMoodBad = 2
};

@interface FHDiaryEntry : NSManagedObject

@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic) int16_t mood;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, readonly) NSString *sectionName;


@end