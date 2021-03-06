//
//  DPViewController.m
//  DPRadialMenu
//
//  Created by Dario Pellegrini on 06/24/2016.
//  Copyright (c) 2016 Dario Pellegrini. All rights reserved.
//

#import "DPViewController.h"

@interface DPViewController () <DPRadialMenuDelegate>

@end

@implementation DPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Creating radial menu
    DPRadialMenu *radialMenu = [[DPRadialMenu alloc] init];
    DPRadialMenu *radialMenuSmall = [[DPRadialMenu alloc] init];
    
    UIButton *b1 = [[UIButton alloc] init];
    UIButton *b2 = [[UIButton alloc] init];
    UIButton *b3 = [[UIButton alloc] init];
    
    [b1 setTitle:@"1" forState:UIControlStateNormal];
    [b2 setTitle:@"2" forState:UIControlStateNormal];
    [b3 setTitle:@"3" forState:UIControlStateNormal];
    
    UIButton *b4 = [[UIButton alloc] init];
    UIButton *b5 = [[UIButton alloc] init];
    UIButton *b6 = [[UIButton alloc] init];
    
    b4.backgroundColor = [UIColor whiteColor];
    b5.backgroundColor = [UIColor whiteColor];
    b6.backgroundColor = [UIColor whiteColor];
    
    [b4 setImage:[UIImage imageNamed:@"facebook"] forState:UIControlStateNormal];
    [b5 setImage:[UIImage imageNamed:@"google_plus"] forState:UIControlStateNormal];
    [b6 setImage:[UIImage imageNamed:@"linked_in"] forState:UIControlStateNormal];
    
    // Configuring radial menu with buttons
    [radialMenu configureWithButtons:@[b1, b2, b3] view:self.view delegate:self];
    
    // Display or not the fade vuew on the background
    radialMenu.displayBackgroundView = YES;
    
    // Animations time
    radialMenu.animationTime = 0.5;
    
    [radialMenuSmall configureWithButtons:@[b4, b5, b6] view:self.redView delegate:self];
    
    // The color of the fade view on the background. Default is black with alpha 0.7
    radialMenuSmall.radialMenuContainer.backgroundColor = [UIColor blueColor];
    
    /*
     The action region of the menu: the region in which the menu is active and from which it cinfigure its position.
     Default is the view passed in the constructor.
     In this case the action view is the view of the controller, in order to have a nice behavior on the whole screen.
     */
    radialMenuSmall.actionView = self.view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) radialMenu:(DPRadialMenu *)radialMenu didSelectButton:(UIButton *)selectedButton {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Button selected"
                                 message:[NSString stringWithFormat:@"%@", selectedButton]
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
    }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) radialMenuDidCancel:(DPRadialMenu *)radialMenu {
    NSLog(@"Canceled");
}

@end
