//
//  SEClassInfo.h
//  SEModel
//
//  Created by jerrylee on 2018/9/13.
//  Copyright © 2018年 JerryLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Type encoding's type.
 */
typedef NS_OPTIONS(NSUInteger, SEEncodingType) {
    SEEncodingTypeMask       = 0xFF, ///< mask of type value
    SEEncodingTypeUnknown    = 0, ///< unknown
    SEEncodingTypeVoid       = 1, ///< void
    SEEncodingTypeBool       = 2, ///< bool
    SEEncodingTypeInt8       = 3, ///< char / BOOL
    SEEncodingTypeUInt8      = 4, ///< unsigned char
    SEEncodingTypeInt16      = 5, ///< short
    SEEncodingTypeUInt16     = 6, ///< unsigned short
    SEEncodingTypeInt32      = 7, ///< int
    SEEncodingTypeUInt32     = 8, ///< unsigned int
    SEEncodingTypeInt64      = 9, ///< long long
    SEEncodingTypeUInt64     = 10, ///< unsigned long long
    SEEncodingTypeFloat      = 11, ///< float
    SEEncodingTypeDouble     = 12, ///< double
    SEEncodingTypeLongDouble = 13, ///< long double
    SEEncodingTypeObject     = 14, ///< id
    SEEncodingTypeClass      = 15, ///< Class
    SEEncodingTypeSEL        = 16, ///< SEL
    SEEncodingTypeBlock      = 17, ///< block
    SEEncodingTypePointer    = 18, ///< void*
    SEEncodingTypeStruct     = 19, ///< struct
    SEEncodingTypeUnion      = 20, ///< union
    SEEncodingTypeCString    = 21, ///< char*
    SEEncodingTypeCArray     = 22, ///< char[10] (for example)
    
    SEEncodingTypeQualifierMask   = 0xFF00,   ///< mask of qualifier
    SEEncodingTypeQualifierConst  = 1 << 8,  ///< const
    SEEncodingTypeQualifierIn     = 1 << 9,  ///< in
    SEEncodingTypeQualifierInout  = 1 << 10, ///< inout
    SEEncodingTypeQualifierOut    = 1 << 11, ///< out
    SEEncodingTypeQualifierBycopy = 1 << 12, ///< bycopy
    SEEncodingTypeQualifierByref  = 1 << 13, ///< byref
    SEEncodingTypeQualifierOneway = 1 << 14, ///< oneway
    
    SEEncodingTypePropertyMask         = 0xFF0000, ///< mask of property
    SEEncodingTypePropertyReadonly     = 1 << 16, ///< readonly
    SEEncodingTypePropertyCopy         = 1 << 17, ///< copy
    SEEncodingTypePropertyRetain       = 1 << 18, ///< retain
    SEEncodingTypePropertyNonatomic    = 1 << 19, ///< nonatomic
    SEEncodingTypePropertyWeak         = 1 << 20, ///< weak
    SEEncodingTypePropertyCustomGetter = 1 << 21, ///< getter=
    SEEncodingTypePropertyCustomSetter = 1 << 22, ///< setter=
    SEEncodingTypePropertyDynamic      = 1 << 23, ///< @dynamic
};

/**
 Get the type from a Type-Encoding string.
 
 @discussion See also:
 https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
 https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html
 
 @param typeEncoding  A Type-Encoding string.
 @return The encoding type.
 */
SEEncodingType SEEncodingGetType(const char *typeEncoding);


/**
 Instance variable information.
 */
@interface SEClassIvarInfo : NSObject
@property (nonatomic, assign, readonly) Ivar ivar;              ///< ivar opaque struct
@property (nonatomic, strong, readonly) NSString *name;         ///< Ivar's name
@property (nonatomic, assign, readonly) ptrdiff_t offset;       ///< Ivar's offset
@property (nonatomic, strong, readonly) NSString *typeEncoding; ///< Ivar's type encoding
@property (nonatomic, assign, readonly) SEEncodingType type;    ///< Ivar's type

/**
 Creates and returns an ivar info object.
 
 @param ivar ivar opaque struct
 @return A new object, or nil if an error occurs.
 */
- (instancetype)initWithIvar:(Ivar)ivar;
@end


/**
 Method information.
 */
@interface SEClassMethodInfo : NSObject
@property (nonatomic, assign, readonly) Method method;                  ///< method opaque struct
@property (nonatomic, strong, readonly) NSString *name;                 ///< method name
@property (nonatomic, assign, readonly) SEL sel;                        ///< method's selector
@property (nonatomic, assign, readonly) IMP imp;                        ///< method's implementation
@property (nonatomic, strong, readonly) NSString *typeEncoding;         ///< method's parameter and return types
@property (nonatomic, strong, readonly) NSString *returnTypeEncoding;   ///< return value's type
@property (nullable, nonatomic, strong, readonly) NSArray<NSString *> *argumentTypeEncodings; ///< array of arguments' type

/**
 Creates and returns a method info object.
 
 @param method method opaque struct
 @return A new object, or nil if an error occurs.
 */
- (instancetype)initWithMethod:(Method)method;
@end


/**
 Property information.
 */
@interface SEClassPropertyInfo : NSObject
@property (nonatomic, assign, readonly) objc_property_t property; ///< property's opaque struct
@property (nonatomic, strong, readonly) NSString *name;           ///< property's name
@property (nonatomic, assign, readonly) SEEncodingType type;      ///< property's type
@property (nonatomic, strong, readonly) NSString *typeEncoding;   ///< property's encoding value
@property (nonatomic, strong, readonly) NSString *ivarName;       ///< property's ivar name
@property (nullable, nonatomic, assign, readonly) Class cls;      ///< may be nil
@property (nullable, nonatomic, strong, readonly) NSArray<NSString *> *protocols; ///< may nil
@property (nonatomic, assign, readonly) SEL getter;               ///< getter (nonnull)
@property (nonatomic, assign, readonly) SEL setter;               ///< setter (nonnull)

/**
 Creates and returns a property info object.
 
 @param property property opaque struct
 @return A new object, or nil if an error occurs.
 */
- (instancetype)initWithProperty:(objc_property_t)property;
@end


/**
 Class information for a class.
 */
@interface SEClassInfo : NSObject
@property (nonatomic, assign, readonly) Class cls; ///< class object
@property (nullable, nonatomic, assign, readonly) Class superCls; ///< super class object
@property (nullable, nonatomic, assign, readonly) Class metaCls;  ///< class's meta class object
@property (nonatomic, readonly) BOOL isMeta; ///< whether this class is meta class
@property (nonatomic, strong, readonly) NSString *name; ///< class name
@property (nullable, nonatomic, strong, readonly) SEClassInfo *superClassInfo; ///< super class's class info
@property (nullable, nonatomic, strong, readonly) NSDictionary<NSString *, SEClassIvarInfo *> *ivarInfos; ///< ivars
@property (nullable, nonatomic, strong, readonly) NSDictionary<NSString *, SEClassMethodInfo *> *methodInfos; ///< methods
@property (nullable, nonatomic, strong, readonly) NSDictionary<NSString *, SEClassPropertyInfo *> *propertyInfos; ///< properties

/**
 If the class is changed (for example: you add a method to this class with
 'class_addMethod()'), you should call this method to refresh the class info cache.
 
 After called this method, `needUpdate` will returns `YES`, and you should call 
 'classInfoWithClass' or 'classInfoWithClassName' to get the updated class info.
 */
- (void)setNeedUpdate;

/**
 If this method returns `YES`, you should stop using this instance and call
 `classInfoWithClass` or `classInfoWithClassName` to get the updated class info.
 
 @return Whether this class info need update.
 */
- (BOOL)needUpdate;

/**
 Get the class info of a specified Class.
 
 @discussion This method will cache the class info and super-class info
 at the first access to the Class. This method is thread-safe.
 
 @param cls A class.
 @return A class info, or nil if an error occurs.
 */
+ (nullable instancetype)classInfoWithClass:(Class)cls;

/**
 Get the class info of a specified Class.
 
 @discussion This method will cache the class info and super-class info
 at the first access to the Class. This method is thread-safe.
 
 @param className A class name.
 @return A class info, or nil if an error occurs.
 */
+ (nullable instancetype)classInfoWithClassName:(NSString *)className;

@end

NS_ASSUME_NONNULL_END
