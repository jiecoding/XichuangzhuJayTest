//
//  XCZQuoteDraggableView.m
//  XichuangzhuJayTest
//
//  Created by laiyongche on 16/4/21.
//  Copyright © 2016年 laiyongche. All rights reserved.
//

#import "XCZQuoteDraggableView.h"
#import <Masonry.h>
#import "XCZQuote.h"


#define ACTION_MARGIN 80 // distance from center where the action applies. Higher = swipe further in order for the action to be called
#define SCALE_STRENGTH 4 // how quickly the card shrinks. Higher = slower shrinking
#define SCALE_MAX .93 // upper bar for how much the card shrinks. Higher = shrinks less
#define ROTATION_MAX 1 // the maximum rotation allowed in radians.  Higher = card can keep rotating longer
#define ROTATION_STRENGTH 320 // strength of rotation. Higher = weaker rotation
#define ROTATION_ANGLE M_PI/8 // Higher = stronger rotation angle



@interface XCZQuoteDraggableView()

@property (nonatomic)CGPoint originalPoint;

@property (nonatomic) CGFloat xFromCenter;

@property (nonatomic) CGFloat yFromCenter;

@end

@implementation XCZQuoteDraggableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (instancetype)initWithQuote:(XCZQuote *)quote
{
    self = [super initWithQuote:quote];
    if(!self)
    {
        return nil;
    }
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    
    [self addGestureRecognizer:panGestureRecognizer];
    
    return self;
    
}


- (void)panned:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    //获取移动时的 x y 坐标
    self.xFromCenter =[gestureRecognizer translationInView:self].x;
    self.yFromCenter = [gestureRecognizer translationInView:self].y;
    
    
    switch (gestureRecognizer.state) {
     
        case UIGestureRecognizerStateBegan:{
            //获取view的中心点 x y
            self.originalPoint = self.center;
            break;
        }
            
        case UIGestureRecognizerStateChanged:{
            
            //更改中心点位置
            self.center = CGPointMake(self.originalPoint.x + self.xFromCenter , self.originalPoint.y + self.yFromCenter);
      
            CGFloat rotationStrength = MIN(self.xFromCenter / ROTATION_STRENGTH, ROTATION_MAX);
            
            NSLog(@"self.xFromCenter:%f",self.xFromCenter);
            
           
            NSLog(@"ROTATION_MAX:%d",ROTATION_MAX);

            
            NSLog(@"rotationStrength:%f",self.xFromCenter);
            
            //旋转角度
            CGFloat rotationAngel = (CGFloat) (ROTATION_ANGLE *rotationStrength);
            
            CGAffineTransform transform = CGAffineTransformMakeRotation(rotationAngel);
            
            //缩放
           CGFloat scale = MAX(1 - fabs(rotationStrength) / SCALE_STRENGTH, SCALE_MAX);
            
            CGAffineTransform scaleTransform = CGAffineTransformScale(transform, scale, scale);

            self.transform = scaleTransform;
            
            if ([self.deleagte respondsToSelector:@selector(dragging:)]) {
                [self.quoteDragdeleagte dragging:MIN(1.0, fabs(self.xFromCenter) / ACTION_MARGIN)];
            }
//
            
            break;
        }
            
        case UIGestureRecognizerStateEnded:{
          
            [self panEnded];
            
            break;
        }
        
        default:
            break;
    }
    
}

- (void)panEnded
{
    //判断向右滑动大于80距离 就做处理
    if(self.xFromCenter > ACTION_MARGIN){
    //y 坐标 当前移动到的y坐标 ＋ 本类view中心点的y 坐标
    CGPoint finishPoint = CGPointMake(500, 2* self.yFromCenter + self.originalPoint.y);
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.center = finishPoint;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        //用来判断是否有以某个名字命名的方法(被封装在一个selector的对象里传递)
        if(self.deleagte){
            if([self.deleagte respondsToSelector:@selector(didDragRight:)])
            {
                [self.quoteDragdeleagte didDragRight:self];
                
            }
        }
     
    }];
    }
    else if (self.xFromCenter < -ACTION_MARGIN)
    {
        CGPoint finishPoint = CGPointMake(-500, self.yFromCenter + self.originalPoint.y);
        [UIView animateWithDuration:0.3 animations:^{
            self.center = finishPoint;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            if(self.deleagte)
            {
                if([self.deleagte respondsToSelector:@selector(didDragLeft:)])
                {
                    [self.quoteDragdeleagte didDragLeft:self];
                }
            }
            
        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            //最开始已经拿到view 本来的  x y 在移动不合适的时候可以返回原来的位置
            self.center = self.originalPoint;
            self.transform = CGAffineTransformMakeRotation(0);
        }];
        if([self.deleagte respondsToSelector:@selector(willBackToCenter:)])
        {
            [self.quoteDragdeleagte willBackToCenter:MIN(1.0, fabs(self.xFromCenter) / ACTION_MARGIN)];
        }
    }
    
}




#pragma mark - Public Methods

/**
 *  程序控制向左滑
 */
- (void)dragLeft
{
    
    CGPoint finishPoint = CGPointMake(-600, self.center.y - 50);
    [UIView animateWithDuration:0.4
                     animations:^{
                         self.center = finishPoint;
                         self.transform = CGAffineTransformMakeRotation(-1);
                     } completion:^(BOOL complete){
                         [self removeFromSuperview];
                         
                         if (self.deleagte) {
                             if ([self.deleagte respondsToSelector:@selector(didDragLeft:)]) {
                                 [self.quoteDragdeleagte didDragLeft:self];
                             }
                         }
                     }];
}

/**
 *  程序控制向右滑
 */
- (void)dragRight
{
    
    CGPoint finishPoint = CGPointMake(600, self.center.y - 50);
    [UIView animateWithDuration:0.4
                     animations:^{
                         self.center = finishPoint;
                         self.transform = CGAffineTransformMakeRotation(1);
                     } completion:^(BOOL complete){
                         [self removeFromSuperview];
                         
                         if (self.deleagte) {
                             if ([self.deleagte respondsToSelector:@selector(didDragRight:)]) {
                                 [self.quoteDragdeleagte didDragRight:self];
                             }
                         }
                     }];
}





@end
