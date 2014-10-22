#import "KeyDetail.h"
#import "SaviDataModel.h"

@interface KeyDetail ()

// Private interface goes here.

@end

@implementation KeyDetail

// Custom logic goes here.

+ (KeyDetail *)keyWithClave:(NSInteger)clave {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[KeyDetail entityName]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"clave = %d", clave]];
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
