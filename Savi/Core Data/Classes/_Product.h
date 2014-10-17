// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Product.h instead.

#import <CoreData/CoreData.h>

extern const struct ProductAttributes {
	 __unsafe_unretained NSString *id_product;
	 __unsafe_unretained NSString *manufacture_date;
	 __unsafe_unretained NSString *name;
} ProductAttributes;

extern const struct ProductRelationships {
	 __unsafe_unretained NSString *company;
	 __unsafe_unretained NSString *detail;
	 __unsafe_unretained NSString *stages;
} ProductRelationships;

@class Company;
@class ProductDetail;
@class Stage;

@interface ProductID : NSManagedObjectID {}
@end

@interface _Product : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ProductID* objectID;

@property (nonatomic, retain) NSNumber* id_product;

@property (atomic) int16_t id_productValue;
- (int16_t)id_productValue;
- (void)setId_productValue:(int16_t)value_;

//- (BOOL)validateId_product:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSDate* manufacture_date;

//- (BOOL)validateManufacture_date:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) Company *company;

//- (BOOL)validateCompany:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) ProductDetail *detail;

//- (BOOL)validateDetail:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSSet *stages;

- (NSMutableSet*)stagesSet;

@end

@interface _Product (StagesCoreDataGeneratedAccessors)
- (void)addStages:(NSSet*)value_;
- (void)removeStages:(NSSet*)value_;
- (void)addStagesObject:(Stage*)value_;
- (void)removeStagesObject:(Stage*)value_;

@end

@interface _Product (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveId_product;
- (void)setPrimitiveId_product:(NSNumber*)value;

- (int16_t)primitiveId_productValue;
- (void)setPrimitiveId_productValue:(int16_t)value_;

- (NSDate*)primitiveManufacture_date;
- (void)setPrimitiveManufacture_date:(NSDate*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (Company*)primitiveCompany;
- (void)setPrimitiveCompany:(Company*)value;

- (ProductDetail*)primitiveDetail;
- (void)setPrimitiveDetail:(ProductDetail*)value;

- (NSMutableSet*)primitiveStages;
- (void)setPrimitiveStages:(NSMutableSet*)value;

@end
