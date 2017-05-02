//
//  main.m
//  painfully slow typing
//
//  Created by Jelko Arnds on 02.05.2017.
//  Copyright © 2017 Jelko Arnds. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NSTimeInterval lastKeyUp;
NSTimeInterval now;
double waiting = 2; // wait in seconds

CGEventRef myCGEventCallback(CGEventTapProxy proxy, CGEventType type, CGEventRef event, void *refcon) {
    if (type == kCGEventKeyUp || type == kCGEventKeyDown){
        
        now = [[NSDate date] timeIntervalSince1970];
        double elapsed = now - lastKeyUp;
        
        if(elapsed < waiting){
            return NULL;
        }
        
        if (type == kCGEventKeyUp){
            lastKeyUp = now;
        }
    }
    
    return event;
}

int main(int argc, char *argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    CFRunLoopSourceRef runLoopSource;
    
    CFMachPortRef eventTap = CGEventTapCreate(kCGHIDEventTap, kCGHeadInsertEventTap, kCGEventTapOptionDefault, kCGEventMaskForAllEvents, myCGEventCallback, NULL);
    
    if (!eventTap) {
        NSLog(@"Couldn't create event tap!");
        exit(1);
    }
    
    runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0);
    
    CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, kCFRunLoopCommonModes);
    
    CGEventTapEnable(eventTap, true);
    
    CFRunLoopRun();
    
    CFRelease(eventTap);
    CFRelease(runLoopSource);
    [pool release];
    
    exit(0);
}
