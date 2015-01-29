//
//  TWStack.m
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import "TWStack.h"

@implementation TWStack
-(id)init{
    self=[super init];
    stack=[[NSMutableArray alloc] init];
    return self;
}
-(BOOL)push:(NSObject *)item{
    [stack insertObject:item atIndex:0];
    return true;
}
-(NSObject *)pop{
    if(![self isEmpty]){
        NSObject *object=[stack objectAtIndex:0];
        [stack removeObjectAtIndex:0];
        return object;
    }else{
        return  NULL;
    }
}
-(NSObject *)peek{
    if(![self isEmpty]){
        return [stack objectAtIndex:0];
    }else{
        return NULL;
    }
}
-(BOOL)isEmpty{
    return [stack count]==0;
}
-(int)getCount{
    return [stack count];
}

@end
