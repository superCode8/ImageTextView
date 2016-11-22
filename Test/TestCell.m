//
//  TestCell.m
//  JIEKE
//
//  Created by superCode on 15/8/28.
//  Copyright (c) 2015年 superCode. All rights reserved.
//

#import "TestCell.h"
#import "CustomView.h"

#warning mark - 以下的宏要跟statusFrame类的宏保持一致（因为，statusFrame通过这些数据计算cell高度）
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define CustomViewWidth 50
#define CustomViewHeight 70
#define Padding 10

@interface TestCell ()

@property(nonatomic,copy)NSMutableArray *marr;

@end

@implementation TestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier subViewCount:(NSInteger)subViewCount
{
    if (self=[super init]) {
        
        _marr = [NSMutableArray new];
        //外部提供子视图的个数
        
        //行数计算
        //行数 = 个数/一行个数 + (个数%一行个数 > 0 ? 1:0) ， 算法: 先取商，再求余，余数大于0则为1，否则为0，相加则为行数
        
        
        //列数计算
        //最后一行的列数 = 个数-(行数-1)*一行个数
        
#pragma mark - 计算需要的行数
        //一行的最多个数
        NSInteger rowMaxNum = (NSInteger)(ScreenWidth - Padding)/(CustomViewWidth + Padding);
        //行数
        NSInteger rowNum = subViewCount/rowMaxNum + (subViewCount%rowMaxNum > 0?1:0);
        
#pragma mark - 把每一行需要多少列数计算出来，放入数组中
        //每行的列数
        NSMutableArray *lineArr = [NSMutableArray new];
        //最后一行的列数
        NSInteger lastLineNum = subViewCount - (rowNum - 1) * rowMaxNum;
        NSNumber *lastLineNumNumber = [NSNumber numberWithInteger:lastLineNum];
        NSNumber *rowMaxNumNumber = [NSNumber numberWithInteger:rowMaxNum];
        //行数数组
        for (NSInteger i = 0; i < rowNum - 1; i++) {
            
            [lineArr addObject:rowMaxNumNumber];
        }
        [lineArr addObject:lastLineNumNumber];
        
#pragma mark - 根据行数，列数数组布局控件
        for (NSInteger i = 0; i < rowNum; i++) {
            
            NSInteger perLineNum = [lineArr[i] integerValue];
            for (NSInteger j = 0; j < perLineNum; j++) {
                
                CustomView *customView = [[CustomView alloc]initWithFrame:CGRectMake(Padding+ (CustomViewWidth+Padding)*j, (CustomViewHeight+Padding)*i, CustomViewWidth, CustomViewHeight)];
                [self.contentView addSubview:customView];
                [_marr addObject:customView];
                customView.tag = _marr.count;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_tapCustomView:)];
                [customView addGestureRecognizer:tap];
                
                
            }
        }
        
    }
    return self;
}

- (void)_tapCustomView:(UITapGestureRecognizer*)tap
{
    if ([self.delegate respondsToSelector:@selector(testCell:didSelectCustomViewInCell:)]) {
        [self.delegate testCell:self didSelectCustomViewInCell:(CustomView*)tap.view];
    }
}

- (void)setImageArr:(NSArray *)imageArr
{
    for (NSInteger i = 0; i < imageArr.count; i++) {
        
        CustomView *customView = _marr[i];
        customView.imageUrl = imageArr[i];
    }
}

- (void)setTextArr:(NSArray *)textArr
{
    for (NSInteger i = 0; i < textArr.count; i++) {
        
        CustomView *customView = _marr[i];
        customView.text = textArr[i];
    }
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
