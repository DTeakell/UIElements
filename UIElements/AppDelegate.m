//
//  AppDelegate.m
//  UIElements
//
//  Created by Dillon Teakell on 5/15/25.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Makes a window
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
        
    // Creates a new View Controller
    ViewController *viewController = [[[ViewController alloc] init] autorelease];
    
    // Assigns it to the root view controller
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
        
    return YES;
}

// Deallocates when ended
- (void) dealloc {
    [_window release];
    [super dealloc];
}

@end
