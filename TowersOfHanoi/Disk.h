//
//  Disk.h
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
@interface Disk : SKSpriteNode <NSCopying>{
    int diskSize; //1-10 describing the scale of the disk
    int diskNumber; //Describes the disk order that originally occurs on the peg
    NSObject *pegParent; //Set it to NSObject due to compiling issues
}
-(id)initWithSize:(int)s withNumber:(int)n;
-(int)getDiskNum;   //Returns the size/number of the peg
-(NSObject *)getPegParent;  //Returns the parent peg
-(void)setPegParent:(NSObject *)obj; //Set the parent peg
-(void)shake; //Causes the disk to do a shake animation
@end
