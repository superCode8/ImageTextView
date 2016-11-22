//
//  ImageTextCellTests.m
//  ImageTextCellTests
//
//  Created by superCode on 16/11/7.
//  Copyright © 2016年 superCode. All rights reserved.
//

#import <XCTest/XCTest.h>
//#import "UIImageView+WebCache.h"

@interface ImageTextCellTests : XCTestCase
{
@private
    NSArray *_imageUrl;
    UIImageView *_imageV;
}
@end

@implementation ImageTextCellTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _imageUrl =
    @[@"http://pic33.nipic.com/20130916/3420027_192919547000_2.jpg",
      @"http://thumbnail.xixingsoft.com/2016/9/30/e2e849a5-986a-4b73-a082-941149fed25d.png@120w_120h_1e_1c",
      @"http://imgsrc.baidu.com/forum/pic/item/faf2b2119313b07e414cbe890cd7912396dd8cba.jpg",
      @"http://thumbnail.xixingsoft.com/2016/09/28/5IRU22dtA8.jpg@120w_120h_1e_1c",
      @"http://thumbnail.xixingsoft.com/2016/09/28/Nyb0rusTy6.jpg@500w",
      @"http://thumbnail.xixingsoft.com/2016/10/8/a1a516f2-fbc1-436e-8bba-647f5aebf6f0.jpg@120w_120h_1e_1c",
      @"http://thumbnail.xixingsoft.com/2016/10/8/63ba7e6d-3c14-4f82-a3d9-2e27696e0385.jpg@120w_120h_1e_1c"];
    
    _imageV = [UIImageView new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample {
//    // This is an example of a functional test case.
//    // Use XCTAssert and related functions to verify your tests produce the correct results.
//}

- (void)testImageUrlValid
{
//    for (NSString *urlstr in _imageUrl) {
//        NSURL *url = [NSURL URLWithString:urlstr];
//        [_imageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placehold"] options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            XCTAssertNotNil(image,[NSString stringWithFormat:@"无效的图片链接%@",urlstr]);
//        }];
//    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
