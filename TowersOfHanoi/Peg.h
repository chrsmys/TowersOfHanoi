//
//  Peg.h
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "DiskStack.h"
#import "Disk.h"
@interface Peg : SKSpriteNode
{
    NSString *pegLabel;
    int pegOrder;
    DiskStack *stack;
    BOOL topDiskActive;
}
-(BOOL)addDisk:(Disk *)disk; //Adds the disk to the disk stack
-(int)getDiskCount; //Returns the current number of disks in the stack
-(bool)removeDisk; //Removes the disk from the stack
-(BOOL)addDisk:(Disk *)disk fromPeg:(Peg *)p; //Animates the dis moving from the p peg to self peg calls addDisk:
-(Disk *)getTopDisk; //Returns the topDisk on the stack
-(DiskStack *)getDiskStack; //Returns the underlying stack
-(BOOL)setTopDiskActive; //Sets the top disk to active and animates the disk above the peg
-(BOOL)topDiskIsActive; //returns whether the top disk is active
-(void)setTopDiskActive:(BOOL)active; //Sets whether the top disk is active
@end

