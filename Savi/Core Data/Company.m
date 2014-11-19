#import "Company.h"
#import "WebService.h"
#import "SaviDataModel.h"

@interface Company ()

// Private interface goes here.

@end

@implementation Company

// Custom logic goes here.

+ (void)getAllCompanies_completion:(void (^)(NSArray *companiesArray, NSError *error))completion {
    [[WebService sharedClient] getAllCompanies_completion:^(NSDictionary *results, NSError *error) {
        NSArray *companies;
        if (!error &&  [[results objectForKey:@"companies"] count] > 0) {
            companies = [results objectForKey:@"companies"];
        } else {
            companies = [self getAllCompanies];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(companies, error);
        });
    }];
}


+ (NSArray *)getAllCompanies {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Company entityName]];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
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


+ (Company *)companyWithId:(NSInteger)companyId {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Company entityName]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"id_company = %d", companyId]];
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


- (void)updateAttributes:(NSDictionary *)attributes {
    self.id_company = [NSNumber numberWithInteger:[[attributes objectForKey:@"id_empresa"] intValue]];
    self.name = [attributes objectForKey:@"empresa"];
}


@end
