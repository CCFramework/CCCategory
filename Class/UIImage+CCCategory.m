//
//  UIImage+CCCategory.m
//  CCCategoryDemo
//
//  Created by 李飞恒 on 16/4/5.
//  Copyright © 2016年 MuZiLee. All rights reserved.
//

#import "UIImage+CCCategory.h"
#import <Accelerate/Accelerate.h>
#import <float.h>
#import "UIColor+CCCategory.h"

@implementation UIImage (CCCategory)

+ (instancetype)cc_imageColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *pureColorImage = (UIImage *)UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pureColorImage;
}

+ (instancetype)cc_imageColor:(UIColor *)color {
    return [UIImage cc_imageColor:color size:CGSizeMake(100, 100)];
}

+ (instancetype)cc_imageHexColor:(NSString *)hexColor size:(CGSize)size {
    return [UIImage cc_imageColor:[UIColor colorWithString:hexColor] size:size];
}

+ (instancetype)cc_imageHexColor:(NSString *)hexColor {
    return [UIImage cc_imageHexColor:hexColor size:CGSizeMake(100, 100)];
}




+ (UIImage *)cc_blurryImage:(UIImage *)image blurrySize:(CGFloat)blurrySize {
    if ((blurrySize <= 0.0f) || (blurrySize >= 1.0f)) {
        blurrySize = 0.5f;
    }
    
    int boxSize = (int)(blurrySize * 100);
    boxSize -= (boxSize % 2) + 1;
    
    CGImageRef img = image.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL,
                                       0, 0, boxSize, boxSize, NULL,
                                       kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"错误的 %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             CGImageGetBitmapInfo(image.CGImage));
    
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
//    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}



+ (instancetype)cc_resizableImage:(NSString *)name leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio {
    UIImage *image = [UIImage imageNamed:name];
    CGFloat left = image.size.width * leftRatio;
    CGFloat top = image.size.height * topRatio;
    return (UIImage *)[image stretchableImageWithLeftCapWidth:left topCapHeight:top];
}


+ (instancetype)imageSize:(CGSize)size borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor radius:(CGFloat)radius {
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect outerRect = CGRectMake(0, 0, size.width, size.height);
    CGMutablePathRef outerPath = createRoundedRectForRect(outerRect, radius);
    
    CGContextSaveGState(context);
    CGContextAddRect(context, CGRectMake(0, 0, size.width, size.height));
    CGContextAddPath(context, outerPath);
    CGContextEOClip(context);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextAddPath(context, outerPath);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
    CGFloat innerMargin = -1.0f;
    CGRect innerRect = CGRectInset(outerRect, innerMargin, innerMargin);
    CGMutablePathRef innerPath = createRoundedRectForRect(innerRect, radius);
    
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, backgroundColor.CGColor);
    CGContextAddPath(context, innerPath);
    CGContextClip(context);
    CGContextAddPath(context, innerPath);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
    CFRelease(outerPath);
    CFRelease(innerPath);
    
    return (UIImage *)UIGraphicsGetImageFromCurrentImageContext();
}

CGMutablePathRef createRoundedRectForRect(CGRect rect, CGFloat radius) {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
    CGPathCloseSubpath(path);
    
    return path;
}

+ (instancetype)cc_circleImageName:(NSString*)imageName round:(CGFloat)round {
    UIImage *image = [UIImage imageNamed:imageName];
    
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    CGRect rect = CGRectMake(round, round, image.size.width - round * 2.0f, image.size.height - round * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = (UIImage *)UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

+ (instancetype)imageWithPNGFileName:(NSString*)imageName {
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
    return [UIImage imageWithContentsOfFile:path];
}
+ (instancetype)imageWithMPEGFileName:(NSString*)imageName {
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"mpeg"];
    return [UIImage imageWithContentsOfFile:path];
}


+ (instancetype)resizableImage:(NSString *)name size:(CGSize)size {
    UIImage *image = [UIImage imageNamed:name];
    CGFloat x = image.size.width * size.width;
    CGFloat y = image.size.height * size.height;
    return [image stretchableImageWithLeftCapWidth:x topCapHeight:y];
}



@end

