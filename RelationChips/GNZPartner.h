//
//  GNZPartner.h
//  RelationChips
//
//  Created by Chris Gonzales on 12/7/14.
//  Copyright (c) 2014 GNZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

@interface GNZPartner : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *phoneNumber;

- (instancetype)initWithPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier;

@end
