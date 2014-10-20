#import "Product.h"
#import "WebService.h"
#import "SaviDataModel.h"

@interface Product ()

// Private interface goes here.

@end

@implementation Product
// Custom logic goes here.
+ (void)getAllProducts_completion:(void (^)(NSArray *productsArray, NSError *error))completion {
    [[WebService sharedClient] getAllProducts_completion:^(NSDictionary *results, NSError *error) {
        NSArray *companies;
        if (!error) { // Invalid User Token
            if (![[results objectForKey:@"products"] isKindOfClass:[NSNull class]]) {
                companies = [results objectForKey:@"products"];
            } else {
                companies = [self getAllProducts_usingManagedObjectContext:[[SaviDataModel sharedDataModel] mainContext]];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(companies, error);
        });
    }];
}

+ (void)getProductsWithCompanyId:(NSInteger)companyId
                      completion:(void (^)(NSArray *productsArray, NSError *error))completion {
    [[WebService sharedClient]getProductsCompanyId:companyId completion:^(NSDictionary *results, NSError *error) {
        NSArray *products;
        if (!error) { // Invalid User Token
            if (![[results objectForKey:@"products"] isKindOfClass:[NSNull class]]) {
                products = [results objectForKey:@"products"];
            } else {
                products = [self getAllProductsWithCompany:companyId usingManagedObjectContext:[[SaviDataModel sharedDataModel] mainContext]];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(products, error);
        });
    }];
}

+ (Product *)getProductCompanyId:(NSInteger)companyId
                    andProductId:(NSInteger)productId
       usingManagedObjectContext:(NSManagedObjectContext *)moc {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Product entityName]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"company.id_company = %d AND id_product = %d", companyId, productId]];
    [fetchRequest setFetchLimit:1];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"ERROR: %@ %@", [error localizedDescription], [error userInfo]);
        exit(1);
    }
    
    if ([results count] == 0) {
        return nil;
    }
    
    return [results firstObject];
}

+ (NSArray *)getAllProductsWithCompany:(NSInteger)companyId
             usingManagedObjectContext:(NSManagedObjectContext *)moc {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Product entityName]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"company.id_company = %d", companyId]];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"id_product" ascending:YES];
    fetchRequest.sortDescriptors = [[NSArray alloc] initWithObjects: descriptor, nil];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"ERROR: %@ %@", [error localizedDescription], [error userInfo]);
        exit(1);
    }
    
    if ([results count] == 0) {
        return nil;
    }
    
    return results;
}

+ (NSArray *)getAllProducts_usingManagedObjectContext:(NSManagedObjectContext *)moc {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Product entityName]];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"id_product" ascending:YES];
    fetchRequest.sortDescriptors = [[NSArray alloc] initWithObjects: descriptor, nil];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"ERROR: %@ %@", [error localizedDescription], [error userInfo]);
        exit(1);
    }
    
    if ([results count] == 0) {
        return nil;
    }
    
    return results;
}

@end
