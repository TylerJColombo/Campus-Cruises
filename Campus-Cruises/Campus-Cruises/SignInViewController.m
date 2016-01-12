//
//  SignInViewController.m
//  Campus-Cruises
//
//  Created by Trevor Hodde on 1/11/16.
//  Copyright © 2016 Trevor Hodde. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TODO:
//      1) Remove back button to avoid weird double login issues -- later
- (IBAction)signIn:(UIButton *)sender {
    //Login button pressed
    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        if (user) {
            [self performSegueWithIdentifier:@"successfullyLoggedIn" sender:self];
        } else {
            //invalid login
            // TODO -- match the message and title to real one to make sure it's legit
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Invalid Credentials"
                                                                           message:@"You have entered an incorrect username or password."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}


@end
