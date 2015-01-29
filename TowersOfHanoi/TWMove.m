//
//  TWMove.m
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/9/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//
//  TWMove is an object to represent a potential
//  move that can be played in the game. It keeps
//  track of moves
//
//

#import "TWMove.h"

@implementation TWMove

-(id)initWithMoveFrom:(NSString *)mf moveTo:(NSString *)mt{
    self=[super init];
    
    moveFrom=mf;
    moveTo=mt;
    
    return self;
}

/*
    The peg the Disk will move from
*/
-(NSString *)getFromPeg{
    return moveFrom;
}

/*
    The peg the Disk will move to
*/
-(NSString *)getToPeg{
    return moveTo;
}
@end
