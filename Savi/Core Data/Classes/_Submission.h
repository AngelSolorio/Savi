// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Submission.h instead.

#import <CoreData/CoreData.h>

extern const struct SubmissionAttributes {
	 __unsafe_unretained NSString *cofepris;
	 __unsafe_unretained NSString *duration;
	 __unsafe_unretained NSString *prevention_date;
	 __unsafe_unretained NSString *registration;
} SubmissionAttributes;

extern const struct SubmissionRelationships {
	 __unsafe_unretained NSString *stage;
} SubmissionRelationships;

@class Stage;

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

@property (nonatomic, retain) NSDate* prevention_date;

//- (BOOL)validatePrevention_date:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) NSString* registration;

//- (BOOL)validateRegistration:(id*)value_ error:(NSError**)error_;

@property (nonatomic, retain) Stage *stage;

//- (BOOL)validateStage:(id*)value_ error:(NSError**)error_;

@end

@interface _Submission (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCofepris;
- (void)setPrimitiveCofepris:(NSString*)value;

- (NSString*)primitiveDuration;
- (void)setPrimitiveDuration:(NSString*)value;

- (NSDate*)primitivePrevention_date;
- (void)setPrimitivePrevention_date:(NSDate*)value;

- (NSString*)primitiveRegistration;
- (void)setPrimitiveRegistration:(NSString*)value;

- (Stage*)primitiveStage;
- (void)setPrimitiveStage:(Stage*)value;

@end
