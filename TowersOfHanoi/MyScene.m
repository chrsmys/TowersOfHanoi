//
//  MyScene.m
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import "MyScene.h"
#import "TWState.h"
#import "TWSolver.h"
@implementation MyScene
extern int diskCount;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor=[UIColor blueColor];
        
        SKLabelNode *touchForAutoSolveLabel=[[SKLabelNode alloc] init];
        touchForAutoSolveLabel.position=CGPointMake(self.frame.size.width/2, self.frame.size.height-30);
    
        touchForAutoSolveLabel.text=@"Touch Me For AutoSolve";
        [self addChild:touchForAutoSolveLabel];
        
        /**
         
            Initialize pegs and set attributes then add it
            to the scene
         */
        
        
        peg1 = [[Peg alloc] init];
        peg2 = [[Peg alloc] init];
        peg3 = [[Peg alloc] init];
        peg1.position=CGPointMake(75, peg1.size.height/2);
        peg2.position=CGPointMake(250, peg2.size.height/2);
        peg3.position=CGPointMake(450, peg3.size.height/2);
        
        peg1.name=@"peg1";
        peg2.name=@"peg2";
        peg3.name=@"peg3";
       
        pegArray=@[peg1,peg2,peg3];
        
        [self addChild:peg1];
        [self addChild:peg2];
        [self addChild:peg3];
        
        
        
        /*
            Loop through and add the disks to the 
            screen
         */
        
        for (int i=diskCount; i>0; i--) {
            
            Disk *d=[[Disk alloc] initWithSize:i withNumber:i];
            d.position=CGPointMake(200, 170);
            d.position=CGPointMake(peg1.position.x, (peg1.position.y-60)+(20*(diskCount-i)));
            [peg1 addDisk:d];
            
            [self addChild:d];
            
        }
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if([node isKindOfClass:[Disk class]]){ //If the disks on the peg are pressed pretend the peg got pressed
        node=(SKNode *)[((Disk *)node) getPegParent];
    }
    if([node isKindOfClass:[peg1 class]]){ //If the peg is pressed
        Peg *touchedPeg=(Peg *)node;
        
        /**
            These if statements check to see if a peg other than the one that is 
            active has been pressed.
            If there is one that is active and a different peg was tapped the disk moves to the tapped
            peg
         
            Note: Active means that a disk is floating above the active peg
         
         
         */
        BOOL touchedOtherPeg=false;
        
        for (Peg *p in pegArray) {
            if([p topDiskIsActive] && ![p.name isEqualToString:touchedPeg.name]){
                [touchedPeg addDisk:[p getTopDisk] fromPeg:p];
                touchedOtherPeg=true;
            }
        }
        if(!touchedOtherPeg){
            [touchedPeg setTopDiskActive];
        }
        
        /*if([peg1 topDiskIsActive] && peg1!=touchedPeg){
            [touchedPeg addDisk:[peg1 getTopDisk] fromPeg:peg1];
        }else if([peg2 topDiskIsActive] && peg2!=touchedPeg){
            [touchedPeg addDisk:[peg2 getTopDisk] fromPeg:peg2];
        }else if([peg3 topDiskIsActive] && peg3!=touchedPeg){
            [touchedPeg addDisk:[peg3 getTopDisk] fromPeg:peg3];
        }else{
            [touchedPeg setTopDiskActive];
        }*/
    }else{ //If the background was tapped then do autosolve
    
        if(currentSolveStack==NULL){
            
            TWState *currentState=[[TWState alloc] initWithPeg1:[[peg1 getDiskStack] copy] peg2:[[peg2 getDiskStack] copy] peg3:[[peg3 getDiskStack] copy]];
            TWSolver *solve=[[TWSolver alloc] initWithState:currentState];
            currentSolveStack =[solve startSolving];
   
            [self animateNextSolveMove];
        }
    }
    
    
}
/**
    Recursively calls itself until all animations are performed
 */
-(void)animateNextSolveMove{
    
    if(currentSolveStack!=NULL && [currentSolveStack getCount]>0){
        
        TWMove *move=(TWMove *)[currentSolveStack pop];
        
        Peg *fromPeg=[self getFromPegForMove:move];
        Peg *toPeg=[self getToPegForMove:move];
        
        [toPeg addDisk:[fromPeg getTopDisk] fromPeg:fromPeg];
        [self performSelector:@selector(animateNextSolveMove) withObject:NULL afterDelay:1.5];
   
    }else{
        currentSolveStack=NULL;
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

#pragma mark Helper Methods

/*
    Gets the peg "move" is referencing that the disk
    will move to
 */
-(Peg *)getToPegForMove:(TWMove *)move{
   
    Peg *toPeg;
    
    for (Peg *peg in pegArray){
        if ([[move getToPeg] isEqualToString:peg.name]) {
            toPeg=peg;
        }
    }
    
    return toPeg;
}

/*
    Gets the peg "move" is referencing that the top disk
    will move from
 */
-(Peg *)getFromPegForMove:(TWMove *)move{
    
    Peg *fromPeg;
    
    
    for (Peg *peg in pegArray){
        if ([[move getFromPeg] isEqualToString:peg.name]) {
            fromPeg=peg;
        }
    }
    
    return fromPeg;
}

@end
