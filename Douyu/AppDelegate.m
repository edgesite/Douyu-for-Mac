//
//  AppDelegate.m
//  Douyu
//
//  Created by Grayon on 2017/9/21.
//  Copyright © 2017年 Lanskaya. All rights reserved.
//

#import "AppDelegate.h"

static NSString* const PREF_KEY_SHOULD_FLOAT_ON_TOP = @"shouldFloatOnTop";

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [[NSUserDefaults standardUserDefaults] boolForKey:PREF_KEY_SHOULD_FLOAT_ON_TOP];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)application:(NSApplication *)application openURLs:(NSArray<NSURL *> *)urls {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"openUrl" object:urls];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication
                    hasVisibleWindows:(BOOL)flag{
    if (!flag){
        //主窗口显示
        [NSApp activateIgnoringOtherApps:NO];
        [theApplication.windows.firstObject makeKeyAndOrderFront:self];
    }
    return YES;
}

- (IBAction)onMenuAction:(id)sender {
    NSMenuItem* item = (NSMenuItem*)sender;
    if ([item.identifier isEqualToString:@"FLOAT_ON_TOP"]) {
        if (item.state == NSOnState) {
            _shouldFloatOnTop = NO;
            [item setState:NSOffState];
        } else {
            _shouldFloatOnTop = YES;
            [item setState:NSOnState];
        }
        [[NSUserDefaults standardUserDefaults] setBool:_shouldFloatOnTop forKey:PREF_KEY_SHOULD_FLOAT_ON_TOP];
        NSWindow* window = NSApplication.sharedApplication.keyWindow;
        if (window != nil) {
            [window setLevel:(_shouldFloatOnTop ? NSFloatingWindowLevel : NSNormalWindowLevel)];
        }
    }
}

@end
