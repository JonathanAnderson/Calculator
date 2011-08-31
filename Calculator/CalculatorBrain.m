//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Jonathan Anderson on 8/27/11.
//  Copyright (c) 2011 Woma LLC. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

@synthesize operand;

- (NSString *)description
{
    return [NSString stringWithFormat:@"\nCalculator Brain \noperand:%g \nwaitingOperation:%@ \nwaitingOperand:%g \n", operand, waitingOperation, waitingOperand];
}

- (void)performWaitingOperation
{
    if ([@"+" isEqualToString:waitingOperation])
    {
        operand = waitingOperand + operand;
    }
    else if ([@"-" isEqualToString:waitingOperation])
    {
        operand = waitingOperand - operand;
    }
    else if ([@"*" isEqualToString:waitingOperation])
    {
        operand = waitingOperand * operand;
    }
    else if ([@"/" isEqualToString:waitingOperation])
    {
        if (operand) {
            operand = waitingOperand / operand;
        }
    }
}

- (double)performOperation:(NSString *)operation
{
    if ([operation isEqualToString:@"sqrt"]) {
        operand = sqrt(operand);
    } else if ([operation isEqualToString:@"+/-"]) {
        operand = -operand;
    } else if ([operation isEqualToString:@"log"]) {
        operand = log(operand);
    } else if ([operation isEqualToString:@"CE"]) {
        operand = 0;
    } else if ([operation isEqualToString:@"AC"]) {
        operand = 0;
        waitingOperation = @"+";
        waitingOperand = 0;
    } else {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    
    return operand;
}

@end
