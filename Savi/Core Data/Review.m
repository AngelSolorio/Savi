#import "Review.h"
#import "SaviDataModel.h"
#import "TypeDefs.h"

@interface Review ()

// Private interface goes here.

@end

@implementation Review

// Custom logic goes here.

+ (Review *)reviewForProductId:(NSInteger)productId {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Review entityName]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"product.id_product = %d", productId]];
    [fetchRequest setFetchLimit:1];

    NSError *error = nil;
    NSArray *results = [[[SaviDataModel sharedDataModel] mainContext] executeFetchRequest:fetchRequest error:&error];

    if (error) {
        NSLog(@"ERROR: %@ %@", [error localizedDescription], [error userInfo]);
        exit(1);
    }

    return (results.count > 0) ? results.firstObject : nil;
}

- (void)updateAttributes:(NSDictionary *)attributes forProduct:(Product *)product {
    self.cofepris = [attributes objectForKey:@"cofepris"];
    self.duration = [attributes objectForKey:@"duracion"];
    if (![[attributes objectForKey:@"some_tercero"] isKindOfClass:[NSNull class]]) {
        self.date_third = [Utility getDateFromString:[attributes objectForKey:@"some_tercero"] withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    }
    self.report = [attributes objectForKey:@"informe"];
    if (![[attributes objectForKey:@"retro_ini"] isKindOfClass:[NSNull class]]) {
        self.date_third = [Utility getDateFromString:[attributes objectForKey:@"retro_ini"] withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    }
    if (![[attributes objectForKey:@"retro_fin"] isKindOfClass:[NSNull class]]) {
        self.date_third = [Utility getDateFromString:[attributes objectForKey:@"retro_fin"] withFormat:TYPEDEFS_FORMATDATE_DAY_MONTH_YEAR];
    }
    self.third = [attributes objectForKey:@"tercero"];
    self.product = product;
}

@end
