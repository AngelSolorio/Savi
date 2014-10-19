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
        if (!error) { // Invalid User Token
            if (![[results objectForKey:@"companies"] isKindOfClass:[NSNull class]]) {
                companies = [results objectForKey:@"companies"];
            } else {
                companies = [self getAllCompanies_usingManagedObjectContext:[[SaviDataModel sharedDataModel] mainContext]];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(companies, error);
        });
    }];
}

+ (NSArray *)getAllCompanies_usingManagedObjectContext:(NSManagedObjectContext *)moc {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Company entityName]];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"id_company" ascending:YES];
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

+ (Company *)companyWithId:(NSInteger)companyId usingManagedObjectContext:(NSManagedObjectContext *)moc {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Company entityName]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"id_company = %d", companyId]];
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

- (void)updateAttributes:(NSDictionary *)attributes {
    self.id_company = [NSNumber numberWithInteger:[[attributes objectForKey:@"id_empresa"] intValue]];
    self.name = [attributes objectForKey:@"empresa"];
}

@end
