//
//  MyScene.h
//  TowersOfHanoi
//

//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Peg.h"
#import "Disk.h"
#import "TWStack.h"
@interface MyScene : SKScene{
    Peg *peg1;  //Left most peg
    Peg *peg2;  //Middle most peg
    Peg *peg3;  //Right most peg
    NSArray *pegArray;
    TWStack *currentSolveStack; //Stack that holds the current solution Does not hold anything until solve is pressed
}

@end
