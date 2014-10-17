// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Stage.m instead.

#import "_Stage.h"

const struct StageAttributes StageAttributes = {
	.name = @"name",
};

const struct StageRelationships StageRelationships = {
	.product = @"product",
	.review = @"review",
	.submission = @"submission",
};

@implementation StageID
@end

@implementation _Stage

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Stage" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Stage";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Stage" inManagedObjectContext:moc_];
}

- (StageID*)objectID {
	return (StageID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic product;

@dynamic review;

@dynamic submission;

@end

