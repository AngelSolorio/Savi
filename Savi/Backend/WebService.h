//
//  WebService.h
//  Savi
//
//  Created by Sandra Guzman on 19/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface WebService : AFHTTPSessionManager

+ (WebService *)sharedClient;
- (NSURLSessionDataTask *)getAllCompanies_completion:(void (^)(NSDictionary *results, NSError *error))completion;
- (NSURLSessionDataTask *)getProductsByCompanyId:(NSInteger)companyId
                                    completion:(void (^)(NSDictionary *results, NSError *error))completion;
- (NSURLSessionDataTask *)getAllProducts_completion:(void (^)(NSDictionary *results, NSError *error))completion;

@end
