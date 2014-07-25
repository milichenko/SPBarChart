//
//  SPBarChart.h
//  BarChart
//
//  Created by Vladimir Milichenko on 7/25/14.
//  Copyright (c) 2014 massinteractiveserviceslimited. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPBarChart : UIView

@property (assign, nonatomic) CGFloat progressValue;

@property (strong, nonatomic) UIColor *barChartBackgroundColor;

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor;

@end
