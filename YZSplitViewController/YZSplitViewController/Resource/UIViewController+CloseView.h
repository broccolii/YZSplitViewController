//
//  UIViewController+CloseView.h
//  CloseView
//
//  Created by Broccoli on 2016/11/8.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CloseViewTapActionBlock)();

@interface YZCloseView : UIView

// TODO: lineColor
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, copy) CloseViewTapActionBlock closeActionBlock;

@end

@interface UIViewController (CloseView)

@property (nonatomic, strong, readonly) YZCloseView *closeView;

@end

