//
//  Disk.m
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import "Disk.h"

@implementation Disk
#define ARC4RANDOM_MAX      0x100000000
-(id)init{
    self=[super initWithImageNamed:@"disk.png"];
    self.size=CGSizeMake(50, 50);
    return self;
}
-(id)initWithSize:(int)s withNumber:(int)n {
    self=[super initWithImageNamed:@"disk.png"];
    self.anchorPoint=CGPointMake(0.5, 0.5);
    self.size=CGSizeMake(40+(s*10), 20);
    
    diskSize=s;
    diskNumber=n;
    [self setColor:[SKColor colorWithRed:(double)arc4random()/ARC4RANDOM_MAX green:(double)arc4random()/ARC4RANDOM_MAX blue:(double)arc4random()/ARC4RANDOM_MAX alpha:1.0]]; //Sets a random color for the peg
    [self setColorBlendFactor:1.0];
    return self;
    
}
-(int)getDiskNum{
    return diskNumber;
}
-(NSObject *)getPegParent{
    return pegParent;
}
- (id)copyWithZone:(NSZone *)zone
{
    Disk *copy = [[[self class] alloc] initWithSize:[self getDiskNum] withNumber:[self getDiskNum]];
    copy.position=self.position;
    return copy;
}
-(void)setPegParent:(NSObject *)obj{
    pegParent=obj;
}
- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    if (diskNumber!=[(Disk *)other getDiskNum]) {
        return false;
    }
    return true;
}
- (NSUInteger)hash {
    NSUInteger hash = 0;
    return hash;
}
-(void)shake{
    [self runAction:[SKAction sequence:@[[SKAction moveByX:-5 y:0 duration:0.1],[SKAction moveByX:10 y:0 duration:0.05],[SKAction moveByX:-10 y:0 duration:.05],[SKAction moveByX:10 y:0 duration:.05],[SKAction moveByX:-5 y:0 duration:.05]]]];
}

@end
