#import "_Company.h"

@interface Company : _Company {}
// Custom logic goes here.
+ (void)getAllCompanies_completion:(void (^)(NSArray *companiesArray, NSError *error))completion;

+ (Company *)companyWithId:(NSInteger)companyId
 usingManagedObjectContext:(NSManagedObjectContext *)moc;

- (void)updateAttributes:(NSDictionary *)attributes;


@end
