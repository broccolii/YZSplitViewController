//
//  UIViewController+CloseView.m
//  CloseView
//
//  Created by Broccoli on 2016/11/8.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import "UIViewController+CloseView.h"
#import <objc/runtime.h>

@implementation YZCloseView

- (instancetype)init {
    self = [super init];
    if (self) {
        _lineColor = [UIColor colorWithRed:0.635 green:0.632 blue:0.692 alpha:1];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeViewTapAction)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)closeViewTapAction {
    if (self.closeActionBlock) {
        _closeActionBlock();
    }
}

- (void)drawLine {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:CGPointMake(self.frame.size.width * 0.25, self.frame.size.height * 0.25)];
    [path addLineToPoint:CGPointMake(self.frame.size.width * 0.75, self.frame.size.height * 0.75)];
    
    [path moveToPoint:CGPointMake(self.frame.size.width * 0.25, self.frame.size.height * 0.75)];
    [path addLineToPoint:CGPointMake(self.frame.size.width * 0.75, self.frame.size.height * 0.25)];
   
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.strokeColor = _lineColor.CGColor;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.lineWidth = 7.0;
    
    lineLayer.path = path.CGPath;
    [self.layer addSublayer:lineLayer];
}

- (void)drawRect:(CGRect)rect {
    for (CALayer *sublayer in self.layer.sublayers) {
        [sublayer removeFromSuperlayer];
    }
    [self drawLine];
}

@end

static NSString * const key = @"key";
@implementation UIViewController (CloseView)

- (YZCloseView *)closeView {
    if (objc_getAssociatedObject(self, &key) == nil) {
        YZCloseView *closeView = [[YZCloseView alloc] init];
        closeView.frame = CGRectMake(0, 0, 60, 60);
        closeView.backgroundColor = [UIColor clearColor];
         __weak __typeof__(self) weakSelf = self;
        closeView.closeActionBlock =^() {
            __strong __typeof__(weakSelf) strongSelf = weakSelf;
            [strongSelf.navigationController popViewControllerAnimated:YES];
        };
        closeView.hidden = YES;
        objc_setAssociatedObject(self, &key, closeView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self.view addSubview:closeView];
    }
    return objc_getAssociatedObject(self, &key);
}

@end
