//
//  CustomView.m
//  JIEKE
//
//  Created by superCode on 15/8/28.
//  Copyright (c) 2015年 superCode. All rights reserved.
//

#import "CustomView.h"
#import "UIImageView+WebCache.h"

@interface CustomView ()

@property(nonatomic,weak)UIImageView *imageView;
@property(nonatomic,weak)UILabel *label;

@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    //自身加imageView，label，imageView占七成，空一行占一成，label占最后两成
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat viewHeight = CGRectGetHeight(self.bounds);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), viewHeight*0.7f)];
        [self addSubview:imageView];
        _imageView = imageView;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, viewHeight*0.8f, CGRectGetWidth(self.bounds), viewHeight*0.2f)];
        [self addSubview:label];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        _label = label;
        
    }
    return self;
   
    
}

- (void)setImageUrl:(NSString *)imageUrl
{
    _imageUrl = imageUrl;
    NSURL *url = [NSURL URLWithString:imageUrl];
    [_imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placehold"] options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        ;
    }];
    
}

- (void)setText:(NSString *)text
{
    _text = text;
    _label.text = text;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


@end
