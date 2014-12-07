//
//  GNZPartner.m
//  RelationChips
//
//  Created by Chris Gonzales on 12/7/14.
//  Copyright (c) 2014 GNZ. All rights reserved.
//

#import "GNZPartner.h"

@interface GNZPartner ()


@end

@implementation GNZPartner

-(instancetype)initWithPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    self = [super init];
    if (self) {
        _firstName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonFirstNameProperty));
        _lastName = CFBridgingRelease(ABRecordCopyValue(person, kABPersonLastNameProperty));
        
        CFIndex selectedIndex = ABMultiValueGetIndexForIdentifier(ABRecordCopyValue(person, property), identifier);
        _phoneNumber = [NSString stringWithFormat:@"%@", ABMultiValueCopyValueAtIndex(ABRecordCopyValue(person, property), selectedIndex)];
    }
    return self;
}

@end
