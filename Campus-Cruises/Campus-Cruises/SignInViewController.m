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

// TODO -- add error checking:
//      1) Check if username exists
//      2) Check if password is correct
//      3) Remove back button to avoid weird double login issues
//      4) ONLY SEGUE IF LOGIN IS CORRECT!
- (IBAction)signIn:(UIButton *)sender {
    //Login button pressed
    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        if (user) {
            [self performSegueWithIdentifier:@"LoginSuccesful" sender:self];
        } else {
            //Something bad has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            //UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //[errorAlertView show];
        }
    }];
}


@end
