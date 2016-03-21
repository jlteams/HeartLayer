//
//  HeartLayer.h
//  TestLayerDemo
//
//  Created by cjl on 16/3/21.
//  Copyright © 2016年 深圳市康美云服务有限公司. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface HeartLayer : CALayer

@property (nonatomic,assign) NSInteger count;

- (void)animation;

@end
