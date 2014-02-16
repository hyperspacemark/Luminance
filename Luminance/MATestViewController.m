//
//  MATestViewController.m
//  Luminance
//
//  Created by Mark Adams on 4/14/13.
//
//

#import "MATestViewController.h"
#import "UIColor+Contrast.h"
#import "UIImage+AverageColor.h"

@interface MATestViewController ()

@end

@implementation MATestViewController

- (IBAction)changeNavigationBarColors:(UIButton *)sender
{
    UIColor *randomColor = [self randomColor];
    [self changeNavigationBarColor:randomColor];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self updateStatusBar];
    });
}

- (void)updateStatusBar
{
    CGRect rect = CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 20.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0.0f);
    [self.navigationController.navigationBar drawViewHierarchyInRect:rect afterScreenUpdates:YES];
    UIImage *statusBarBackgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    if ([[statusBarBackgroundImage averageColor] luminance] < 0.5) {
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    } else {
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    }
}

- (void)changeNavigationBarColor:(UIColor *)color
{
    self.navigationController.navigationBar.barTintColor = color;
}

- (UIColor *)randomColor
{
    CGFloat red = [self randomColorComponentValue];
    CGFloat blue = [self randomColorComponentValue];
    CGFloat green = [self randomColorComponentValue];
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

- (CGFloat)randomColorComponentValue
{
    CGFloat randomFloat = (CGFloat)[self randomIntegerInRange:NSMakeRange(0, 255)] / 255.0f;
    return randomFloat;
}

- (NSInteger)randomIntegerInRange:(NSRange)range
{
    NSInteger from = range.location;
    NSInteger to = range.location + range.length;
    return arc4random_uniform(to - from);
}

@end
