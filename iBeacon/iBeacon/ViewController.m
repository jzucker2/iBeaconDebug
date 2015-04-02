//
//  ViewController.m
//  iBeacon
//
//  Created by Jordan Zucker on 4/2/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

@import CoreLocation;
@import CoreBluetooth;

#import "Constants.h"
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) UIImageView *iBeaconImageView;
@property (nonatomic) UIButton *iBeaconButton;
@property (nonatomic) CBPeripheralManager *peripheralManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:nil queue:nil];
    
    self.iBeaconButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.iBeaconButton setTitle:NSLocalizedString(@"Turn on iBeacon", nil) forState:UIControlStateNormal];
    [self.iBeaconButton setTitle:NSLocalizedString(@"Turn off iBeacon", nil) forState:UIControlStateSelected];
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
}

#pragma mark - Actions

- (void)iBeaconButtonTapped:(id)sender {
    
}

#pragma mark - iBeacon

- (void)startAdvertising {
    CLBeaconRegion *beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:kProximityUUIDString major:kMajorValue minor:kMinorValue identifier:@"test-region"];
    NSMutableDictionary *iBeaconDictionary = [[CLBeaconRegion alloc] peripheralDataWithMeasuredPower:nil];
    [self.peripheralManager startAdvertising:iBeaconDictionary];
}

- (void)stopAdvertising {
    [self.peripheralManager stopAdvertising];
}

@end
