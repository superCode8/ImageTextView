//
//  TestCell.h
//  JIEKE
//
//  Created by superCode on 15/8/28.
//  Copyright (c) 2015年 superCode. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomView;
@class TestCell;
@protocol TestCellDelegate <NSObject>
@optional
- (void)testCell:(TestCell*)cell didSelectCustomViewInCell:(CustomView*)customView;
@end
@interface TestCell : UITableViewCell
@property(nonatomic,copy)NSArray *imageArr;
@property(nonatomic,copy)NSArray *textArr;
@property(nonatomic,weak) id<TestCellDelegate> delegate;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier subViewCount:(NSInteger)subViewCount;
@end


