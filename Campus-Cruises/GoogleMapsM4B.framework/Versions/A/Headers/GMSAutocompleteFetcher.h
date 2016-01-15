//
//  GMSAutocompleteFetcher.h
//  Google Maps SDK for iOS
//
//  Copyright 2015 Google Inc.
//
//  Usage of this SDK is subject to the Google Maps/Google Earth APIs Terms of
//  Service: https://developers.google.com/maps/terms
//

#import <GoogleMapsM4B/GMSPlacesClient.h>

GMS_ASSUME_NONNULL_BEGIN

/**
 * Protocol for objects that can receive callbacks from GMSAutocompleteFetcher
 */
@protocol GMSAutocompleteFetcherDelegate <NSObject>

@required

/**
 * Called when autocomplete predictions are available.
 * @param predictions an array of GMSAutocompletePrediction objects.
 */
- (void)didAutocompleteWithPredictions:(NSArray *)predictions;

/**
 * Called when an autocomplete request returns an error.
 * @param error the error that was received.
 */
- (void)didFailAutocompleteWithError:(NSError *)error;

@end

/**
 * GMSAutocompleteFetcher is a wrapper around the lower-level autocomplete APIs that encapsulates
 * some of the complexity of requesting autocomplete predictions as the user is typing. Calling
 * sourceTextHasChanged will generally result in the provided delegate being called with
 * autocomplete predictions for the queried text, with the following provisos:
 *
 * - The fetcher may not necessarily request predictions on every call of sourceTextHasChanged if
 *   several requests are made within a short amount of time.
 * - The delegate will only be called with prediction results if those predictions are for the
 *   text supplied in the most recent call to sourceTextHasChanged.
 */
@interface GMSAutocompleteFetcher : NSObject

/**
 * Initialise the fetcher
 * @param bounds The bounds used to bias the results. This is not a hard restrict - places may still
 *               be returned outside of these bounds. This parameter may be nil.
 * @param filter The filter to apply to the results. This parameter may be nil.
 */
- (instancetype)initWithBounds:(GMSCoordinateBounds * GMS_NULLABLE_PTR)bounds
                        filter:(GMSAutocompleteFilter * GMS_NULLABLE_PTR)filter;

/** Delegate to be notified with autocomplete prediction results. */
@property(nonatomic, weak) id<GMSAutocompleteFetcherDelegate> delegate;

/** Bounds used to bias the autocomplete search (can be nil). */
@property(nonatomic, strong) GMSCoordinateBounds *autocompleteBounds;

/** Filter to apply to autocomplete suggestions (can be nil). */
@property(nonatomic, strong) GMSAutocompleteFilter *autocompleteFilter;

/**
 * Notify the fetcher that the source text to autocomplete has changed. This method is non-blocking.
 * @param text The partial text to autocomplete.
 */
- (void)sourceTextHasChanged:(NSString *)text;

@end

GMS_ASSUME_NONNULL_END
