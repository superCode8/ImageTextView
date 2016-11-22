//
//  StatusFrame.m
//  JIEKE
//
//  Created by superCode on 15/8/28.
//  Copyright (c) 2015年 superCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusFrame.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define CustomViewWidth 50
#define CustomViewHeight 70
#define Padding 10

@implementation StatusFrame

- (instancetype)initWithCount:(NSInteger)count
{
   if (self = [super init]) {
        
#pragma mark - 计算需要的行数
        //一行的最多个数
        NSInteger rowMaxNum = (NSInteger)(ScreenWidth - Padding)/(CustomViewWidth + Padding);
        
        //行数
        NSInteger rowNum = count/rowMaxNum + (count%rowMaxNum > 0?1:0);
       
       _cellHeight = rowNum * CustomViewHeight + Padding;
       
    }
    return self;
}



@end
