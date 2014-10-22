// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Submission.m instead.

#import "_Submission.h"

const struct SubmissionAttributes SubmissionAttributes = {
	.cofepris = @"cofepris",
	.duration = @"duration",
	.prevention_date = @"prevention_date",
	.registration = @"registration",
};

const struct SubmissionRelationships SubmissionRelationships = {
	.product = @"product",
};

@implementation SubmissionID
@end

@implementation _Submission

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Submission" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Submission";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Submission" inManagedObjectContext:moc_];
}

- (SubmissionID*)objectID {
	return (SubmissionID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic cofepris;

@dynamic duration;

@dynamic prevention_date;

@dynamic registration;

@dynamic product;

@end

