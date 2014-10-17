// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Product.m instead.

#import "_Product.h"

const struct ProductAttributes ProductAttributes = {
	.id_product = @"id_product",
	.manufacture_date = @"manufacture_date",
	.name = @"name",
};

const struct ProductRelationships ProductRelationships = {
	.company = @"company",
	.detail = @"detail",
	.stages = @"stages",
};

@implementation ProductID
@end

@implementation _Product

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Product";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Product" inManagedObjectContext:moc_];
}

- (ProductID*)objectID {
	return (ProductID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"id_productValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id_product"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic id_product;

- (int16_t)id_productValue {
	NSNumber *result = [self id_product];
	return [result shortValue];
}

- (void)setId_productValue:(int16_t)value_ {
	[self setId_product:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveId_productValue {
	NSNumber *result = [self primitiveId_product];
	return [result shortValue];
}

- (void)setPrimitiveId_productValue:(int16_t)value_ {
	[self setPrimitiveId_product:[NSNumber numberWithShort:value_]];
}

@dynamic manufacture_date;

@dynamic name;

@dynamic company;

@dynamic detail;

@dynamic stages;

- (NSMutableSet*)stagesSet {
	[self willAccessValueForKey:@"stages"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"stages"];

	[self didAccessValueForKey:@"stages"];
	return result;
}

@end

