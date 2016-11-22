//
//  GoodsDetailViewController.m
//  JIEKE
//
//  Created by superCode on 15/9/4.
//  Copyright (c) 2015年 superCode. All rights reserved.
//



#import "GoodsDetailViewController.h"
#import "ImageBrowseViewController.h"
#import "TestCell.h"
#import "StatusFrame.h"
#import "CustomView.h"

@interface GoodsDetailViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,TestCellDelegate>
{
    UITableView *_tableView;
}
@end

@implementation GoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //表视图
    _tableView = [[UITableView alloc]init];
    _tableView.frame = self.view.frame;
    [self.view addSubview:_tableView];
    //去掉表视图多余分割线
    _tableView.tableFooterView = [UIView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollsToTop = NO;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[TestCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId subViewCount:7];
        cell.imageArr = @[@"http://pic33.nipic.com/20130916/3420027_192919547000_2.jpg",
                          @"http://thumbnail.xixingsoft.com/2016/9/30/e2e849a5-986a-4b73-a082-941149fed25d.png@120w_120h_1e_1c",
                          @"http://imgsrc.baidu.com/forum/pic/item/faf2b2119313b07e414cbe890cd7912396dd8cba.jpg",
                          @"http://thumbnail.xixingsoft.com/2016/09/28/5IRU22dtA8.jpg@120w_120h_1e_1c",
                          @"http://thumbnail.xixingsoft.com/2016/09/28/Nyb0rusTy6.jpg@500w",
                          @"http://thumbnail.xixingsoft.com/2016/10/8/a1a516f2-fbc1-436e-8bba-647f5aebf6f0.jpg@120w_120h_1e_1c",
                          @"http://thumbnail.xixingsoft.com/2016/10/8/63ba7e6d-3c14-4f82-a3d9-2e27696e0385.jpg@120w_120h_1e_1c"];
        cell.textArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    }
    cell.delegate = self;
    return cell;
}

//设置cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusFrame *frame = [[StatusFrame alloc]initWithCount:7];
    return frame.cellHeight;
}

//点击单元格，不会变暗，同时单元格点击事件也是要在这里写
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

//TestCellDelegate代理方法
//选中cell上的图文回调
- (void)testCell:(TestCell *)cell didSelectCustomViewInCell:(CustomView *)customView
{
    NSLog(@"---选中第%ld个customView---",customView.tag);
    NSLog(@"---选中图片链接---%@，文字---%@---",customView.imageUrl,customView.text);
    ImageBrowseViewController *vc = [ImageBrowseViewController new];
    vc.imageUrl = customView.imageUrl;
    [self presentViewController:vc animated:YES completion:nil];
    
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
