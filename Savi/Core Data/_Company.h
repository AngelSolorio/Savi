// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Company.h instead.

#import <CoreData/CoreData.h>

extern const struct CompanyAttributes {
	 __unsafe_unretained NSString *id_company;
	 __unsafe_unretained NSString *name;
} CompanyAttributes;

extern const struct CompanyRelationships {
	 __unsafe_unretained NSString *products;
} CompanyRelationships;

@class Product;

@interface CompanyID : NSManagedObjectID {}
@end

@interface _Company : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CompanyID* objectID;

@property (nonatomic, retain) NSNumber* id_company;

@property (atomic) int16_t id_companyValue;
- (int16_t)id_companyValue;
- (void)setId_companyValue:(int16_t)value_;

//- (BOOL)validateId_company:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSSet *products;

- (NSMutableSet*)productsSet;

@end

@interface _Company (ProductsCoreDataGeneratedAccessors)
- (void)addProducts:(NSSet*)value_;
- (void)removeProducts:(NSSet*)value_;
- (void)addProductsObject:(Product*)value_;
- (void)removeProductsObject:(Product*)value_;

@end

@interface _Company (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveId_company;
- (void)setPrimitiveId_company:(NSNumber*)value;

- (int16_t)primitiveId_companyValue;
- (void)setPrimitiveId_companyValue:(int16_t)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveProducts;
- (void)setPrimitiveProducts:(NSMutableSet*)value;

@end
