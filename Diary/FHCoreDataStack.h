//
//  FHCoreDataStack.h
//  Diary
//
//  Created by Faris Halteh on 22/07/14.
//  Copyright (c) 2014 FarisHalteh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FHCoreDataStack : NSObject


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

+ (instancetype) defaultStack;


@end
