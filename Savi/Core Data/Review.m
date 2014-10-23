#import "Review.h"
#import "SaviDataModel.h"

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
    self.date_third = [attributes objectForKey:@"some_tercero"];
    self.report = [attributes objectForKey:@"informe"];
    self.retro_first = [attributes objectForKey:@"retro_ini"];
    self.retro_last = [attributes objectForKey:@"retro_fin"];
    self.third = [attributes objectForKey:@"tercero"];
    self.product = product;
}

@end
