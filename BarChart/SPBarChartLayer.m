//
//  SPBarChartLayer.m
//  BarChart
//
//  Created by Vladimir Milichenko on 7/25/14.
//  Copyright (c) 2014 massinteractiveserviceslimited. All rights reserved.
//

#import "SPBarChartLayer.h"

@implementation SPBarChartLayer

@dynamic progressValue;
@dynamic barChartBackgroundColor;

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"progressValue"])
    {
        return YES;
    }
    else
    {
        return [super needsDisplayForKey:key];
    }
}

- (id)actionForKey:(NSString *)aKey
{
    if ([aKey isEqualToString:@"progressValue"])
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:aKey];
        animation.fromValue = [self.presentationLayer valueForKey:aKey];
        animation.delegate = self;
        
        return animation;
    }
    
	return [super actionForKey:aKey];
}

- (void)drawInContext:(CGContextRef)ctx
{
    CGFloat verticalOffset = self.frame.size.height / 10.0f;
    
    CGRect frameRect = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height - verticalOffset);
    
    CGFloat red = 0.0f;
    CGFloat green = 0.0f;
    CGFloat blue = 0.0f;
    CGFloat alpha = 0.0f;
    
    [self.barChartBackgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    CGFloat rectangleHeight = frameRect.size.height * self.progressValue;
    
    CGRect rectangle = CGRectMake(0.0f, frameRect.size.height - rectangleHeight + verticalOffset, frameRect.size.width, rectangleHeight);
    
    CGContextSetRGBFillColor(ctx, red, green, blue, alpha);
    CGContextFillRect(ctx, rectangle);
    
    [super drawInContext:ctx];
}

#pragma mark - Animation delegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag)
    {
        if ([self.barChartLayerAnimationDelegate respondsToSelector:@selector(barChartLayerAnimationDidStop:)])
        {
            [self.barChartLayerAnimationDelegate barChartLayerAnimationDidStop:self];
        }
    }
}

@end
