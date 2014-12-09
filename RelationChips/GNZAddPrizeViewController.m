//
//  GNZAddPrizeViewController.m
//  RelationChips
//
//  Created by Chris Gonzales on 12/7/14.
//  Copyright (c) 2014 GNZ. All rights reserved.
//

#import "GNZAddPrizeViewController.h"
#import "GNZPrize.h"
#import "GNZPrizeManager.h"

@interface GNZAddPrizeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *prizeTitleField;
@property (weak, nonatomic) IBOutlet UITextField *prizeValueField;

@end

@implementation GNZAddPrizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonTapped:(id)sender {
    NSString *prizeValue = self.prizeValueField.text;
    
    GNZPrize *newPrize = [[GNZPrize alloc] initWithTitle:self.prizeTitleField.text value:[NSNumber numberWithInteger:[prizeValue integerValue]]];
    [[GNZPrizeManager sharedManager] addPrize:newPrize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
