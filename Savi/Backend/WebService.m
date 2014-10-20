//
//  WebService.m
//  Savi
//
//  Created by Sandra Guzman on 19/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "WebService.h"
#import "SaviDataModel.h"
#import "Company.h"
#import "Product.h"

#define kBASE_URL @"http://187.237.42.162:8880/savi/api.php"

@implementation WebService

+ (WebService *)sharedClient {
    static WebService *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{@"Content-Type" : @"application/x-www-form-urlencoded"}];
        
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                          diskCapacity:50 * 1024 * 1024
                                                              diskPath:nil];
        
        [config setURLCache:cache];
        [config setTimeoutIntervalForRequest:20];
        
        _sharedClient = [[WebService alloc] initWithSessionConfiguration:config];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    
    return _sharedClient;
}

- (NSURLSessionDataTask *)getAllCompanies_completion:(void (^)(NSDictionary *results, NSError *error))completion {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setValue:@"get_empresas" forKey:@"request"];
    NSURLSessionDataTask *task = [self POST:kBASE_URL
                                 parameters:parameters
                                    success:^(NSURLSessionDataTask *task, id responseObject) {
                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
                                        if (httpResponse.statusCode == 200) {
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                if ([[responseObject valueForKey:@"success"] boolValue]) {
                                                    completion([self parseCompany:responseObject], nil);
                                                } else {
                                                    NSError *error = [NSError errorWithDomain:@"Invalid User Token" code:99 userInfo:nil];
                                                    if ([[responseObject valueForKey:@"error"] isEqualToString:error.domain]) {
                                                        completion(responseObject, error);
                                                    } else {
                                                        completion(responseObject, nil);
                                                    }
                                                }
                                            });
                                        } else {
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                NSLog(@"Received HTTP %ld", (long)httpResponse.statusCode);
                                                completion(nil, nil);
                                            });
                                        }
                                    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            completion(nil, error);
                                        });
                                    }];
    return task;
}

- (NSURLSessionDataTask *)getAllProducts_completion:(void (^)(NSDictionary *results, NSError *error))completion {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setValue:@"get_products" forKey:@"request"];
    NSURLSessionDataTask *task = [self POST:kBASE_URL
                                 parameters:parameters
                                    success:^(NSURLSessionDataTask *task, id responseObject) {
                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
                                        if (httpResponse.statusCode == 200) {
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                if ([[responseObject valueForKey:@"success"] boolValue]) {
                                                    completion([self parseProduct:responseObject], nil);
                                                } else {
                                                    NSError *error = [NSError errorWithDomain:@"Invalid User Token" code:99 userInfo:nil];
                                                    if ([[responseObject valueForKey:@"error"] isEqualToString:error.domain]) {
                                                        completion(responseObject, error);
                                                    } else {
                                                        completion(responseObject, nil);
                                                    }
                                                }
                                            });
                                        } else {
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                NSLog(@"Received HTTP %ld", (long)httpResponse.statusCode);
                                                completion(nil, nil);
                                            });
                                        }
                                    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            completion(nil, error);
                                        });
                                    }];
    return task;
}

- (NSURLSessionDataTask *)getProductsCompanyId:(NSInteger)companyId
                                    completion:(void (^)(NSDictionary *results, NSError *error))completion {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setValue:@"get_empresa_products" forKey:@"request"];
    [parameters setValue:[NSNumber numberWithInteger:companyId] forKey:@"id_empresa"];
    NSURLSessionDataTask *task = [self POST:kBASE_URL
                                 parameters:parameters
                                    success:^(NSURLSessionDataTask *task, id responseObject) {
                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
                                        if (httpResponse.statusCode == 200) {
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                if ([[responseObject valueForKey:@"success"] boolValue]) {
                                                    completion([self parseProduct:responseObject], nil);
                                                } else {
                                                    NSError *error = [NSError errorWithDomain:@"Invalid User Token" code:99 userInfo:nil];
                                                    if ([[responseObject valueForKey:@"error"] isEqualToString:error.domain]) {
                                                        completion(responseObject, error);
                                                    } else {
                                                        completion(responseObject, nil);
                                                    }
                                                }
                                            });
                                        } else {
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                NSLog(@"Received HTTP %ld", (long)httpResponse.statusCode);
                                                completion(nil, nil);
                                            });
                                        }
                                    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            completion(nil, error);
                                        });
                                    }];
    return task;
}


#pragma mark - Parsing Methods

- (NSDictionary *)parseCompany:(id)response {
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    // Gets all the companies
    if (![[response objectForKey:@"empresas"] isKindOfClass:[NSNull class]]) {
        NSManagedObjectContext *context = [[SaviDataModel sharedDataModel] mainContext];
        NSMutableArray *companiesArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *item in [response objectForKey:@"empresas"]) {
            NSInteger companyId = [[item objectForKey:@"id_empresa"] intValue];
            Company *company = [Company companyWithId:companyId];
            
            if (company == nil) {
                company = [Company insertInManagedObjectContext:context];
            }
            
            [company updateAttributes:item];
            [companiesArray addObject:company];
        }
        
        NSError *errorFecth = nil;
        if ([context save:&errorFecth]) {
            NSLog(@"COMPANY: Core Data saved successfuly");
        } else {
            NSLog(@"ERROR: %@ %@", [errorFecth localizedDescription], [errorFecth userInfo]);
            exit(1);
        }
        
        [results setValue:@"true" forKey:@"success"];
        [results setValue:companiesArray forKey:@"companies"];
        [results setValue:errorFecth forKey:@"error"];
        
    } else {
        [results setValue:@"false" forKey:@"success"];
    }
    
    return results;
}

- (NSDictionary *)parseProduct:(id)response {
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    // Gets all the products
    if (![[response objectForKey:@"productos"] isKindOfClass:[NSNull class]]) {
        NSManagedObjectContext *context = [[SaviDataModel sharedDataModel] mainContext];
        NSMutableArray *productsArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *item in [response objectForKey:@"productos"]) {
            Product *product = [Product getProductCompanyId:[[item objectForKey:@"id_empresa"] intValue]
                                               andProductId:[[item objectForKey:@"id_producto"] intValue]];
            if (product == nil) {
                NSInteger companyId = [[item objectForKey:@"id_empresa"] intValue];
                Company *company = [Company companyWithId:companyId];
                product = [Product insertInManagedObjectContext:context];
                [product setCompany:company];
            }
            
            product.id_product = [NSNumber numberWithInt:[[item objectForKey:@"id_producto"] intValue]];
            product.name = [item objectForKey:@"producto"];
            
            if (![[item objectForKey:@"fecha_desarrollo"] isEqualToString:@""]) {
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                [formatter setDateFormat:@"dd-MMM-yyyy"];
                NSDate *date = [formatter dateFromString:[item objectForKey:@"fecha_desarrollo"]];
                product.manufacture_date = date;
            }
            
            [productsArray addObject:product];
        }
        
        NSError *errorFecth = nil;
        if ([context save:&errorFecth]) {
            NSLog(@"COMPANY-PRODUCTS: Core Data saved successfuly");
        } else {
            NSLog(@"ERROR: %@ %@", [errorFecth localizedDescription], [errorFecth userInfo]);
            exit(1);
        }
        
        [results setValue:@"true" forKey:@"success"];
        [results setValue:productsArray forKey:@"products"];
        [results setValue:errorFecth forKey:@"error"];
        
    } else {
        [results setValue:@"false" forKey:@"success"];
    }
    return results;
}

@end
