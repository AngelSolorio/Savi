// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Product.h instead.

#import <CoreData/CoreData.h>

extern const struct ProductAttributes {
	__unsafe_unretained NSString *id_product;
	__unsafe_unretained NSString *manufacture_date;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *stage;
} ProductAttributes;

extern const struct ProductRelationships {
	__unsafe_unretained NSString *company;
	__unsafe_unretained NSString *detail;
	__unsafe_unretained NSString *review;
	__unsafe_unretained NSString *submission;
} ProductRelationships;

@class Company;
@class ProductDetail;
@class Review;
@class Submission;

@interface ProductID : NSManagedObjectID {}
@end

@interface _Product : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ProductID* objectID;

@property (nonatomic, strong) NSNumber* id_product;

@property (atomic) int16_t id_productValue;
- (int16_t)id_productValue;
- (void)setId_productValue:(int16_t)value_;

//- (BOOL)validateId_product:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* manufacture_date;

//- (BOOL)validateManufacture_date:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* stage;

//- (BOOL)validateStage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Company *company;

//- (BOOL)validateCompany:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) ProductDetail *detail;

//- (BOOL)validateDetail:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Review *review;

//- (BOOL)validateReview:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Submission *submission;

//- (BOOL)validateSubmission:(id*)value_ error:(NSError**)error_;

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

- (NSString*)primitiveStage;
- (void)setPrimitiveStage:(NSString*)value;

- (Company*)primitiveCompany;
- (void)setPrimitiveCompany:(Company*)value;

- (ProductDetail*)primitiveDetail;
- (void)setPrimitiveDetail:(ProductDetail*)value;

- (Review*)primitiveReview;
- (void)setPrimitiveReview:(Review*)value;

- (Submission*)primitiveSubmission;
- (void)setPrimitiveSubmission:(Submission*)value;

@end
