//
// Copyright 2016 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import <EarlGrey/GREYConstants.h>
#import <UIKit/UIKit.h>

/**
 *  A utility class for creating and injecting gestures that involve touch paths, for example:
 *  swipe, scroll etc.
 */
@interface GREYPathGestureUtils : NSObject

/**
 *  Generates a touch path in the @c window from the start point, in the given direction to the
 *  max possible extent.
 *
 *  @param startPointInWindowCoordinates The start point within the given @c window
 *  @param direction                     The direction of the touch path.
 *  @param window                        The window in which the touch path is generated.
 *
 *  @return NSArray of CGPoints that denote the points in the touch path.
 */
+ (NSArray *)touchPathForGestureWithStartPoint:(CGPoint)startPointInWindowCoordinates
                                  andDirection:(GREYDirection)direction
                                      inWindow:(UIWindow *)window;

/**
 *  Generates a touch path in the @c window starting from a given @c view in a particular direction
 *  for a certain amount in the window coordinates of the @c view.
 *
 *  @param      view                     The view from which the touch path originates.
 *  @param      direction                The direction of the touch.
 *  @param      amount                   The length of the touch path. The length of the touch path
 *                                       is restricted by the screen dimensions, position of the
 *                                       view and the minimum scroll detection length (10 points as
 *                                       of iOS 8.0).
 *  @param[out] outRemainingAmountOrNull The difference of the length and the amount,
 *                                       if the length falls short.
 *
 *  @return Array of CGPoints that denote the points in the touch path. The touch path's length
 *          will be at least the minimum scroll detection length, when that is not possible
 *          (due to @c view position and/or size) @c nil is returned.
 */
+ (NSArray *)touchPathForGestureInView:(UIView *)view
                         withDirection:(GREYDirection)direction
                                amount:(CGFloat)amount
                    outRemainingAmount:(CGFloat *)outRemainingAmountOrNull;
@end
