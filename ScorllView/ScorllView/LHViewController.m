//
//  LHViewController.m
//  ScorllView
//
//  Created by 老李 on 15-10-28.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import "LHViewController.h"

@interface LHViewController ()

@end

@implementation LHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self loadImageData];
    [self addScrollView];
    [self addImageView];
    [self setDefaultImage];
    [self addPageControl];
    
    
    
    
}
#pragma mark 加载图片数据
-(void)loadImageData
{
    
    // 图片数组 存入图片
    imageArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i<11; i++) {
        NSString * imageName = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage * image = [UIImage imageNamed:imageName];
        [imageArray addObject:image];
    }
    
    //图片数
    imageCount = imageArray.count;
    
}
#pragma mark 添加控件
-(void)addScrollView
{
    
    // 添加滚动视图
    myscrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:myscrollView];
    
    myscrollView.delegate = self;
    
    myscrollView.contentSize = CGSizeMake(imageCount * 320, 480);
    
    [myscrollView setContentOffset:CGPointMake(320, 0) animated:NO];
    myscrollView.pagingEnabled = YES;
    myscrollView.showsHorizontalScrollIndicator = NO;
    
}
#pragma mark 添加图片的三个控件
-(void)addImageView
{
    
    // 添加图片视图
    leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [myscrollView addSubview:leftImageView];
    
    centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(320, 0, 320, 480)];
    centerImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [myscrollView addSubview:centerImageView];
    
    rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(2*320, 0, 320, 480)];
    rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [myscrollView addSubview:rightImageView];
    
    
}
#pragma mark 设置默认显示图片
-(void)setDefaultImage
{
    leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",imageCount - 1]];
    centerImageView.image = [UIImage imageNamed:@"0"];
    rightImageView.image = [UIImage imageNamed:@"1"];
    
    imageIndex = 0;
    pageControll.currentPage = imageIndex;
    
}
#pragma mark 添加分页控件
-(void)addPageControl
{
    // 添加分页控件
    pageControll = [[UIPageControl alloc]init];
    
    //注意此方法，可以根据页数返回 UIPageControl 合适的大小
    CGSize size = [pageControll sizeForNumberOfPages:imageCount];
    
    pageControll.bounds = CGRectMake(0, 0, size.width, size.height);
    pageControll.center = CGPointMake(160, 380);
    
    pageControll.pageIndicatorTintColor = [UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1.0];
    
    pageControll.currentPageIndicatorTintColor = [UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1.0];
    
    pageControll.numberOfPages = imageCount;
    [self.view addSubview:pageControll];
    
    
    
}
// 滚动视图停止事件
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    [self reloadImage];
    
    [scrollView setContentOffset:CGPointMake(320, 0) animated:NO];
    
    pageControll.currentPage = imageIndex;
    
}
-(void)reloadImage
{
    
    int leftImageIndex,rightImageIndex;
    
    CGPoint offset = [myscrollView contentOffset];
    
    if (offset.x > 320)// 向左滑动
    {
        imageIndex = (imageIndex + 1)% imageCount;
    }
    else if(offset.x <320)// 向右滑动
    {
        imageIndex = (imageIndex + imageCount - 1)% imageCount;
    }
    
    centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",imageIndex]];
    
    leftImageIndex = (imageIndex + imageCount - 1)% imageCount;
    
    rightImageIndex = (imageIndex + 1)%imageCount;
    
    leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",leftImageIndex]];
    rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",rightImageIndex]];
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
