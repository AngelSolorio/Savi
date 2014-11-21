#import "_Product.h"
#import "Company.h"
#import "Utility.h"

@interface Product : _Product {}

+ (Product *)productWithId:(NSInteger)productId;

- (void)updateAttributes:(NSDictionary *)attributes;

+ (void)getAllProducts_completion:(void (^)(NSArray *productsArray, NSError *error))completion;

+ (NSArray *)getAllProducts;

@end
