//
//  GNZPrize.h
//  RelationChips
//
//  Created by Chris Gonzales on 12/7/14.
//  Copyright (c) 2014 GNZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GNZPrize : NSObject <NSCoding>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSNumber *value;

- (instancetype)initWithTitle:(NSString *)aTitle value:(NSNumber *)aValue;

@end
