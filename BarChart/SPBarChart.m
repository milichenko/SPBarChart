//
//  SPBarChart.m
//  BarChart
//
//  Created by Vladimir Milichenko on 7/25/14.
//  Copyright (c) 2014 massinteractiveserviceslimited. All rights reserved.
//

#import "SPBarChart.h"
#import "SPBarChartLayer.h"

@interface SPBarChart () <SPBarChartLayerAnimationDelegate>

@end

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
        [self initialSetup];
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
    }
    
    return self;
}

#pragma mark - Getters and Setters

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

#pragma mark - Private methods

- (void)initialSetup
{
    self.layer.contentsScale = [[UIScreen mainScreen] scale];
    SPBarChartLayer *layer = (SPBarChartLayer *)self.layer;
    layer.barChartLayerAnimationDelegate = self;
}

#pragma mark - SPBarChartLayerAnimationDelegate

- (void)barChartLayerAnimationDidStop:(SPBarChartLayer *)barChartLayer
{
    CGFloat percentsForVerticalAnimation = barChartLayer.frame.size.height / 10.0f;
    
    [UIView animateWithDuration:0.25 animations:^{
        barChartLayer.frame = CGRectMake(barChartLayer.frame.origin.x,
                                         barChartLayer.frame.origin.y - percentsForVerticalAnimation,
                                         barChartLayer.frame.size.width,
                                         barChartLayer.frame.size.height + percentsForVerticalAnimation);
    } completion:^(BOOL finished) {
        if (finished)
        {
            [UIView animateWithDuration:0.25 animations:^{
                barChartLayer.frame = CGRectMake(barChartLayer.frame.origin.x,
                                                 barChartLayer.frame.origin.y + percentsForVerticalAnimation,
                                                 barChartLayer.frame.size.width,
                                                 barChartLayer.frame.size.height - percentsForVerticalAnimation);
            }];
        }
    }];
}

@end
