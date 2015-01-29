//
//  DiskStack.h
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import "TWStack.h"
#import "Disk.h"
@interface DiskStack : TWStack <NSCopying>{
    
}
-(BOOL)push:(Disk *)item;
-(Disk *)pop;
-(Disk *)peek;
-(int)getDisksCount; //Returns the number of disks
-(void)setStack:(NSMutableArray *)stck; 
-(BOOL)isEqualToStack:(DiskStack *)other; //Checks equality between two DiskStacks
-(NSMutableArray *)getStack; //Returns the underlying NSMutableArray behind the stack
@end
