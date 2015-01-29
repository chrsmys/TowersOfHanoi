//
//  TWState.h
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Peg.h"
#import "TWMove.h"
@interface TWState : NSObject{
    DiskStack *peg1;
    DiskStack *peg2;
    DiskStack *peg3;
    TWMove *previousMove;
    TWState *previousState;
}
-(void)setPreviousMove:(TWMove *)mv;
-(void)setPreviousState:(TWState *)st;
-(TWMove *)getPreviousMove;
-(TWState *)getPreviousState;
-(DiskStack *)getPeg1;
-(DiskStack *)getPeg2;
-(DiskStack *)getPeg3;
-(TWState *)getNextStateWithMove:(TWMove *)move;
-(id)initWithPeg1:(DiskStack *)_peg1 peg2:(DiskStack *)_peg2 peg3:(DiskStack *)_peg3;
-(void)printState;
@end
