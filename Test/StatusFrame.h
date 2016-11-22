//
//  StatusFrame.h
//  JIEKE
//
//  Created by superCode on 15/8/28.
//  Copyright (c) 2015年 superCode. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface StatusFrame : NSObject
//用于计算cell高度
@property(nonatomic,assign)NSInteger cellHeight;
//model计算行高
- (instancetype)initWithCount:(NSInteger)count;

@end
