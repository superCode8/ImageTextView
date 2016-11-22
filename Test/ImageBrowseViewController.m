//
//  ImageBrowseViewController.m
//  ImageTextCell
//
//  Created by superCode on 16/11/7.
//  Copyright © 2016年 superCode. All rights reserved.
//

#import "ImageBrowseViewController.h"
#import "UIImageView+WebCache.h"

@interface ImageBrowseViewController ()

@end

@implementation ImageBrowseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    UIImageView *imageV = [UIImageView new];
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    imageV.userInteractionEnabled = YES;
    imageV.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:imageV];
    [imageV sd_setImageWithURL:[NSURL URLWithString:_imageUrl] placeholderImage:[UIImage imageNamed:@"placehold"] options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        ;
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:^{
        ;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
