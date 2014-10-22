// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Review.h instead.

#import <CoreData/CoreData.h>

extern const struct ReviewAttributes {
	__unsafe_unretained NSString *cofepris;
	__unsafe_unretained NSString *date_third;
	__unsafe_unretained NSString *duration;
	__unsafe_unretained NSString *report;
	__unsafe_unretained NSString *retro_first;
	__unsafe_unretained NSString *retro_last;
	__unsafe_unretained NSString *third;
} ReviewAttributes;

extern const struct ReviewRelationships {
	__unsafe_unretained NSString *product;
} ReviewRelationships;

@class Product;

@interface ReviewID : NSManagedObjectID {}
@end

@interface _Review : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ReviewID* objectID;

@property (nonatomic, strong) NSString* cofepris;

//- (BOOL)validateCofepris:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* date_third;

//- (BOOL)validateDate_third:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* duration;

//- (BOOL)validateDuration:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* report;

//- (BOOL)validateReport:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* retro_first;

//- (BOOL)validateRetro_first:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* retro_last;

//- (BOOL)validateRetro_last:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* third;

//- (BOOL)validateThird:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Product *product;

//- (BOOL)validateProduct:(id*)value_ error:(NSError**)error_;

@end

@interface _Review (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCofepris;
- (void)setPrimitiveCofepris:(NSString*)value;

- (NSDate*)primitiveDate_third;
- (void)setPrimitiveDate_third:(NSDate*)value;

- (NSString*)primitiveDuration;
- (void)setPrimitiveDuration:(NSString*)value;

- (NSString*)primitiveReport;
- (void)setPrimitiveReport:(NSString*)value;

- (NSDate*)primitiveRetro_first;
- (void)setPrimitiveRetro_first:(NSDate*)value;

- (NSDate*)primitiveRetro_last;
- (void)setPrimitiveRetro_last:(NSDate*)value;

- (NSString*)primitiveThird;
- (void)setPrimitiveThird:(NSString*)value;

- (Product*)primitiveProduct;
- (void)setPrimitiveProduct:(Product*)value;

@end
