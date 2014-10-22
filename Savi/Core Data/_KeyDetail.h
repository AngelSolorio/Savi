// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to KeyDetail.h instead.

#import <CoreData/CoreData.h>

extern const struct KeyDetailAttributes {
	 __unsafe_unretained NSString *clave;
	 __unsafe_unretained NSString *detail;
	 __unsafe_unretained NSString *laboratory;
	 __unsafe_unretained NSString *unity;
	 __unsafe_unretained NSString *value;
} KeyDetailAttributes;

extern const struct KeyDetailRelationships {
	 __unsafe_unretained NSString *productDetail;
} KeyDetailRelationships;

@class ProductDetail;

@interface KeyDetailID : NSManagedObjectID {}
@end

@interface _KeyDetail : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) KeyDetailID* objectID;

@property (nonatomic, retain) NSNumber* clave;

@property (atomic) int16_t claveValue;
- (int16_t)claveValue;
- (void)setClaveValue:(int16_t)value_;

//- (BOOL)validateClave:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSString* detail;

//- (BOOL)validateDetail:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSString* laboratory;

//- (BOOL)validateLaboratory:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSNumber* unity;

@property (atomic) int16_t unityValue;
- (int16_t)unityValue;
- (void)setUnityValue:(int16_t)value_;

//- (BOOL)validateUnity:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSString* value;

//- (BOOL)validateValue:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) ProductDetail *productDetail;

//- (BOOL)validateProductDetail:(id*)value_ error:(NSError**)error_;

@end

@interface _KeyDetail (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveClave;
- (void)setPrimitiveClave:(NSNumber*)value;

- (int16_t)primitiveClaveValue;
- (void)setPrimitiveClaveValue:(int16_t)value_;

- (NSString*)primitiveDetail;
- (void)setPrimitiveDetail:(NSString*)value;

- (NSString*)primitiveLaboratory;
- (void)setPrimitiveLaboratory:(NSString*)value;

- (NSNumber*)primitiveUnity;
- (void)setPrimitiveUnity:(NSNumber*)value;

- (int16_t)primitiveUnityValue;
- (void)setPrimitiveUnityValue:(int16_t)value_;

- (NSString*)primitiveValue;
- (void)setPrimitiveValue:(NSString*)value;

- (ProductDetail*)primitiveProductDetail;
- (void)setPrimitiveProductDetail:(ProductDetail*)value;

@end
