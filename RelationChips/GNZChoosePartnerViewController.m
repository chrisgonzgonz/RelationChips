//
//  ViewController.m
//  RelationChips
//
//  Created by Chris Gonzales on 12/6/14.
//  Copyright (c) 2014 GNZ. All rights reserved.
//

#import "GNZChoosePartnerViewController.h"
#import <AddressBookUI/AddressBookUI.h>
#import "GNZPrizesTableViewController.h"
#import "GNZPartner.h"

@interface GNZChoosePartnerViewController () <ABPeoplePickerNavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation GNZChoosePartnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPush:(id)sender {
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark ABPeoplePickerNavigationControllerDelegate methods

// A selected person is returned with this method.
//- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person
//{
//    NSString *contactName = CFBridgingRelease(ABRecordCopyCompositeName(person));
//    
//    ABMutableMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
//    
//    self.nameLabel.text = [NSString stringWithFormat:@"Picked %@", contactName ? contactName : @"No Name"];
//    self.phoneLabel.text = [NSString stringWithFormat:@"Number %@", ABMultiValueCopyValueAtIndex(multi, 0)];
//    CFRelease(multi);
//}

-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    if (property == kABPersonPhoneProperty) {
        GNZPartner *newPartner = [[GNZPartner alloc] initWithPerson:person property:property identifier:identifier];
        
        [self updateUIWithPartner:newPartner];
        
        GNZPrizesTableViewController *nextVC = [self.storyboard instantiateViewControllerWithIdentifier:@"prizesVC"];
        
        [self.navigationController pushViewController:nextVC animated:YES];
    } else {
        NSLog(@"Did not choose a number!");
    }
}

-(void)updateUIWithPartner:(GNZPartner *)partner
{
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", partner.firstName, partner.lastName];
    self.phoneLabel.text = partner.phoneNumber;
    
    self.navigationItem.backBarButtonItem.title = partner.firstName;
}


// Implement this if you want to do additional work when the picker is cancelled by the user. This method may be optional in a future iOS 8.0 seed.
//- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
//{
//}

@end
