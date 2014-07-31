//
//  MapViewController.m
//  maps_test
//
//  Created by Georgii on 7/23/14.
//  Copyright (c) 2014 tryparse. All rights reserved.
//

#import "MapViewController.h"



@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end

@implementation MapViewController
//@synthesize lat;
//@synthesize lon;
//@synthesize days;

static double lat = 0;
static double lon = 0;
static int days = 0;
BOOL isMenuOpened = NO;

+ (double) lat {return lat;}
+ (void) setLat:(double)value {lat = value;}
+ (double) lon {return lon;}
+ (void) setLon:(double)value {lon = value;}
+ (int) days {return days;}
+ (void) setDays:(int)value {days = value;}

- (void)viewDidLoad {
    [super viewDidLoad];
    RMMapboxSource *tileSource = [[RMMapboxSource alloc] initWithMapID:@"tryparse.j1m6ai8f"];
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:tileSource];
    [self.view addSubview:mapView];
    self.revealViewController.delegate = self;
    [mapView setZoom:15.000000];
    mapView.centerCoordinate = CLLocationCoordinate2DMake(lat,lon);
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    SWRevealViewController *revealViewController = [self revealViewController];
    [revealViewController panGestureRecognizer];
    [revealViewController tapGestureRecognizer];
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchViewHandler)];
    [mapView addGestureRecognizer:recognizer];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickMunuButton:(UIButton *)sender {
    [self.revealViewController rightRevealToggle:sender];
}

- (IBAction)clickBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) touchViewHandler {
    if (self.view.userInteractionEnabled) {
        [self clickMunuButton:self.backButton];
    }
}

- (void)revealController:(SWRevealViewController *)revealController willMoveToPosition:(FrontViewPosition)position
    {
        if(position == FrontViewPositionLeft) {
            self.view.userInteractionEnabled = YES;
        } else {
            self.view.userInteractionEnabled = NO;
        }
    }
    
- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position
    {
        if(position == FrontViewPositionLeft) {
            self.view.userInteractionEnabled = YES;
        } else {
            self.view.userInteractionEnabled = NO;
        }
    }


@end
