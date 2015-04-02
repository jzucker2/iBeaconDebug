//
//  ViewController.m
//  iBeacon
//
//  Created by Jordan Zucker on 4/2/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

@import CoreLocation;
@import CoreBluetooth;

#import <CocoaLumberjack/CocoaLumberjack.h>

#import "Constants.h"
#import "ViewController.h"

@interface ViewController () <
                                CBPeripheralManagerDelegate
                            >
@property (nonatomic) UIImageView *iBeaconImageView;
@property (nonatomic) UIButton *iBeaconButton;
@property (nonatomic) CBPeripheralManager *peripheralManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    
    self.iBeaconButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.iBeaconButton setTitle:NSLocalizedString(@"Turn on iBeacon", nil) forState:UIControlStateNormal];
    [self.iBeaconButton setTitle:NSLocalizedString(@"Turn off iBeacon", nil) forState:UIControlStateSelected];
    [self.iBeaconButton sizeToFit];
    [self.iBeaconButton addTarget:self action:@selector(iBeaconButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.iBeaconButton];
    
    [self.view setNeedsLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.iBeaconButton.center = self.view.center;
}

#pragma mark - View updates

- (void)updateiBeaconButton {
    self.iBeaconButton.selected = self.peripheralManager.isAdvertising;
}

#pragma mark - Actions

- (void)iBeaconButtonTapped:(id)sender {
    if (self.peripheralManager.isAdvertising) {
        [self stopAdvertising];
    } else {
        [self startAdvertising];
    }
    [self updateiBeaconButton];
}

#pragma mark - CBPeripheralManager

- (void)startAdvertising {
    CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:TEST_UUID major:kMajorValue minor:kMinorValue identifier:@"test-region"];
    NSMutableDictionary *iBeaconDictionary = [beaconRegion peripheralDataWithMeasuredPower:nil];
    [self.peripheralManager startAdvertising:iBeaconDictionary];
}

- (void)stopAdvertising {
    [self.peripheralManager stopAdvertising];
}

#pragma mark - CBPeripheralManagerDelegate

- (void)peripheralManagerDidStartAdvertising:(CBPeripheralManager *)peripheral error:(NSError *)error {
    DDLogDebug(@"peripheralManagerDidStartAdvertising: %@ error: %@", peripheral, error);
    [self updateiBeaconButton];
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    DDLogDebug(@"peripheralManagerDidUpdateState: %@ state: %@", peripheral, @(peripheral.state));
}

@end
