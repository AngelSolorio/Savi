#import "ProductDetail.h"
#import "SaviDataModel.h"

@interface ProductDetail ()

// Private interface goes here.

@end

@implementation ProductDetail

// Custom logic goes here.

+ (ProductDetail *)productWithId:(NSInteger)productId {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[ProductDetail entityName]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"product.id_product = %d", productId]];
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

@end
