// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Review.m instead.

#import "_Review.h"

const struct ReviewAttributes ReviewAttributes = {
	.cofepris = @"cofepris",
	.date_third = @"date_third",
	.duration = @"duration",
	.report = @"report",
	.retro_first = @"retro_first",
	.retro_last = @"retro_last",
	.third = @"third",
};

const struct ReviewRelationships ReviewRelationships = {
	.stage = @"stage",
};

@implementation ReviewID
@end

@implementation _Review

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Review" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Review";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Review" inManagedObjectContext:moc_];
}

- (ReviewID*)objectID {
	return (ReviewID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic cofepris;

@dynamic date_third;

@dynamic duration;

@dynamic report;

@dynamic retro_first;

@dynamic retro_last;

@dynamic third;

@dynamic stage;

@end

