#import "Submission.h"
#import "SaviDataModel.h"

@interface Submission ()

// Private interface goes here.

@end

@implementation Submission

+ (Submission *)submissionWithId:(NSInteger)productId {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Submission entityName]];
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
