//
//  UIImage+AverageColor.m
//  Luminance
//
//  Created by Mark Adams on 10/26/13.
//
//

#import "UIImage+AverageColor.h"

@implementation UIImage (AverageColor)

- (UIColor *)averageColor
{
    CGSize size = CGSizeMake(1.0f, 1.0f);
    UIGraphicsBeginImageContextWithOptions(size, YES, 0.0f);

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationMedium);

    CGRect rect = CGRectZero;
    rect.size = size;
    [self drawInRect:rect blendMode:kCGBlendModeCopy alpha:1.0f];

    uint8_t *data = CGBitmapContextGetData(context);
    UIColor *averageColor = [UIColor colorWithRed:data[2] / 255.0f green:data[1] / 255.0f blue:data[0] / 255.0f alpha:1.0f];

    UIGraphicsEndImageContext();

    return averageColor;
}

@end
