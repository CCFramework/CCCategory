//
//  UIImage+SSCategory.m
//  YYCK
//
//  Created by 李飞恒 on 2017/7/5.
//  Copyright © 2017年 李飞恒. All rights reserved.
//

#import "UIImage+SSCategory.h"
#import <Accelerate/Accelerate.h>

@implementation UIImage (SSCategory)

+ (UIImage*)createImageWithColor: (UIColor*) color
{
    // 画布大小
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 在当前画布上开启绘图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 画笔
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置画笔颜色
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 填充画布
    CGContextFillRect(context, rect);
    // 取得画布中的图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束绘图上下文
    UIGraphicsEndImageContext();
    return theImage;
}

+ (instancetype)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = (UIImage *)UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)setImageSize:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextFillRect(context, rect);
    
    UIImage *image = (UIImage *)UIGraphicsGetImageFromCurrentImageContext()
    ;
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
    if (iOS7) { // 处理iOS7的情况
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}

+ (instancetype)imageColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *pureColorImage = (UIImage *)UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pureColorImage;
}

+ (instancetype)imageColor:(UIColor *)color {
    return [UIImage imageColor:color size:CGSizeMake(100, 100)];
}

+ (instancetype)imageHexColor:(NSString *)hexColor size:(CGSize)size {
    return [UIImage imageColor:[UIColor colorWithString:hexColor] size:size];
}

+ (instancetype)imageHexColor:(NSString *)hexColor {
    return [UIImage imageHexColor:hexColor size:CGSizeMake(100, 100)];
}




+ (UIImage *)blurryImage:(UIImage *)image blur:(CGFloat)blur {
    if ((blur <= 0.0f) || (blur >= 1.0f)) {
        blur = 0.5f;
    }
    
    int boxSize = (int)(blur * 100);
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

- (UIColor *)mostColor
{
    // 1.先把图片缩小，加快计算速度，但越小结果误差可能越大
    CGSize thumbSize = CGSizeMake(50, 50);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(NULL, thumbSize.width, thumbSize.height, 8, thumbSize.width*4, colorSpace, kCGImageAlphaPremultipliedLast);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, self.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    // 2.取每个点的像素值
    unsigned char *data = CGBitmapContextGetData(context);
    if (data == NULL) {
        return nil;
    }
    NSCountedSet *cls = [NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            int offset = 4 * (x*y);
            int red = data[offset];
            int green = data[offset +1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            
            NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
        }
    }
    CGContextRelease(context);
    
    // 3.找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        
        if ( tmpCount < MaxCount ) continue;
        
        MaxCount=tmpCount;
        MaxColor=curColor;
    }
    
    // 4.返回
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}


// 获取视频第一帧
+ (UIImage*)imageWithVideoUrl:(NSString *)path
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:[NSURL URLWithString:path] options:nil];
    AVAssetImageGenerator *assetGen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *videoImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return videoImage;
}


/**
 64base 字符串 转成 UIImage

 @param str 64base 字符串
 @return UIImage
 */
+ (UIImage *)stringToImage:(NSString *)str
{
    NSData * imageData =[[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *photo = [UIImage imageWithData:imageData];
    return photo;
}


/**
 UIImage 转 64base 字符串

 @param image UIImage
 @return 64base 字符串
 */
+ (NSString *)imageToString:(UIImage *)image
{
    NSData *imagedata = UIImagePNGRepresentation(image);
    NSString *image64 = [imagedata base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return image64;
    
}


//从绘二维码CGImage
//内部方法
+ (UIImage *)contextSetInterpolationCIImage:(CIImage *)ciImage withSize:(CGFloat)size
{
    CGRect extent = CGRectIntegral(ciImage.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    //创建bitmap
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *contect = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [contect createCGImage:ciImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    //保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}


/**
 通过字符串绘制二维码

 @param string 需要绘制的二维码
 */
+ (UIImage *)qrCodeWithString:(NSString *)string
{
    //二维码波滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //恢复滤镜的默认属性
    [filter setDefaults];
    //将字符串转换成NSData
    NSData *data = [string dataUsingEncoding:(NSUTF8StringEncoding)];
    //通过KVO设置滤镜
    [filter setValue:data forKey:@"inputMessage"];
    //获取得滤镜
    CIImage *image = [filter outputImage];
    //将CIImage转换成UIImage
    return [UIImage contextSetInterpolationCIImage:image withSize:1200];
}

@end
