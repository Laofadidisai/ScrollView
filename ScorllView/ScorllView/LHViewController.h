//
//  LHViewController.h
//  ScorllView
//
//  Created by 老李 on 15-10-28.
//  Copyright (c) 2015年 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView * myscrollView;
    UIImageView * leftImageView;
    UIImageView * centerImageView;
    UIImageView * rightImageView;
    
    UIPageControl * pageControll;
    
    NSMutableArray * imageArray;
    
    //当前图片的索引
    int imageIndex;
    
    // 图片总数
    int imageCount;
    
}
@end
