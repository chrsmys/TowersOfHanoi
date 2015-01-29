//
//  Peg.m
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import "Peg.h"

@implementation Peg
float animationSpeed=0.5;

-(id)init{
    self=[super initWithImageNamed:@"peg.png"];
    stack=[[DiskStack alloc] init];
    //self.size=CGSizeMake(70, 70);
    topDiskActive=false;
    //self.color=[UIColor greenColor];
    //self.colorBlendFactor=1;
    return self;
}
-(BOOL)addDisk:(Disk *)disk fromPeg:(Peg *)p{
    
        NSLog(@"doin it");
        
        if([self getTopDisk]==NULL || [[self getTopDisk] getDiskNum]>disk.getDiskNum){
        if([p removeDisk]){
            
            
            if([p topDiskIsActive]){
                 [disk runAction:[SKAction sequence:@[ [SKAction moveTo:CGPointMake(self.position.x, p.position.y+p.size.height/2) duration:animationSpeed], [SKAction moveTo:CGPointMake(self.position.x, (self.position.y-60)+(20*[stack getDisksCount])) duration:animationSpeed]]]];
            }else{
            [disk runAction:[SKAction sequence:@[[SKAction moveTo:CGPointMake(disk.position.x, p.position.y+p.size.height/2) duration:animationSpeed], [SKAction moveTo:CGPointMake(self.position.x, p.position.y+p.size.height/2+40
                                                                                                                                                                                    ) duration:animationSpeed], [SKAction moveTo:CGPointMake(self.position.x, (self.position.y-60)+(20*[stack getDisksCount])) duration:animationSpeed]]]];
            }
            
            [p setTopDiskActive:false];

        
        NSLog(@"%d", [stack getDisksCount]);
        [self addDisk:disk];
            
       // disk.position=CGPointMake(200, 170);
        
        
        
        //disk.position=CGPointMake(p.position.x, (p.position.y-20)+(11*(diskCount-i)));
        return true;
        }else{
            return false;
        }
    }else{
        [disk shake];
     return false;
    }
}
-(BOOL)addDisk:(Disk *)disk{
    NSLog(@"Adding the didsk");
    [disk setPegParent:self];
    return [stack push:disk];
}
-(BOOL)hasPegs{
    return ![stack isEmpty];
}
-(bool)removeDisk{
    if (![stack isEmpty]) {
        [stack pop];
        return true;
    }else{
        return false;
    }
}
-(Disk *)getTopDisk{
    if(![stack isEmpty]){
        return [stack peek];
    }
    return NULL;
}
-(BOOL)setTopDiskActive{
    if([stack isEmpty]){
        NSLog(@"stck empty");
        return false;
    }
    if(topDiskActive){
        NSLog(@"doin this");
        topDiskActive=false;
        [[stack peek] runAction:[SKAction moveTo:CGPointMake(self.position.x, (self.position.y-60)+(20*([stack getDisksCount]-1))) duration:animationSpeed]];
    }else{
        NSLog(@"setting top disk to true");
        [(Disk *)[stack peek] runAction:[SKAction sequence:@[[SKAction moveTo:CGPointMake(((Disk *)[stack peek]).position.x, self.position.y+self.size.height/2) duration:animationSpeed]]]];
        topDiskActive=true;
    }
    
    return true;
}
-(BOOL)topDiskIsActive{
    return topDiskActive;
}
-(void)setTopDiskActive:(BOOL)active{
    topDiskActive=active;
}
-(int)getDiskCount{
    return [stack getDisksCount];
}
-(DiskStack *)getDiskStack{
    return stack;
}


@end
