#import "Product.h"
#import "ProductDetail.h"
#import "KeyDetail.h"
#import "WebService.h"
#import "SaviDataModel.h"
#import "TypeDefs.h"

@interface Product ()

// Private interface goes here.

@end

@implementation Product

// Custom logic goes here.

+ (Product *)productWithId:(NSInteger)productId {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Product entityName]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"id_product = %d", productId]];
    [fetchRequest setFetchLimit:1];

    NSError *error = nil;
    NSArray *results = [[[SaviDataModel sharedDataModel] mainContext] executeFetchRequest:fetchRequest error:&error];

    if (error) {
        NSLog(@"ERROR: %@ %@", [error localizedDescription], [error userInfo]);
        exit(1);
    }

    return (results.count > 0) ? results.firstObject : nil;
}

- (void)updateAttributes:(NSDictionary *)attributes {
    self.id_product = [NSNumber numberWithInteger:[[attributes objectForKey:@"id_producto"] integerValue]];
    self.name = [attributes objectForKey:@"producto"];
    self.stage = [attributes objectForKey:@"etapa"];
    if (![[attributes objectForKey:@"pres_tercero"] isKindOfClass:[NSNull class]]) {
        self.manufacture_date = [Utility getDateFromString:[attributes objectForKey:@"pres_tercero"] withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    }
    self.company = [self fetchCompany:attributes];
    self.detail = [self fetchProductDetails:attributes];

//    if ([self.stage isEqualToString:@"REVISION"]) {
//        [[WebService sharedClient] getRevisionDataForProduct:[self.id_product integerValue]
//                                                  completion:^(NSDictionary *results, NSError *error) {
//                                                      if ([results objectForKey:@"success"]) {
//                                                          self.review = [results objectForKey:@"review"];
//                                                      }
//                                                  }];
//    } else if ([self.stage isEqualToString:@"SOMETIMIENTO"]) {
//        //[[WebService sharedClient] getSubmissionDataForProduct:[self.id_product integerValue]];
//    }
}

- (Company *)fetchCompany:(NSDictionary *)attributes {
    NSManagedObjectContext *context = [[SaviDataModel sharedDataModel] mainContext];
    Company *company = [Company companyWithId:[[attributes objectForKey:@"id_empresa"] integerValue]];
    if (company == nil) {
        company = [Company insertInManagedObjectContext:context];
    }
    company.name = ([[attributes objectForKey:@"empresa"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"empresa"];

    return company;
}

- (ProductDetail *)fetchProductDetails:(NSDictionary *)attributes {
    NSManagedObjectContext *context = [[SaviDataModel sharedDataModel] mainContext];
    ProductDetail *productDetail = [ProductDetail productWithId:[[attributes objectForKey:@"id_producto"] integerValue]];
    if (productDetail == nil) {
        productDetail = [ProductDetail insertInManagedObjectContext:context];
    }
    productDetail.acond_pri = ([[attributes objectForKey:@"acond_pri"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"acond_pri"];
    productDetail.acond_sec = ([[attributes objectForKey:@"acond_sec"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"acond_sec"];
    productDetail.comment = ([[attributes objectForKey:@"comment"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"comment"];
    productDetail.fab_farmaco1 = ([[attributes objectForKey:@"farmaco1"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"farmaco1"];
    productDetail.fab_farmaco2 = ([[attributes objectForKey:@"farmaco2"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"farmaco2"];
    productDetail.fab_medic = ([[attributes objectForKey:@"medicamento"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"medicamento"];
    productDetail.juridica = ([[attributes objectForKey:@"juridica"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"juridica"];
    if (![[attributes objectForKey:@"f_ult_status"] isKindOfClass:[NSNull class]]) {
        productDetail.last_modified_date = [Utility getDateFromString:[attributes objectForKey:@"f_ult_status"] withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    }
    productDetail.medica = ([[attributes objectForKey:@"medica"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"medica"];
    productDetail.quimica = ([[attributes objectForKey:@"quimica"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"quimica"];
    productDetail.status = ([[attributes objectForKey:@"ult_status"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"ult_status"];
    productDetail.keys = [self fetchKeys:[attributes objectForKey:@"dclave"]];

    return productDetail;
}

- (NSSet *)fetchKeys:(NSDictionary *)attributes {
    NSMutableSet *keysSet = [NSMutableSet new];
    NSManagedObjectContext *context = [[SaviDataModel sharedDataModel] mainContext];
    for (NSDictionary *keyDic in attributes) {
        KeyDetail *key = [KeyDetail keyWithClave:[[keyDic objectForKey:@"clave"] integerValue]];
        if (key == nil) {
            key = [KeyDetail insertInManagedObjectContext:context];
            key.clave = [NSNumber numberWithInt:[[keyDic objectForKey:@"clave"] intValue]];
        }
        key.detail = ([[keyDic objectForKey:@"descripcion"] isKindOfClass:[NSNull class]]) ? nil : [keyDic objectForKey:@"descripcion"];
        key.laboratory = ([[keyDic objectForKey:@"laboratorios"] isKindOfClass:[NSNull class]]) ? nil : [keyDic objectForKey:@"laboratorios"];
        //key.unity = [keyDic objectForKey:@"unidades"];
        key.value = ([[keyDic objectForKey:@"valores"] isKindOfClass:[NSNull class]]) ? nil : [keyDic objectForKey:@"valores"];

        [keysSet addObject:key];
    }

    return keysSet;
}

+ (void)getAllProducts_completion:(void (^)(NSArray *productsArray, NSError *error))completion {
    [[WebService sharedClient] fetchAllProducts_completion:^(NSDictionary *results, NSError *error) {
        NSArray *products;
        if (!error && [[results objectForKey:@"products"] count] > 0) {
                products = [results objectForKey:@"products"];
        } else {
            products = [self getAllProducts];
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            completion(products, error);
        });
    }];
}

+ (void)getProductsWithCompanyId:(NSInteger)companyId
                      completion:(void (^)(NSArray *productsArray, NSError *error))completion {
    [[WebService sharedClient] getProductsByCompanyId:companyId completion:^(NSDictionary *results, NSError *error) {
        NSArray *products;
        if (!error) { // Invalid User Token
            if (![[results objectForKey:@"products"] isKindOfClass:[NSNull class]]) {
                products = [results objectForKey:@"products"];
            } else {
                products = [self getAllProductsWithCompany:companyId];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(products, error);
        });
    }];
}

+ (Product *)getProductCompanyId:(NSInteger)companyId
                    andProductId:(NSInteger)productId{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Product entityName]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"company.id_company = %d AND id_product = %d", companyId, productId]];
    [fetchRequest setFetchLimit:1];
    
    NSError *error = nil;
    NSArray *results = [[[SaviDataModel sharedDataModel] mainContext] executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"ERROR: %@ %@", [error localizedDescription], [error userInfo]);
        exit(1);
    }
    
    if ([results count] == 0) {
        return nil;
    }
    
    return [results firstObject];
}

+ (NSArray *)getAllProductsWithCompany:(NSInteger)companyId {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Product entityName]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"company.id_company = %d", companyId]];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"id_product" ascending:YES];
    fetchRequest.sortDescriptors = [[NSArray alloc] initWithObjects: descriptor, nil];
    
    NSError *error = nil;
    NSArray *results = [[[SaviDataModel sharedDataModel] mainContext] executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"ERROR: %@ %@", [error localizedDescription], [error userInfo]);
        exit(1);
    }
    
    if ([results count] == 0) {
        return nil;
    }
    
    return results;
}

+ (NSArray *)getAllProducts {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Product entityName]];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"id_product" ascending:YES];
    fetchRequest.sortDescriptors = [[NSArray alloc] initWithObjects: descriptor, nil];
    
    NSError *error = nil;
    NSArray *results = [[[SaviDataModel sharedDataModel] mainContext] executeFetchRequest:fetchRequest error:&error];
    
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
