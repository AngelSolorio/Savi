// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Stage.h instead.

#import <CoreData/CoreData.h>

extern const struct StageAttributes {
	 __unsafe_unretained NSString *name;
} StageAttributes;

extern const struct StageRelationships {
	 __unsafe_unretained NSString *product;
	 __unsafe_unretained NSString *review;
	 __unsafe_unretained NSString *submission;
} StageRelationships;

@class Product;
@class Review;
@class Submission;

@interface StageID : NSManagedObjectID {}
@end

@interface _Stage : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) StageID* objectID;

@property (nonatomic, retain) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) Product *product;

//- (BOOL)validateProduct:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) Review *review;

//- (BOOL)validateReview:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) Submission *submission;

//- (BOOL)validateSubmission:(id*)value_ error:(NSError**)error_;

@end

@interface _Stage (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (Product*)primitiveProduct;
- (void)setPrimitiveProduct:(Product*)value;

- (Review*)primitiveReview;
- (void)setPrimitiveReview:(Review*)value;

- (Submission*)primitiveSubmission;
- (void)setPrimitiveSubmission:(Submission*)value;

@end
