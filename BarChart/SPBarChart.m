//
//  SPBarChart.m
//  BarChart
//
//  Created by Vladimir Milichenko on 7/25/14.
//  Copyright (c) 2014 massinteractiveserviceslimited. All rights reserved.
//

#import "SPBarChart.h"
#import "SPBarChartLayer.h"

@implementation SPBarChart

+ (Class)layerClass
{
    return [SPBarChartLayer class];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        self.layer.contentsScale = [[UIScreen mainScreen] scale];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame backgroundColor:[UIColor whiteColor]];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.barChartBackgroundColor = backgroundColor;
        self.layer.contentsScale = [[UIScreen mainScreen] scale];
        [self.layer setNeedsDisplay];
    }
    
    return self;
}

- (CGFloat)progressValue
{
    SPBarChartLayer *layer = (SPBarChartLayer *)self.layer;
    
    return layer.progressValue;
}

- (void)setProgressValue:(CGFloat)progressValue
{
    SPBarChartLayer *layer = (SPBarChartLayer *)self.layer;
    layer.progressValue = progressValue;
    layer.barChartBackgroundColor = self.barChartBackgroundColor;
}

@end
