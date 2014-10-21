#import "_Product.h"
#import "Company.h"
#import "Utility.h"

@interface Product : _Product {}

+ (Product *)productWithId:(NSInteger)productId;

- (void)updateAttributes:(NSDictionary *)attributes;

+ (void)getAllProducts_completion:(void (^)(NSArray *productsArray, NSError *error))completion;

+ (void)getProductsWithCompanyId:(NSInteger)companyId
                      completion:(void (^)(NSArray *productsArray, NSError *error))completion;

+ (Product *)getProductCompanyId:(NSInteger)companyId
                    andProductId:(NSInteger)productId;

+ (NSArray *)getAllProductsWithCompany:(NSInteger)companyId;

+ (NSArray *)getAllProducts;

@end
