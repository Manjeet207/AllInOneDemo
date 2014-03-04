//
//  MRPScannerViewController.m
//  ALLinOneDemo
//
//  Created by Manjeet Singh on 2/18/14.
//  Copyright (c) 2014 Manjeet Singh. All rights reserved.
//

#import "MRPScannerViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
@interface MRPScannerViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic) AVCaptureSession *captureSession;
@property (nonatomic) AVCaptureDeviceInput *captureDeviceInput;
@property (nonatomic) AVCaptureVideoPreviewLayer *capturePreviewLayer;
@property (nonatomic) AVCaptureVideoDataOutput *captureVideoDataOutput;
@end

@implementation MRPScannerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupCameraSession]; // 1
    [self.captureSession startRunning]; // 2
}


- (void)setupCameraSession {
    // Creates a capture session
    if (self.captureSession == nil) {
        self.captureSession = [[AVCaptureSession alloc] init];
    }
     [self.captureSession beginConfiguration];
    // Selects the rear camera
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    BOOL success = [captureDevice lockForConfiguration:nil];
    if (success) {
        if ([captureDevice isAutoFocusRangeRestrictionSupported]) {
            // Restricts the autofocus to near range (new in iOS 7)
            [captureDevice setAutoFocusRangeRestriction:AVCaptureAutoFocusRangeRestrictionNear];
        }
    }
    // unlocks the configuration
    [captureDevice unlockForConfiguration];
    
    NSError *error;
    // Adds the device input to capture session
    self.captureDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    if ( [self.captureSession canAddInput:self.captureDeviceInput] )
        [self.captureSession addInput:self.captureDeviceInput];
    
    // Prepares the preview layer
    self.capturePreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.captureSession];
    CGRect frame = [[UIScreen mainScreen] bounds];
    [self.capturePreviewLayer setFrame:frame];
    [self.capturePreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    // Adds the preview layer to the main view layer
    [self.view.layer insertSublayer:self.capturePreviewLayer atIndex:0];
    
    // Creates and adds the metadata output to the capture session
    AVCaptureMetadataOutput *metadataOutput = [[AVCaptureMetadataOutput alloc] init];
    if ([self.captureSession canAddOutput:metadataOutput]) {
        [self.captureSession addOutput:metadataOutput];
    }
    
    // Creates a GCD queue to dispatch the metadata
    dispatch_queue_t metadataQueue = dispatch_queue_create("com.invasivecode.metadataqueue", DISPATCH_QUEUE_SERIAL);
    [metadataOutput setMetadataObjectsDelegate:self queue:metadataQueue];
    
    // Sets the metadata object types. Essentially, here you can choose the barcode type.
    NSArray *metadataTypes = @[ AVMetadataObjectTypeAztecCode,
                                AVMetadataObjectTypeUPCECode,
                                AVMetadataObjectTypeCode39Code,
                                AVMetadataObjectTypeEAN13Code,
                                AVMetadataObjectTypeEAN8Code,
                                AVMetadataObjectTypeCode93Code,
                                AVMetadataObjectTypeCode128Code,
                                AVMetadataObjectTypeCode39Mod43Code ];
    [metadataOutput setMetadataObjectTypes:metadataTypes];
    // Commits the camera configuration
    [self.captureSession commitConfiguration];
}


- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if ([metadataObjects count] < 1) {
        return;
    }
    for (id item in metadataObjects) {
        if ([item isKindOfClass:[AVMetadataMachineReadableCodeObject class]]) {
            if (item) {
                NSLog(@"%@", [item stringValue]);
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    NSArray *corners = [item corners];
//                    CGMutablePathRef path = [self createBoxWithCorners:corners];
//                    [self.boxLayer setPath:path];
//                });
            }
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
