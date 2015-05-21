//
//  ViewController.h
//  ShakeTest
//
//  Created by Zak Allen on 5/13/15.
//  Copyright (c) 2015 Tuko Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)segmentedControlAction:(id)sender;

@end

