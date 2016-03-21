# HeartLayer

![image](https://github.com/jlteams/HeartLayer/blob/master/Untitled.gif)

## How to use
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
