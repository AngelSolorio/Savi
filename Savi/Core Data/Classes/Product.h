#import "_Product.h"

@interface Product : _Product {}
// Custom logic goes here.
+ (void)getAllProducts_completion:(void (^)(NSArray *productsArray, NSError *error))completion;

+ (void)getProductsWithCompanyId:(NSInteger)companyId
                      completion:(void (^)(NSArray *productsArray, NSError *error))completion;

+ (Product *)getProductCompanyId:(NSInteger)companyId
                    andProductId:(NSInteger)productId
       usingManagedObjectContext:(NSManagedObjectContext *)moc;
@end
