//
//  GNZPrize.m
//  RelationChips
//
//  Created by Chris Gonzales on 12/7/14.
//  Copyright (c) 2014 GNZ. All rights reserved.
//

#import "GNZPrize.h"

@interface GNZPrize ()

@end

@implementation GNZPrize

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _title = [aDecoder decodeObjectForKey:@"title"];
        _value = [aDecoder decodeObjectForKey:@"value"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.value forKey:@"value"];
}

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
