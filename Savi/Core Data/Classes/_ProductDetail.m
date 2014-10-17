// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ProductDetail.m instead.

#import "_ProductDetail.h"

const struct ProductDetailAttributes ProductDetailAttributes = {
	.acond_pri = @"acond_pri",
	.acond_sec = @"acond_sec",
	.comment = @"comment",
	.fab_farmaco1 = @"fab_farmaco1",
	.fab_farmaco2 = @"fab_farmaco2",
	.fab_medic = @"fab_medic",
	.juridica = @"juridica",
	.last_modified_date = @"last_modified_date",
	.medica = @"medica",
	.quimica = @"quimica",
	.status = @"status",
};

const struct ProductDetailRelationships ProductDetailRelationships = {
	.keys = @"keys",
	.product = @"product",
};

@implementation ProductDetailID
@end

@implementation _ProductDetail

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ProductDetail" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ProductDetail";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ProductDetail" inManagedObjectContext:moc_];
}

- (ProductDetailID*)objectID {
	return (ProductDetailID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic acond_pri;

@dynamic acond_sec;

@dynamic comment;

@dynamic fab_farmaco1;

@dynamic fab_farmaco2;

@dynamic fab_medic;

@dynamic juridica;

@dynamic last_modified_date;

@dynamic medica;

@dynamic quimica;

@dynamic status;

@dynamic keys;

- (NSMutableSet*)keysSet {
	[self willAccessValueForKey:@"keys"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"keys"];

	[self didAccessValueForKey:@"keys"];
	return result;
}

@dynamic product;

@end

