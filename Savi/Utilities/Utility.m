//
//  Utility.m
//  Prosa
//
//  Created by Angel Solorio on 2/6/14.
//  Copyright (c) 2014 Angel Solorio. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (NSString *)trimString:(NSString *)string {
    return [string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
}

// Returns an attributed title
+ (TTTAttributedLabel *)setAttributedTitle:(NSString *)string {
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:string];

    // font for all string
    UIFont *regularFont = [UIFont fontWithName:@"Helvetica" size:18.0];
    CTFontRef font_2 = CTFontCreateWithName((__bridge CFStringRef)regularFont.fontName, regularFont.pointSize, NULL);
    [titleString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font_2 range:[string rangeOfString:string]];

    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    label.attributedText = titleString;
    [label sizeToFit];

    return label;
}

// Returns a nsstring token formated from a nsdata
+ (NSString *)getTokenStringFromNSData:(NSData *)data {
    NSCharacterSet *angleBrackets = [NSCharacterSet characterSetWithCharactersInString:@" <> "];
    NSString *token = [[data description] stringByTrimmingCharactersInSet:angleBrackets];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    return token;
}

// Gets the iOS version running on this device
+ (float)getDeviceiOSVersion {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

// Gets the current screen size
+ (CGSize)getScreenSize {
    CGRect rectDevice = [[UIScreen mainScreen] bounds];
    return rectDevice.size;
}

// Gets the current orientation
+ (UIInterfaceOrientation)getOrientation {
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    return interfaceOrientation;
}

// Get an screenshot
+ (UIImage *)getScreenshot:(UIView *)view {
    UIGraphicsBeginImageContext(view.frame.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return viewImage;
}

// Gets a UIImage from a URL
+ (UIImage *)getImageFromURLString:(NSString *)stringURL {
    if (stringURL != nil || [stringURL length] > 0) {
        NSURL *url = [NSURL URLWithString:stringURL];
        NSData *dataImage = [[NSData alloc] initWithContentsOfURL:url];
        UIImage *photo = [[UIImage alloc] initWithData:dataImage];
        return photo;
    }
    return  nil;
}

// Gets a UIImage from an encoded string
+ (UIImage *)getImageFrom64EncodedString:(NSString *)encodedString {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:encodedString
                                                       options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

// Saves an image to the File System
+ (UIImage *)getImageFromFileSystem:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;

    return [UIImage imageWithContentsOfFile:[basePath stringByAppendingPathComponent:fileName]];
}

// Saves an image to the File System
+ (void)saveImageToFileSystem:(UIImage *)photo withFileName:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;

    UIImage *imageToSave = photo;
    NSData *binaryImageData = UIImagePNGRepresentation(imageToSave);

    [binaryImageData writeToFile:[basePath stringByAppendingPathComponent:fileName] atomically:YES];
}

// Gets a NSDate value from a NSString
+ (NSDate *)getDateFromString:(NSString *)stringDate withFormat:(NSString *)format {
    if (![stringDate isKindOfClass:[NSNull class]] && stringDate != nil && ![stringDate isEqualToString:@""]) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:format];
        NSDate *myDate = [dateFormat dateFromString:stringDate];
        return myDate;
    }
    return nil;
}

// Gets a  NSString from a NSDate value
+ (NSString *)getStringFromDate:(NSDate *)date withFormat:(NSString *)format {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];

    NSString *strinDate = (date == NULL || date == nil) ? @"" : [dateFormat stringFromDate:date];

    return strinDate;
}

// Gets a  NSString from a NSDate value
+ (NSString *)getStringFromDate:(NSDate *)date dateStyle:(NSUInteger)dateStyle timeStyle:(NSUInteger)timeStyle {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateStyle:dateStyle];
    [dateFormat setTimeStyle:timeStyle];

    NSString *strinDate = [dateFormat stringFromDate:date];

    return strinDate;
}

// Gets a formatted string from a nsnumber or nsstring
+ (NSString *)getFormattedStringFromValue:(id)value {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];

    NSString *groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    [formatter setGroupingSeparator:groupingSeparator];
    [formatter setGroupingSize:3];
    [formatter setSecondaryGroupingSize:3];

    if ([value isKindOfClass:[NSString class]]) {
        NSNumber *myNumber = [formatter numberFromString:value];
        return [formatter stringFromNumber:myNumber];
    } else if ([value isKindOfClass:[NSNumber class]]) {
        return [formatter stringFromNumber:value];
    } else {
        return [formatter stringForObjectValue:value];
    }
}

// Gets a NSString with the current language code of the App
+ (NSString *)getCurrentLanguageCode {
    NSArray *languages = [[NSArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]];
    return (languages.count > 0) ? [languages firstObject] : @"";
}

// Gets an NSInteger with the current language identifier of the App
+ (NSInteger)getCurrentLanguageID {
    NSArray *languages = [[NSArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]];
    if ([[languages firstObject] isEqualToString:@"en"]) {
        return 2;
    } else {
        return 1;
    }
}

// Gets an URL NSString with the corresponding HTPP:// or HTPP:// initial substring
+ (NSString *)getHttpStringFromString:(NSString *)urlString {
    if ([[urlString substringToIndex:7].lowercaseString isEqualToString:@"http://"] || [[urlString substringToIndex:8].lowercaseString isEqualToString:@"https://"]) {
        return urlString;
    } else {
        return [@"http://" stringByAppendingString:(urlString != nil) ? urlString : @""];
    }
}


+ (UIColor *)colorWithHexString: (NSString *)hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}


@end
