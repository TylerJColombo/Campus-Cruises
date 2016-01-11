//
//  RegistrationViewController.m
//  Campus-Cruises
//
//  Created by Trevor Hodde on 1/11/16.
//  Copyright © 2016 Trevor Hodde. All rights reserved.
//

#import "RegistrationViewController.h"
#import <Parse/Parse.h>

@interface RegistrationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *studentIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *password2TextField;

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerUser:(UIButton *)sender {
    // create user
    PFUser *user = [PFUser user];
    
    // grab all fields from text boxes
    user.email = self.emailTextField.text;
    user.username = user.email;
    
    NSString *firstName = [self.firstNameTextField text];
    [[PFUser user] setObject:firstName forKey:@"firstName"];
    
    NSString *lastName = [self.lastNameTextField text];
    [[PFUser user] setObject:lastName forKey:@"lastName"];
    
    NSString *studentId = [self.studentIDTextField text];
    [[PFUser user] setObject:studentId forKey:@"studentId"];
    
    if([self.passwordTextField.text isEqualToString:self.password2TextField.text]) {
        user.password = self.passwordTextField.text;
    }
    
    
    // register the user with the parse database
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            //The registration was successful, go to the wall
            [self performSegueWithIdentifier:@"SignupSuccesful" sender:self];
            
        } else {
            //Something bad has occurred
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
      //      UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:NSNull, NSNull];
            //[errorAlertView show];
        }
    }];
}
@end