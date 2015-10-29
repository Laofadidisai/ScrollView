//
//  CustomImgView.h
//  Test
//

#import <UIKit/UIKit.h>

//自定义类，添加一个属性，只为了代替tag值进行标记；
@interface CustomImgView : UIImageView
{
    //添加BOOL类型的属性isUsed ；
    //isUsed == NO,表示雪花在屏幕外；表示可以重用
    //isUsed == YES,表示雪花在屏幕中；，表示正在使用中
    BOOL  isUsed ;
}
@property BOOL isUsed ;
@end










