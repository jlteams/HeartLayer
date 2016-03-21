//
//  HeartLayer.m
//  TestLayerDemo
//
//  Created by cjl on 16/3/21.
//  Copyright © 2016年 深圳市康美云服务有限公司. All rights reserved.
//

#import "HeartLayer.h"

#define randon 10
#define offsetX 10
#define offsetY 40

@implementation HeartLayer

- (void)drawInContext:(CGContextRef)ctx
{
    self.opacity = 0;
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"livestream_ico_fav0%d",arc4random() % 6 + 1]];
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    imageLayer.contents = (id) image.CGImage;
    
    [self addSublayer:imageLayer];
}

- (void)animation
{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithInt:0];
    scaleAnimation.toValue = [NSNumber numberWithInt:1];
    scaleAnimation.duration = 0.1f;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithInt:1];
    opacityAnimation.toValue = [NSNumber numberWithInt:0];

    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    int randomNum = arc4random() % 2;
    
    
    NSMutableArray *valueArray = [NSMutableArray array];
    
    @autoreleasepool {
        for (int i = 0; i < _count; i++) {
            NSValue *value = nil;
            if (i == 0) {
                value = [NSValue valueWithCGPoint:self.position];
            } else {
                CGFloat pointX = 0;
                
                if (randomNum == 0) {
                    if (i % 2 == 0) {
                        pointX = CGRectGetMidX(self.frame) -  (arc4random() % randon + offsetX);
                    } else {
                        pointX = CGRectGetMidX(self.frame) +  (arc4random() % randon + offsetX);
                    }
                } else {
                    if (i % 2 == 0) {
                        pointX = CGRectGetMidX(self.frame) +  (arc4random() % randon + offsetX);
                    } else {
                        pointX = CGRectGetMidX(self.frame) -  (arc4random() % randon + offsetX);
                    }
                }
                value = [NSValue valueWithCGPoint:CGPointMake(pointX, CGRectGetMidY(self.frame) - offsetY * 0.5 * (i + 1))];
            }
            [valueArray addObject:value];
        }
    }

    
    pathAnimation.values = valueArray;
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.duration = 10.0f;
    group.animations = @[scaleAnimation,pathAnimation,opacityAnimation];
    group.delegate = self;
    
    [self addAnimation:group forKey:nil];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self removeFromSuperlayer];
}

@end
