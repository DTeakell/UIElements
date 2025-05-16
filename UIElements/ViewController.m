//
//  ViewController.m
//  UIElements
//
//  Created by Dillon Teakell on 5/15/25.
//

#import "ViewController.h"
@interface ViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void) loadView {
    UIView *view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
    [view release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // Create label
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    self.label.text = @"Please enter your name";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor blackColor];
    
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: self.label];
    
    
    // Create text field
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Name";
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: self.textField];
    
    
    // Create button
    self.button = [UIButton buttonWithType: UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 100, 150, 50);
    [self.button setTitle: @"Confirm" forState: UIControlStateNormal];
    
    [self.button addTarget: self action: @selector(buttonTapped) forControlEvents: UIControlEventTouchUpInside];

    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: self.button];
    
    
    // Add constraints
    [NSLayoutConstraint activateConstraints: @[
        // Center label and place it near the top
        [self.label.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
        [self.label.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant: 150],
        
        [self.textField.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
        [self.textField.topAnchor constraintEqualToAnchor: self.label.bottomAnchor constant: 20],
        
        // Center button horizontally and place it under the button
        [self.button.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
        [self.button.topAnchor constraintEqualToAnchor:
            self.textField.bottomAnchor constant: 20]
    ]];
}

// Function that changes the label to welcome the user
- (void) greetUser {
    NSString *name = self.textField.text;
    
    if (name.length > 0) {
        self.label.text = [NSString stringWithFormat: @"Hello, %@!", name];
    } else {
        self.label.text = @"Hello there!";
    }
}

// Function for when the button is tapped
- (void) buttonTapped {
    NSLog(@"Button Tapped");
    [self greetUser];
}


@end
