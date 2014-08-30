//
//  ViewController.m
//  WhatTheFood
//
//  Created by Alexander Johansson on 30/08/2014.
//  Copyright (c) 2014 wtfood. All rights reserved.
//

#import "ViewController.h"
#import "Tesseract.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    Tesseract* tesseract = [[Tesseract alloc] initWithDataPath:@"tessdata" language:@"eng"];

    UIImage *image = [UIImage imageNamed:@"test.jpg"];
    [tesseract setImage:image];

    CGRect rect = CGRectMake(0, 40, 320, 25);


    [tesseract setRectangle: rect];

    [tesseract recognize];


    NSLog(@"%@", [tesseract recognizedText]);


    self.recognizedTextView.text = tesseract.recognizedText;
    self.photoImageView.image = image;


    UIView *rectView;
    rectView = [[UIView alloc] init];
    rectView.backgroundColor = [UIColor blackColor];
    rectView.alpha = 0.3f;

//    [self.photoImageView addSubview: rectView];
    rectView.frame = rect;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
