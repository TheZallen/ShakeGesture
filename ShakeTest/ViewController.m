//h
//  ViewController.m
//  ShakeTest
//
//  Created by Zak Allen on 5/13/15.
//  Copyright (c) 2015 Tuko Apps. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioServices.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize segmentedControl;

int which;

-(void) viewDidLoad {
    // Request to turn on accelerometer and begin receiving accelerometer events
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientationChanged:(NSNotification *)notification {
    // Respond to changes in device orientation
}

-(void) viewDidDisappear {
    // Request to stop receiving accelerometer events and turn off accelerometer
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        if(segmentedControl.selectedSegmentIndex == 0){
            [self showAlert];
        }else if(segmentedControl.selectedSegmentIndex == 1){
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }else if(segmentedControl.selectedSegmentIndex == 2){
            NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"alert" ofType:@"mp3"];
            SystemSoundID soundID;
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
            AudioServicesPlaySystemSound (soundID);
        }
    }
}


-(void)showAlert
{
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"ShakeGesture Demo"
                              message:@"Shake Detected"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentedControlAction:(id)sender {
//    if(segmentedControl.selectedSegmentIndex == 0){
//
//    }else if(segmentedControl.selectedSegmentIndex == 1){
//        self.view.backgroundColor = [UIColor greenColor];
//    }else if(segmentedControl.selectedSegmentIndex == 2){
//        self.view.backgroundColor = [UIColor blueColor];
//    }
}
@end
