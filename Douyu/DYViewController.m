//
//  DYViewController.m
//  Douyu
//
//  Created by R on 19/4/2018.
//  Copyright © 2018 Lanskaya. All rights reserved.
//

#import "DYViewController.h"
#import "AppDelegate.h"

@interface DYViewController ()

@end

@implementation DYViewController

- (void)viewDidAppear {
    [super viewDidAppear];
    AppDelegate* delegate = [NSApp delegate];
    if (delegate.shouldFloatOnTop) {
        [[[self view] window] setLevel:NSFloatingWindowLevel];
    }
}

@end
