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
    view.backgroundColor = [UIColor systemBackgroundColor];
    self.view = view;
    [view release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // Create label
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    self.label.text = @"Please enter your name";
    self.label.textAlignment = NSTextAlignmentLeft;
    self.label.font = [UIFont systemFontOfSize: 24 weight: UIFontWeightSemibold];
    self.label.textColor = [UIColor labelColor];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: self.label];
    
    
    // Create text field
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Name";
    self.textField.tintColor = [UIColor systemPinkColor];
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: self.textField];
    
    
    // Create button
    self.button = [UIButton buttonWithType: UIButtonTypeSystem];
    self.button.configuration = [UIButtonConfiguration borderedProminentButtonConfiguration];
    self.button.tintColor = [UIColor systemPinkColor];
    self.button.frame = CGRectMake(50, 100, 150, 50);
    
    [self.button setTitle: @"Confirm" forState: UIControlStateNormal];
    [self.button addTarget: self action: @selector(buttonTapped) forControlEvents: UIControlEventTouchUpInside];

    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: self.button];
    
    
    // Add constraints
    [NSLayoutConstraint activateConstraints: @[
        // Label
        [self.label.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor constant:20],
        [self.label.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor constant:-20],
        [self.label.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant: 150],
        
        // Text Field
        [self.textField.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor constant:20],
        [self.textField.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor constant:-20],
        [self.textField.topAnchor constraintEqualToAnchor: self.label.bottomAnchor constant:20],
        
        // Button
        [self.button.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
        [self.button.topAnchor constraintEqualToAnchor: self.textField.bottomAnchor constant: 20]
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
