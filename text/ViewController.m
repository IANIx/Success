//
//  ViewController.m
//  text
//
//  Created by 薛佳妮 on 2017/8/16.
//  Copyright © 2017年 薛佳妮. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
    
    UIView *view;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    view.center = self.view.center;
    [self.view addSubview:view];
    [self showLabelAnimation];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)showLabelAnimation {
    [self creatCompleteAnimation];
}

- (void)creatCompleteAnimation {
    CGPoint centerPoint = (CGPoint){view.bounds.size.width, view.bounds.size.height};
    CGFloat margin = centerPoint.x/6;
    
    CAShapeLayer *completeLayer = [CAShapeLayer layer];
    completeLayer.fillColor = [UIColor clearColor].CGColor;
    completeLayer.strokeColor = [UIColor grayColor].CGColor;
    completeLayer.lineCap   = kCALineCapButt;
    completeLayer.lineJoin  = kCALineJoinMiter;
    completeLayer.lineWidth = 8;
    
    UIBezierPath *completePath = [UIBezierPath bezierPath];
    [completePath moveToPoint:CGPointMake(0, (centerPoint.y - margin)/2)];
    [completePath addLineToPoint:CGPointMake((centerPoint.x/2)-margin+5, centerPoint.y-margin)];
    [completePath addLineToPoint:CGPointMake(centerPoint.x, margin)];
    completeLayer.path = completePath.CGPath;
    
    [view.layer addSublayer:completeLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.fillMode = kCAFillModeForwards;
    [completeLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
