//
//  TermsAndConditionsViewController.m
//  Hopp
//
//  Created by Matthew Sloane on 4/21/15.
//  Copyright (c) 2015 Lane Miles. All rights reserved.
//

#import "TermsAndConditionsViewController.h"

@interface TermsAndConditionsViewController ()

@end

@implementation TermsAndConditionsViewController
- (IBAction)didAccept:(id)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"disclaimerAccepted"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)didReject:(id)sender {
    [self performSegueWithIdentifier:@"tac_rejected_segue" sender:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // ensure that text view text starts at the top
    [self.tacTextView scrollRangeToVisible:NSMakeRange(0, 0)];
    [self.privacyTextView scrollRangeToVisible:NSMakeRange(0, 0)];
    
    self.tacTextView.layer.borderWidth = 1.0f;
    self.tacTextView.layer.borderColor = [[UIColor blackColor] CGColor];
    self.privacyTextView.layer.borderWidth = 1.0f;
    self.privacyTextView.layer.borderColor = [[UIColor blackColor] CGColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

                
}




@end
