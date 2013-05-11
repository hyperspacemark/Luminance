//
//  MATestViewController.m
//  Luminance
//
//  Created by Mark Adams on 4/14/13.
//
//

#import "MATestViewController.h"
#import "UIColor+Contrast.h"

@interface MATestViewController ()

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation MATestViewController

- (IBAction)changeNavigationBarColors:(UIButton *)sender
{
    UIColor *randomColor = [self randomColor];
    [self changeNavigationBarColor:randomColor];
    [self changeTitleLabelTextColor:[randomColor maximumContrastingColor]];
}

- (void)changeNavigationBarColor:(UIColor *)color
{
    self.navigationBar.tintColor = color;
}

- (void)changeTitleLabelTextColor:(UIColor *)color
{
    self.titleLabel.textColor = [color colorWithAlphaComponent:0.90];

    CGFloat yOffset = 1;
    UIColor *shadowColor = [UIColor blackColor];

    if ([color isEqual:[UIColor blackColor]])
    {
        yOffset = -1;
        shadowColor = [UIColor whiteColor];
    }

    self.titleLabel.shadowColor = [shadowColor colorWithAlphaComponent:0.75];
    self.titleLabel.shadowOffset = CGSizeMake(0, (color == [UIColor blackColor]? 1 : -1));
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
    return (arc4random() % (to - from)) + from;
}

@end
