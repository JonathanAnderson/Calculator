//
//  ViewController.h
//  Calculator
//
//  Created by Jonathan Anderson on 8/27/11.
//  Copyright (c) 2011 Woma LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface ViewController : UIViewController
{
    CalculatorBrain *brain;
    IBOutlet UILabel *display;
    BOOL userIsInTheMiddleOfTypingANumber;
}

- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;

@end
