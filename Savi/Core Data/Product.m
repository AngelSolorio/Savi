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
        self.manufacture_date = [attributes objectForKey:@"pres_tercero"];
    }
    self.company = [self fetchCompany:attributes];
    self.detail = [self fetchProductDetails:attributes];
    self.submission = [self fetchProductSubmission:attributes];
    self.review = [self fetchProductReview:attributes];
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
        review.date_third = [attributes objectForKey:@"some_tercero"];
    }
    if (![[attributes objectForKey:@"informe"] isKindOfClass:[NSNull class]]) {
        review.report = [attributes objectForKey:@"informe"];
    }
    if (![[attributes objectForKey:@"retro_ini"] isKindOfClass:[NSNull class]]) {
        review.retro_first = [attributes objectForKey:@"retro_ini"];
    }
    if (![[attributes objectForKey:@"retro_fin"] isKindOfClass:[NSNull class]]) {
        review.retro_last = [attributes objectForKey:@"retro_fin"];
    }
    if (![[attributes objectForKey:@"tercero"] isKindOfClass:[NSNull class]]) {
        review.third = [attributes objectForKey:@"tercero"];
    }
    
    return review;
}

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
        submission.prevention_date = [attributes objectForKey:@"prevencion"];
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
        productDetail.last_modified_date = [attributes objectForKey:@"f_ult_status"];
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
        key.unity = ([[keyDic objectForKey:@"unidades"]isKindOfClass:[NSNull class]]) ? nil: [keyDic objectForKey:@"unidades"];
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
