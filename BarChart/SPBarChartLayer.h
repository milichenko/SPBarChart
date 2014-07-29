//
//  SPBarChartLayer.h
//  BarChart
//
//  Created by Vladimir Milichenko on 7/25/14.
//  Copyright (c) 2014 massinteractiveserviceslimited. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class SPBarChartLayer;

@protocol SPBarChartLayerAnimationDelegate <NSObject>

@optional
- (void)barChartLayerAnimationDidStop:(SPBarChartLayer *)barChartLayer;

@end

@interface SPBarChartLayer : CALayer

@property (strong, nonatomic) UIColor *barChartBackgroundColor;

@property (weak, nonatomic) id<SPBarChartLayerAnimationDelegate> barChartLayerAnimationDelegate;

@property (assign, nonatomic) CGFloat progressValue;

@end
