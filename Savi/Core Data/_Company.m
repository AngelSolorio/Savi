// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Company.m instead.

#import "_Company.h"

const struct CompanyAttributes CompanyAttributes = {
	.id_company = @"id_company",
	.name = @"name",
};

const struct CompanyRelationships CompanyRelationships = {
	.products = @"products",
};

@implementation CompanyID
@end

@implementation _Company

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Company";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Company" inManagedObjectContext:moc_];
}

- (CompanyID*)objectID {
	return (CompanyID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"id_companyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id_company"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic id_company;

- (int16_t)id_companyValue {
	NSNumber *result = [self id_company];
	return [result shortValue];
}

- (void)setId_companyValue:(int16_t)value_ {
	[self setId_company:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveId_companyValue {
	NSNumber *result = [self primitiveId_company];
	return [result shortValue];
}

- (void)setPrimitiveId_companyValue:(int16_t)value_ {
	[self setPrimitiveId_company:[NSNumber numberWithShort:value_]];
}

@dynamic name;

@dynamic products;

- (NSMutableSet*)productsSet {
	[self willAccessValueForKey:@"products"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"products"];

	[self didAccessValueForKey:@"products"];
	return result;
}

@end

