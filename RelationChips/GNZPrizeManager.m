//
//  GNZPrizeManager.m
//  RelationChips
//
//  Created by Chris Gonzales on 12/7/14.
//  Copyright (c) 2014 GNZ. All rights reserved.
//

#import "GNZPrizeManager.h"

@interface GNZPrizeManager ()

@property (nonatomic, readwrite) NSArray *prizes;

@end

@implementation GNZPrizeManager

+ (instancetype)sharedManager {
    static GNZPrizeManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[GNZPrizeManager alloc] init];
    });
    
    return _sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _prizes = [NSKeyedUnarchiver unarchiveObjectWithFile:[self prizeArchivePath]];
        if (!_prizes) {
            _prizes = [[NSArray alloc] init];
        }
    }
    return self;
}

- (NSString *)prizeArchivePath
{
    NSString *documentsDirectory = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths firstObject];
    
    return [documentsDirectory stringByAppendingPathComponent:@"prizes.archive"];
}

-(void)addPrize:(GNZPrize *)prize
{
    NSMutableArray *mutablePrizes = [self.prizes mutableCopy];
    [mutablePrizes addObject:prize];
    self.prizes = [mutablePrizes copy];
}

-(BOOL)saveChanges
{
    NSString *path = [self prizeArchivePath];
    
    return [NSKeyedArchiver archiveRootObject:self.prizes toFile:path];
}

@end
