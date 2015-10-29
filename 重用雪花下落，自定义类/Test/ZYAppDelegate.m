//Mr.Wang 2015.10.9
#import "ZYAppDelegate.h"
#import "CustomImgView.h"
@implementation ZYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    [self.window makeKeyAndVisible];
    
    //存放雪花
    _snowArray = [[NSMutableArray alloc]init];
    for (int i=0; i<100; i++)
    {
        CustomImgView * snowView = [[CustomImgView alloc]init];
        snowView.frame = CGRectMake(arc4random()%320,-40 , 40, 40);
        //最开始在屏幕外面，还没有使用
        snowView.isUsed = NO;
        snowView.image = [UIImage imageNamed:@"flake"];
        [self.window addSubview:snowView];
        [_snowArray addObject:snowView];
    }
    //启动定时器控制雪花状态更改
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(findSnow) userInfo:nil repeats:YES];
    //启动定时器控制雪花位移
    [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(snowDown) userInfo:nil repeats:YES];
    
    return YES;
}

//遍历数组，查找是否存在可以重用的雪花
-(void)findSnow
{
    for (int i = 0; i <  _snowArray.count; i++)
    {
        CustomImgView * snowView = [_snowArray objectAtIndex:i];
        //没有使用，那就是说可以拿来使用
        if (snowView.isUsed == NO)
        {
            //标记为正在使用
            snowView.isUsed = YES;
            //一次只找一个雪花，所以找到后就跳出for循环
            break;
        }
    }
}
//让雪花做位移
-(void)snowDown
{
    for (int i=0; i<_snowArray.count; i++)
    {
        CustomImgView * snowView = [_snowArray objectAtIndex:i];
        //找到正在使用中的雪花        
        if (snowView.isUsed == YES)
        {
            //因为雪花需要下落，所以，只需要定时更改雪花y轴坐标
            snowView.frame = CGRectMake(snowView.frame.origin.x, snowView.frame.origin.y + 3 , 40, 40);
            //当雪花移动到屏幕外面后，要对雪花的状态进行重置
            if (snowView.frame.origin.y > 480)
            {
                //标志雪花落在屏幕外面了， 没有使用（意味着可以拿来重用了）
                snowView.isUsed = NO ;
                //重设雪花位置
                snowView.frame = CGRectMake(arc4random()%320, -40, 40, 40);
            }
        }
    }
}

@end







