//
//  Utility.h
//  Prosa
//
//  Created by Angel Solorio on 2/6/14.
//  Copyright (c) 2014 Angel Solorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTTAttributedLabel.h"

@interface Utility : NSObject

+ (NSString *)trimString:(NSString *)string;
+ (TTTAttributedLabel *)setAttributedTitle:(NSString *)string;
+ (NSString *)getTokenStringFromNSData:(NSData *)data;

+ (float)getDeviceiOSVersion;
+ (CGSize)getScreenSize;
+ (UIInterfaceOrientation)getOrientation;

+ (UIImage *)getScreenshot:(UIView *)view;

+ (UIImage *)getImageFromURLString:(NSString *)stringURL;
+ (UIImage *)getImageFrom64EncodedString:(NSString *)encodedString;
+ (UIImage *)getImageFromFileSystem:(NSString *)fileName;
+ (void)saveImageToFileSystem:(UIImage *)photo withFileName:(NSString *)fileName;

+ (NSString *)getFormattedStringFromValue:(id)value;

+ (NSDate *)getDateFromString:(NSString *)stringDate withFormat:(NSString *)format;
+ (NSString *)getStringFromDate:(NSDate *)date withFormat:(NSString *)format;
+ (NSString *)getStringFromDate:(NSDate *)date dateStyle:(NSUInteger)dateStyle timeStyle:(NSUInteger)timeStyle;

+ (NSString *)getCurrentLanguageCode;
+ (NSInteger)getCurrentLanguageID;

+ (NSString *)getHttpStringFromString:(NSString *)urlString;

+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length;

//+ (NSString *)localize:(NSString *)key;

@end
