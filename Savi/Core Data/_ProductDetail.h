// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ProductDetail.h instead.

#import <CoreData/CoreData.h>

extern const struct ProductDetailAttributes {
	__unsafe_unretained NSString *acond_pri;
	__unsafe_unretained NSString *acond_sec;
	__unsafe_unretained NSString *comment;
	__unsafe_unretained NSString *fab_farmaco1;
	__unsafe_unretained NSString *fab_farmaco2;
	__unsafe_unretained NSString *fab_medic;
	__unsafe_unretained NSString *juridica;
	__unsafe_unretained NSString *last_modified_date;
	__unsafe_unretained NSString *medica;
	__unsafe_unretained NSString *quimica;
	__unsafe_unretained NSString *status;
} ProductDetailAttributes;

extern const struct ProductDetailRelationships {
	__unsafe_unretained NSString *keys;
	__unsafe_unretained NSString *product;
} ProductDetailRelationships;

@class KeyDetail;
@class Product;

@interface ProductDetailID : NSManagedObjectID {}
@end

@interface _ProductDetail : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ProductDetailID* objectID;

@property (nonatomic, strong) NSString* acond_pri;

//- (BOOL)validateAcond_pri:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* acond_sec;

//- (BOOL)validateAcond_sec:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* comment;

//- (BOOL)validateComment:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* fab_farmaco1;

//- (BOOL)validateFab_farmaco1:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* fab_farmaco2;

//- (BOOL)validateFab_farmaco2:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* fab_medic;

//- (BOOL)validateFab_medic:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* juridica;

//- (BOOL)validateJuridica:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* last_modified_date;

//- (BOOL)validateLast_modified_date:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* medica;

//- (BOOL)validateMedica:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* quimica;

//- (BOOL)validateQuimica:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* status;

//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *keys;

- (NSMutableSet*)keysSet;

@property (nonatomic, strong) Product *product;

//- (BOOL)validateProduct:(id*)value_ error:(NSError**)error_;

@end

@interface _ProductDetail (KeysCoreDataGeneratedAccessors)
- (void)addKeys:(NSSet*)value_;
- (void)removeKeys:(NSSet*)value_;
- (void)addKeysObject:(KeyDetail*)value_;
- (void)removeKeysObject:(KeyDetail*)value_;

@end

@interface _ProductDetail (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAcond_pri;
- (void)setPrimitiveAcond_pri:(NSString*)value;

- (NSString*)primitiveAcond_sec;
- (void)setPrimitiveAcond_sec:(NSString*)value;

- (NSString*)primitiveComment;
- (void)setPrimitiveComment:(NSString*)value;

- (NSString*)primitiveFab_farmaco1;
- (void)setPrimitiveFab_farmaco1:(NSString*)value;

- (NSString*)primitiveFab_farmaco2;
- (void)setPrimitiveFab_farmaco2:(NSString*)value;

- (NSString*)primitiveFab_medic;
- (void)setPrimitiveFab_medic:(NSString*)value;

- (NSString*)primitiveJuridica;
- (void)setPrimitiveJuridica:(NSString*)value;

- (NSDate*)primitiveLast_modified_date;
- (void)setPrimitiveLast_modified_date:(NSDate*)value;

- (NSString*)primitiveMedica;
- (void)setPrimitiveMedica:(NSString*)value;

- (NSString*)primitiveQuimica;
- (void)setPrimitiveQuimica:(NSString*)value;

- (NSString*)primitiveStatus;
- (void)setPrimitiveStatus:(NSString*)value;

- (NSMutableSet*)primitiveKeys;
- (void)setPrimitiveKeys:(NSMutableSet*)value;

- (Product*)primitiveProduct;
- (void)setPrimitiveProduct:(Product*)value;

@end
