//
//  NSDictionary+Additions.m
//  iBeacon
//
//  Created by Jordan Zucker on 4/2/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)

- (BOOL)containsActualKVOChangeForObject_JSZ:(id)object {
    id oldValue = self[NSKeyValueChangeOldKey];
    id newValue = self[NSKeyValueChangeNewKey];
    
    return !oldValue || !newValue || ![oldValue isEqual:newValue];
}

@end
