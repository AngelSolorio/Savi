// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KeyDetail.m instead.

#import "_KeyDetail.h"

const struct KeyDetailAttributes KeyDetailAttributes = {
	.clave = @"clave",
	.detail = @"detail",
	.laboratory = @"laboratory",
	.unity = @"unity",
	.value = @"value",
};

const struct KeyDetailRelationships KeyDetailRelationships = {
	.productDetail = @"productDetail",
};

@implementation KeyDetailID
@end

@implementation _KeyDetail

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"KeyDetail" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"KeyDetail";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"KeyDetail" inManagedObjectContext:moc_];
}

- (KeyDetailID*)objectID {
	return (KeyDetailID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"claveValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"clave"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic clave;

- (int16_t)claveValue {
	NSNumber *result = [self clave];
	return [result shortValue];
}

- (void)setClaveValue:(int16_t)value_ {
	[self setClave:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveClaveValue {
	NSNumber *result = [self primitiveClave];
	return [result shortValue];
}

- (void)setPrimitiveClaveValue:(int16_t)value_ {
	[self setPrimitiveClave:[NSNumber numberWithShort:value_]];
}

@dynamic detail;

@dynamic laboratory;

@dynamic unity;

@dynamic value;

@dynamic productDetail;

@end

