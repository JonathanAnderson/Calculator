//
//  ViewController.m
//  Calculator
//
//  Created by Jonathan Anderson on 8/27/11.
//  Copyright (c) 2011 Woma LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
@property (readonly) CalculatorBrain *brain;
@end

@implementation ViewController

- (CalculatorBrain *)brain
{
    if (!brain) {
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = sender.titleLabel.text;
    if (userIsInTheMiddleOfTypingANumber) {
        if ([display.text isEqualToString:@"0"]) {
            display.text = digit;
        } else {
            display.text = [display.text stringByAppendingString:digit];
        }
    } else {
        display.text = digit;
        userIsInTheMiddleOfTypingANumber = YES;
    }
    NSLog(@"KeyPress:%@ %@", sender.titleLabel.text, brain);
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if (userIsInTheMiddleOfTypingANumber) {
        self.brain.operand = display.text.doubleValue;
        userIsInTheMiddleOfTypingANumber = NO;
    }
    NSString *operation = sender.titleLabel.text;
    [self.brain performOperation:operation];
    display.text = [NSString stringWithFormat:@"%g", self.brain.operand];
    NSLog(@"KeyPress:%@ %@", sender.titleLabel.text, brain);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
