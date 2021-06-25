//
//  ViewController.m
//  TestLayerDemo
//
//  Created by cjl on 16/3/21.
//  Copyright © 2016年 深圳市康美云服务有限公司. All rights reserved.
//

#import "ViewController.h"
#import "HeartLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TapAction:(id)sender {
    
    NSLog(@"Tap 点击了 1122");
    
    @autoreleasepool {
        UIButton *button = sender;
        
        HeartLayer *heartLayer = [HeartLayer layer];
        
        UIImage *image = [UIImage imageNamed:@"livestream_ico_fav01"];
        
        heartLayer.backgroundColor=[UIColor brownColor].CGColor;
        heartLayer.bounds=CGRectMake(0, 0, image.size.width, image.size.height);
        heartLayer.position=CGPointMake(button.center.x, button.center.y - CGRectGetHeight(button.frame) / 2 - CGRectGetHeight(heartLayer.frame) / 2);
        heartLayer.backgroundColor = [UIColor clearColor].CGColor;
        heartLayer.count = 10;
        [heartLayer setNeedsDisplay];
        [self.view.layer addSublayer:heartLayer];
        
        [heartLayer animation];
    }
    

}

@end
