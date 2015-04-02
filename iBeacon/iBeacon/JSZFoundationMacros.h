//
//  JSZFoundationMacros.h
//  iBeacon
//
//  Created by Jordan Zucker on 4/2/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#ifndef iBeacon_JSZFoundationMacros_h
#define iBeacon_JSZFoundationMacros_h

#define JSZWeakify(__var) \
__weak __typeof__(__var) __var ## _weak_ = (__var)

#define JSZStrongify(__var) \
_Pragma("clang diagnostic push"); \
_Pragma("clang diagnostic ignored  \"-Wshadow\""); \
__strong __typeof__(__var) __var = __var ## _weak_; \
_Pragma("clang diagnostic pop") \

#define JSZClass(className) NSStringFromClass([className class])
#define JSZSelector(selectorName) NSStringFromSelector(@selector(selectorName))
#define JSZBool(boolValue) (boolValue ? @"YES" : @"NO")

// the NO if statement doesn't run but is a compiler check to test if the object containst the key
#define JSZKey(object, selector) ({ __typeof(object) testObject = nil; if (NO) { (void)((testObject).selector); } @#selector; })

#endif
