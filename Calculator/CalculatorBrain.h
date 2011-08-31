//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Jonathan Anderson on 8/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
{
@private
    double operand;
    NSString *waitingOperation;
    double waitingOperand;
}

@property double operand;

- (double)performOperation:(NSString *)operation;

@end
