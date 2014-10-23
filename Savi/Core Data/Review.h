#import "_Review.h"

@interface Review : _Review {}
// Custom logic goes here.

+ (Review *)reviewForProductId:(NSInteger)productId;

- (void)updateAttributes:(NSDictionary *)attributes forProduct:(Product *)product;

@end
