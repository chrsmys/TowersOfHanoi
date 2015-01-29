//
//  TWState.m
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//
//  TWState Can Represent any Legal Move in the Game
//


#import "TWState.h"
#import "Disk.h"
@implementation TWState

-(id)initWithPeg1:(DiskStack *)_peg1 peg2:(DiskStack *)_peg2 peg3:(DiskStack *)_peg3{
    self =[super init];
    
    peg1=_peg1;
    peg2=_peg2;
    peg3=_peg3;
    
    return self; 
}


#pragma mark - Setter Methods

-(void)setPreviousMove:(TWMove *)mv{
    previousMove=mv;
}

-(void)setPreviousState:(TWState *)st{
    previousState=st;
}


#pragma mark Getter Methods

-(TWState *)getNextStateWithMove:(TWMove *)move{
    
    TWState *state=[[TWState alloc] initWithPeg1:[peg1 copy] peg2:[peg2 copy] peg3:[peg3 copy]];
    
    DiskStack *fromPeg = [state getFromPegForMove:move];
    DiskStack *toPeg = [state getToPegForMove:move];
    
    // This move is not valid because it is redundant
    if(toPeg==fromPeg){
        state=NULL;
    }
    //  This move is invalid, a peg with no disk can not
    //  move a disk from
    else if([fromPeg peek]==NULL){
        state=NULL;
    }
    else if ([toPeg peek]==NULL || [[fromPeg peek] getDiskNum]<[[toPeg peek] getDiskNum]) {
        Disk *d=[fromPeg peek];
        [fromPeg pop];
        [toPeg push:d];
        [state setPreviousMove:move];
        [state setPreviousState:self];
        return state;
    }
    
    return state;
}

-(DiskStack *)getPeg1{
    return peg1;
}

-(DiskStack *)getPeg2{
    return peg2;
}

-(DiskStack *)getPeg3{
    return peg3;
}

/*
 Returns the move that got to this states
 */
-(TWMove *)getPreviousMove{
    return previousMove;
}

/*
 Returns the state before this state
 */
-(TWState *)getPreviousState{
    return previousState;
}

#pragma mark isEqual Overrides

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [[self getPeg1] isEqual:[other getPeg1]] &&[[self getPeg2] isEqual:[other getPeg2]] && [[self getPeg3] isEqual:[other getPeg3]];
}

- (NSUInteger)hash {
    NSUInteger hash = 0;
    return hash;
}

#pragma mark HelperMethods

/*
    Returns a reference to the from peg for
    "move"
 */
-(DiskStack *)getFromPegForMove:(TWMove *)move{
    DiskStack *fromPeg;
    if([[move getFromPeg] isEqualToString:@"peg1"]){
        fromPeg=self.getPeg1;
    }else if([[move getFromPeg] isEqualToString:@"peg2"]){
        fromPeg=self.getPeg2;
    }
    else { //peg3
        fromPeg=self.getPeg3;
    }
    return fromPeg;
}

/*
    Returns a reference to the toPeg for
    "move"
 */
-(DiskStack *)getToPegForMove:(TWMove *)move{
    DiskStack *toPeg;
    if([[move getToPeg] isEqualToString:@"peg1"]){
        toPeg=self.getPeg1;
    }else if([[move getToPeg] isEqualToString:@"peg2"]){
        toPeg=self.getPeg2;
    }
    else { //peg3
        toPeg=self.getPeg3;
    }
    return toPeg;
}

-(void)printState{
    NSLog(@"Peg 1: %d", [peg1 getDisksCount]);
    NSLog(@"Peg 2: %d", [peg2 getDisksCount]);
    NSLog(@"Peg 3: %d", [peg3 getDisksCount]);
    
    
}

@end
