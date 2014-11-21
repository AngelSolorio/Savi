// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Submission.h instead.

#import <CoreData/CoreData.h>

extern const struct SubmissionAttributes {
	 __unsafe_unretained  NSString *cofepris;
	 __unsafe_unretained NSString *duration;
	 __unsafe_unretained NSString *prevention_date;
	 __unsafe_unretained NSString *registration;
} SubmissionAttributes;

extern const struct SubmissionRelationships {
	 __unsafe_unretained NSString *product;
} SubmissionRelationships;

@class Product;

@interface SubmissionID : NSManagedObjectID {}
@end

@interface _Submission : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) SubmissionID* objectID;

@property (nonatomic, retain) NSString* cofepris;

//- (BOOL)validateCofepris:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSString* duration;

//- (BOOL)validateDuration:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSString* prevention_date;

//- (BOOL)validatePrevention_date:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSString* registration;

//- (BOOL)validateRegistration:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) Product *product;

//- (BOOL)validateProduct:(id*)value_ error:(NSError**)error_;

@end

@interface _Submission (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCofepris;
- (void)setPrimitiveCofepris:(NSString*)value;

- (NSString*)primitiveDuration;
- (void)setPrimitiveDuration:(NSString*)value;

- (NSString*)primitivePrevention_date;
- (void)setPrimitivePrevention_date:(NSString*)value;

- (NSString*)primitiveRegistration;
- (void)setPrimitiveRegistration:(NSString*)value;

- (Product*)primitiveProduct;
- (void)setPrimitiveProduct:(Product*)value;

@end
