//
//  ViewController.m
//  UIElements
//
//  Created by Dillon Teakell on 5/15/25.
//

#import "ViewController.h"
@interface ViewController ()

@property (nonatomic, strong) UILabel *label;
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
 
    // 1. Create label
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 150, 50)];
    self.label.text = @"Hello. Objective-C!";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor blackColor];
    
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: self.label];
    
    
    // 2. Create button
    self.button = [UIButton buttonWithType: UIButtonTypeSystem];
    self.button.frame = CGRectMake(50, 100, 150, 50);
    [self.button setTitle: @"Confirm" forState: UIControlStateNormal];
    
    [self.button addTarget: self action: @selector(buttonTapped) forControlEvents: UIControlEventTouchUpInside];

    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview: self.button];
    
    
    // 3. Add constraints
    [NSLayoutConstraint activateConstraints: @[
        // Center label and place it near the top
        [self.label.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
        [self.label.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant: 150],
        
        // Center button horizontally and place it under the button
        [self.button.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
        [self.button.topAnchor constraintEqualToAnchor:
            self.label.bottomAnchor constant: 50]
    ]];
}

- (void) buttonTapped {
    NSLog(@"Button Tapped");
    self.label.textColor = [UIColor orangeColor];
    self.label.text = @"The label is now orange!";
}


@end
