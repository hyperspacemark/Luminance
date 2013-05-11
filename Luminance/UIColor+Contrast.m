//
//  UIColor+Contrast.m
//  BotKit
//
//  Created by Mark Adams on 4/13/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "UIColor+Contrast.h"

@implementation UIColor (Contrast)

/*
 Luminance calculation from http://en.wikipedia.org/wiki/Luma_(video)
 
 Calculates luminance from the color's RGB values to
 determine a maximally contrasting value, either black or white
 */

- (UIColor *)maximumContrastingColor
{
    CGFloat red, green, blue;
    if (![self getRed:&red green:&green blue:&blue alpha:NULL]) return nil;

    CGFloat luminance = (0.2126 * red + 0.7152 * green + 0.0722 * blue);
    if (luminance <= 0.5) return [UIColor whiteColor];
    else return [UIColor blackColor];
}

@end
