//
//  Constants.h
//  iBeacon
//
//  Created by Jordan Zucker on 4/2/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#ifndef iBeacon_Constants_h
#define iBeacon_Constants_h

// uint16_t CLBeaconMinorValue

@import Foundation;
@import CoreLocation;

static NSString * const kProximityUUIDString = @"test";
static CLBeaconMajorValue const kMajorValue = 750;
static CLBeaconMinorValue const kMinorValue = 650;

#define TEST_UUID [[NSUUID alloc] initWithUUIDString:kProximityUUIDString]

#endif
