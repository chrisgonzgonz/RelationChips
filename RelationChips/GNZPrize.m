//
//  GNZPrize.m
//  RelationChips
//
//  Created by Chris Gonzales on 12/7/14.
//  Copyright (c) 2014 GNZ. All rights reserved.
//

#import "GNZPrize.h"

@interface GNZPrize ()

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSNumber *value;

@end
@implementation GNZPrize

- (instancetype)initWithTitle:(NSString *)aTitle value:(NSNumber *)aValue
{
    self = [super init];
    if (self) {
        _title = aTitle;
        _value = aValue;
    }
    return self;
}

@end
