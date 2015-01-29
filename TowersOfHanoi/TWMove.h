//
//  TWMove.h
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/9/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWMove : NSObject{
    NSString *moveFrom;
    NSString *moveTo;
}
-(NSString *)getFromPeg;
-(NSString *)getToPeg;
-(id)initWithMoveFrom:(NSString *)mf moveTo:(NSString *)mt;
@end
