//
//  SELocationManager.m
//  bname
//
//  Created by iMac Maxt on 2018/7/24.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import "SELocationManager.h"
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#define kWeakSelf(type)     __weak typeof(type) weak##type = type;
#define kStrongSelf(type)   __strong typeof(type) type = weak##type;

@interface SELocationManager ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, copy) LocationStartStatusBlock locationStartStatusBlock;

@end
@implementation SELocationManager
static BOOL isClose = NO;

+ (instancetype)sharedInstance
{
    static SELocationManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SELocationManager alloc] init];
        instance.locationManager = [[CLLocationManager alloc] init];
    });
    return instance;
}


//开始定位
- (void)startLocation:(LocationStartStatusBlock)startStatusBlock
{
    self.locationManager.delegate = self;
    
    if (startStatusBlock) {
        [self setLocationStartStatusBlock:startStatusBlock];
    }
    
    if ([CLLocationManager locationServicesEnabled]) {
        // 控制定位精度,越高耗电量多
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        isClose = NO;
        [self updateLocation];
    }
}


- (void)updateLocation
{
    // 总是授权
    [self.locationManager requestAlwaysAuthorization];
    self.locationManager.distanceFilter = 10.0f;
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    if ([error code] == kCLErrorDenied) {
        
        UIAlertController *alerController = [UIAlertController alertControllerWithTitle:kLocationTitle message:kLocationMessage preferredStyle:UIAlertControllerStyleActionSheet];
        [alerController addAction:[UIAlertAction actionWithTitle:kLocationOKTitle style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction *action) {
            
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }]];
        [alerController addAction:[UIAlertAction actionWithTitle:kLocationCancelTitle style:(UIAlertActionStyleCancel) handler:nil]];
        [[UIApplication sharedApplication].keyWindow.rootViewController.presentingViewController presentViewController:alerController animated:YES completion:nil];
    }
}

//定位代理经纬度回调
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *newLocation = locations[0];
    
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    kWeakSelf(self)
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
        kStrongSelf(self)
        if (array.count > 0){
            
            [self setupPlacemarkValue:[array objectAtIndex:0]];
        } else if (error == nil && [array count] == 0) {
            
            NSLog(@"没有结果返回.");
        } else if (error != nil) {
            
            NSLog(@"一个错误发生 = %@", error);
        }
    }];
    
}

- (void)setupPlacemarkValue:(CLPlacemark *)placemark
{
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [self.locationManager stopUpdatingLocation];
    
    //获取城市
    NSString *city = placemark.locality;
    if (!city) {
        //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
        city = placemark.administrativeArea;
    }
    
    
    NSLog(@"当前经纬度-longitude:%f,latitude:%f",placemark.location.coordinate.longitude,placemark.location.coordinate.latitude);
    [[NSUserDefaults standardUserDefaults] setObject:@{@"latitude":@(placemark.location.coordinate.latitude),
                                                       @"longitude":@(placemark.location.coordinate.longitude)
                                                       } forKey:@"coordinate"];
    //地址
    self.addr = placemark.addressDictionary[@"FormattedAddressLines"][0];
    NSLog(@"【bname】地址 = %@", self.addr);
    
    
    //国家
    self.country = placemark.addressDictionary[@"Country"];
    //省
    self.state = placemark.addressDictionary[@"State"];
    //市
    self.city = city;
    //区
    self.subLocality = placemark.addressDictionary[@"SubLocality"];
    //街道
    self.thoroughfare = placemark.addressDictionary[@"Thoroughfare"];
    //门牌号
    self.subThoroughfare = placemark.addressDictionary[@"SubThoroughfare"];
    //道路 + 门牌号
    self.street = placemark.addressDictionary[@"Street"];
    //经度
    self.latitude = @(placemark.location.coordinate.latitude);
    //纬度
    self.longitude = @(placemark.location.coordinate.longitude);
    
    
    if (self.locationStartStatusBlock) {
        self.locationStartStatusBlock(YES);
    }
}


@end
