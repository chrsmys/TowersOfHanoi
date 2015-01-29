//
//  TWSolver.m
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/9/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//
//  TWSolver Manages all autosolve activities
//

#import "TWSolver.h"
#import "TWState.h"
@implementation TWSolver
extern int diskCount;

/*
    Create an Initial state for the solver to
    Begin solving from
*/
- (id)initWithState:(TWState *)st{
    self=[super init];
    NSLog(@"diskCount %d", diskCount);
    stateQueue=[[Queue alloc] init];
    [stateQueue add:st];
    
    return self;
}

- (TWStack *)startSolving{
    
    BOOL solved=false;
    
    TWState *finalState;
   
    NSArray *moveArray=[self getPossibileMoves];
    
    while (![stateQueue isEmpty] && solved==false ) {
        
        TWState *currentState=(TWState *)[stateQueue remove];
        if([[currentState getPeg3] getDisksCount]==diskCount){
            
            //Games is solved
            solved=true;
            finalState=currentState;
            
        }
        
        /*
             Get the next state and add it to the queue if possible
             don't add it to the queue if it already exists in the
             queue
         */
        for( int i=0; i<[moveArray count]; i++){
            TWState *nextState;
            TWMove *currentMove=(TWMove *)[moveArray objectAtIndex:i];
            nextState=[currentState getNextStateWithMove:currentMove];
            
            if(nextState!=NULL){
                
                if (![[stateQueue getQueue] containsObject:nextState]) {
                    
                    [stateQueue add:nextState];
                
                }
                
            }
        }
        
    }
    
    TWStack *returnStack=[self createStackFromPreviousStatesOfState:finalState];
    return returnStack;

}

-(TWStack *)createStackFromPreviousStatesOfState:(TWState *)finalState{

    TWStack *returnStack=[[TWStack alloc] init]; //Stack that holds all moves
    
    TWState *nextState=finalState;
    
    //Create stack of moves
    while ([nextState getPreviousMove]!=NULL) {
        
        [returnStack push:[nextState getPreviousMove]];
        
        nextState=[nextState getPreviousState];
        
    }

    return returnStack;
}

/*
 Create All Possible Moves
 from:p1 to:p2
 from:p1 to:p3
 from:p2 to:p1
 from:p2 to:p3
 from:p3 to:p1
 from:p3 to:p2
 */
- (NSArray *)getPossibileMoves{
    TWMove *move  = [[TWMove alloc] initWithMoveFrom:@"peg1" moveTo:@"peg2"];
    TWMove *move1 = [[TWMove alloc] initWithMoveFrom:@"peg1" moveTo:@"peg3"];
    TWMove *move2 = [[TWMove alloc] initWithMoveFrom:@"peg2" moveTo:@"peg1"];
    TWMove *move3 = [[TWMove alloc] initWithMoveFrom:@"peg2" moveTo:@"peg3"];
    TWMove *move4 = [[TWMove alloc] initWithMoveFrom:@"peg3" moveTo:@"peg1"];
    TWMove *move5 = [[TWMove alloc] initWithMoveFrom:@"peg3" moveTo:@"peg2"];
    
    NSArray *moveArray=@[move,move1,move2,move3,move4,move5];
    
    return moveArray;
}



@end
