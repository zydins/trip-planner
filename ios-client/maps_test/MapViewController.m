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

BOOL isMenuOpened = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
    RMMapboxSource *tileSource = [[RMMapboxSource alloc] initWithMapID:@"tryparse.j1m6ai8f"];
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:tileSource];
    [self.view addSubview:mapView];
    mapView.cen
    self.navigationController.navigationBar.hidden = YES;
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchViewHandler)];
    [mapView addGestureRecognizer:recognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickMunuButton:(UIButton *)sender {
    [self.revealViewController rightRevealToggle:sender];
    isMenuOpened = !isMenuOpened;
}

- (IBAction)clickBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) touchViewHandler {
    if (isMenuOpened) {
        [self clickMunuButton:self.backButton];
    }
}

@end
