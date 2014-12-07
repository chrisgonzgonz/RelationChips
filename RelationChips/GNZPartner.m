//
//  GNZPartner.m
//  RelationChips
//
//  Created by Chris Gonzales on 12/7/14.
//  Copyright (c) 2014 GNZ. All rights reserved.
//

#import "GNZPartner.h"

@interface GNZPartner ()

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *phoneNumber;

@end

@implementation GNZPartner

- (instancetype)initWithName:(NSString *)aName phoneNumber:(NSString *)aNumber;
{
    self = [super init];
    if (self) {
        _name = aName;
        _phoneNumber = aNumber;
    }
    return self;
}

-(instancetype)init
{
    return [self initWithName:@"" phoneNumber:@""];
}

@end
