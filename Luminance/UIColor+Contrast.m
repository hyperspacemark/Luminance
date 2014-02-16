//
//  UIColor+Contrast.m
//  BotKit
//
//  Created by Mark Adams on 4/13/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "UIColor+Contrast.h"

@implementation UIColor (Contrast)

- (BOOL)isGrayscale
{
    NSInteger numberOfComponents = CGColorGetNumberOfComponents([self CGColor]);

    if (numberOfComponents == 2)
        return YES;

    return NO;
}

- (CGFloat)luminance
{
    if ([self isGrayscale]) {
        return [self brightness];
    }

    CGFloat red, green, blue;

    if (![self getRed:&red green:&green blue:&blue alpha:NULL])
        return 0;

    red *= 0.2126;
    green *= 0.7152;
    blue *= 0.0722;

    return red + green + blue;
}

- (CGFloat)brightness
{
    CGFloat brightness;

    if (![self getHue:NULL saturation:NULL brightness:&brightness alpha:NULL])
        return 0;

    return brightness;
}

/*
 Luminance calculation from http://en.wikipedia.org/wiki/Luma_(video)
 
 Calculates luminance from the color's RGB values to
 determine a maximally contrasting value, either black or white
 */

- (UIColor *)maximumContrastingColor
{
    if ([self luminance] <= 0.5)
        return [UIColor whiteColor];

    else return [UIColor blackColor];
}

@end
