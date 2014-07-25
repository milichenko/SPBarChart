//
//  SPTestViewController.m
//  BarChart
//
//  Created by Vladimir Milichenko on 7/25/14.
//  Copyright (c) 2014 massinteractiveserviceslimited. All rights reserved.
//

#import "SPTestViewController.h"
#import "SPBarChart.h"

@interface SPTestViewController ()

@property (weak, nonatomic) IBOutlet SPBarChart *barChartView;
@property (weak, nonatomic) IBOutlet SPBarChart *barChartView2;

@property (strong, nonatomic) UIDynamicAnimator *animator;

@end

@implementation SPTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.barChartView.barChartBackgroundColor = [UIColor colorWithRed:200 / 255.0f green:235 / 255.0f blue:139 / 255.0f alpha:1.0f];
    self.barChartView2.barChartBackgroundColor = [UIColor colorWithRed:158 / 255.0f green:193 / 255.0f blue:230 / 255.0f alpha:1.0f];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    [UIView animateWithDuration:1.0f animations:^{
        // increase to 1.1 of the final size
    } completion:^(BOOL finished) {
        // reduce to final size in new animation block
    }];
    
    //[self showBarChartViewsWithRandomProgressValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)showBarChartViewsWithRandomProgressValue
{
    self.barChartView.progressValue = drand48();
    self.barChartView2.progressValue = drand48();
}

#pragma mark - IBAction

- (IBAction)randomizeButtonAction:(id)sender
{ UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.barChartView attachedToAnchor:self.barChartView.center];
    attachment.damping = 0.5;
    attachment.frequency = 5.0;
    [self.animator addBehavior:attachment];

    [self showBarChartViewsWithRandomProgressValue];
}

@end
