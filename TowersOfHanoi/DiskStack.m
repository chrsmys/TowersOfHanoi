//
//  DiskStack.m
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import "DiskStack.h"

@implementation DiskStack
-(BOOL)push:(Disk *)item{
    return [super push:item];
    
}
-(Disk *)pop{
    return (Disk *)[super pop];
}
-(Disk *)peek{
    return (Disk *)[super peek];
}
-(int)getDisksCount{
    return [stack count];
}
-(void)setStack:(NSMutableArray *)stck{
    stack=stck;
}

/**
    Conforms to NSCopying
    Used when copying the stack 
    when a new state is created

 */

- (id)copyWithZone:(NSZone *)zone
{
    DiskStack *copy = [[[self class] alloc] init];
    [copy setStack:[[NSMutableArray alloc] initWithArray:stack copyItems:YES]];
    return copy;
}
/**
    Override is equal to check for true equality and not just
    the same object in memory
 
 */
- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToStack:(DiskStack *)other];
}
-(NSMutableArray *)getStack{
    return stack;
}
-(BOOL)isEqualToStack:(DiskStack *)other{
    if([self getDisksCount]!=[other getDisksCount] ){
        return false;
    }
    for (int i=0;i<[self getDisksCount]; i++ ){
        if(![[stack objectAtIndex:i] isEqual:[[other getStack] objectAtIndex:i]]){
            return false;
        }
    }
    return true;
}
/*
    Not the best implementation of hash but it works for now
    
    Remember: If you override isEqual then you must override hash
 
 */
- (NSUInteger)hash {
    NSUInteger hash = 0;
    return hash;
}

@end
