#import "Product.h"
#import "ProductDetail.h"
#import "KeyDetail.h"
#import "WebService.h"
#import "SaviDataModel.h"
#import "TypeDefs.h"
#import "Submission.h"
#import "Review.h"

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
    self.submission = [self fetchProductSubmission:attributes];
    self.review = [self fetchProductReview:attributes];

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

- (Review *)fetchProductReview:(NSDictionary *)attributes {
    NSManagedObjectContext *context = [[SaviDataModel sharedDataModel] mainContext];
    Review *review = [Review reviewForProductId:(int)self.id_product];
    if (review == nil) {
        review = [Review insertInManagedObjectContext:context];
    }
    
    review.product = self;
    
    if (![[attributes objectForKey:@"cofepris"] isKindOfClass:[NSNull class]]) {
        review.cofepris = [attributes objectForKey:@"cofepris"];
    }
    if (![[attributes objectForKey:@"duracion"] isKindOfClass:[NSNull class]]) {
        review.duration = [attributes objectForKey:@"duracion"];
    }
    if (![[attributes objectForKey:@"some_tercero"] isKindOfClass:[NSNull class]]) {
        review.date_third = [Utility getDateFromString:[attributes objectForKey:@"some_tercero"] withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    }
    if (![[attributes objectForKey:@"informe"] isKindOfClass:[NSNull class]]) {
        review.report = [attributes objectForKey:@"informe"];
    }
    if (![[attributes objectForKey:@"retro_ini"] isKindOfClass:[NSNull class]]) {
        review.retro_first = [Utility getDateFromString:[attributes objectForKey:@"retro_ini"] withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    }
    if (![[attributes objectForKey:@"retro_fin"] isKindOfClass:[NSNull class]]) {
        review.retro_last = [Utility getDateFromString:[attributes objectForKey:@"retro_fin"] withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    }
    if (![[attributes objectForKey:@"tercero"] isKindOfClass:[NSNull class]]) {
        review.third = [attributes objectForKey:@"tercero"];
    }
    
    return review;
}

// Custom logic goes here.
- (Submission *)fetchProductSubmission:(NSDictionary *)attributes {
    NSManagedObjectContext *context = [[SaviDataModel sharedDataModel] mainContext];
    Submission *submission = [Submission submissionWithId:(int)self.id_product];
    if (submission == nil) {
        submission = [Submission insertInManagedObjectContext:context];
    }
    
    submission.product = self;
    
    if (![[attributes objectForKey:@"cofepris"] isKindOfClass:[NSNull class]]) {
        submission.cofepris = [attributes objectForKey:@"cofepris"];
    }
    if (![[attributes objectForKey:@"duracion"] isKindOfClass:[NSNull class]]) {
        submission.duration = [attributes objectForKey:@"duracion"];
    }
    
    if (![[attributes objectForKey:@"prevencion"] isKindOfClass:[NSNull class]]) {
        submission.prevention_date = [Utility getDateFromString:[attributes objectForKey:@"prevencion"] withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    }
    
    if (![[attributes objectForKey:@"registro"] isKindOfClass:[NSNull class]]) {
        submission.registration = [attributes objectForKey:@"registro"];
    }
    
    return submission;
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
    productDetail.comment = ([[attributes objectForKey:@"comentario"] isKindOfClass:[NSNull class]]) ? nil : [attributes objectForKey:@"comentario"];
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

    NSLog(@"producto descripcion %@", [productDetail description]);
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
        key.unity = ([[keyDic objectForKey:@"unidades"]isKindOfClass:[NSNull class]]) ? 0 : [NSNumber numberWithInt:[[keyDic objectForKey:@"unidades"] intValue]];
        key.value = ([[keyDic objectForKey:@"valores"] isKindOfClass:[NSNull class]]) ? nil : [keyDic objectForKey:@"valores"];

        [keysSet addObject:key];
    }

    return keysSet;
}

+ (void)getAllProducts_completion:(void (^)(NSArray *productsArray, NSError *error))completion {
    [[WebService sharedClient] fetchAllProducts_completion:^(NSDictionary *results, NSError *error) {
        NSArray *products;
        if (!error) {
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

- (ProductID*)objectID {
    return (ProductID*)[super objectID];
}

@end
