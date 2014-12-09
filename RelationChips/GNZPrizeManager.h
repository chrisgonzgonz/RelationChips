//
//  GNZPrizeManager.h
//  RelationChips
//
//  Created by Chris Gonzales on 12/7/14.
//  Copyright (c) 2014 GNZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GNZPrize.h"

@interface GNZPrizeManager : NSObject

@property (nonatomic, readonly, copy) NSArray *prizes;

+ (id)sharedManager;

- (void)addPrize:(GNZPrize *)prize;

- (BOOL)saveChanges;

@end
