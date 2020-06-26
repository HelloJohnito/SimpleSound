//
//  TimerViewController.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/7/20.
//  Copyright © 2020 John. All rights reserved.
//



#import "TimerPageViewController.h"


@interface TimerPageViewController(){
    UIPickerView* pickerView;
    UITextField* textFieldView;
    UIToolbar* toolbar;
    
    NSMutableArray *hoursArray;
    NSMutableArray *minutesArray;
    NSMutableArray *secondsArray;
    
    UIButton *startButton;
    
    NSString *hour;
    NSString *minutes;
    NSString *seconds;

}

@end


@implementation TimerPageViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureNavBar];
    [self configureState];
    [self configureUI];
}

- (void)configureNavBar{
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationItem.title = @"Timer";
    UIImage *image = [[UIImage imageNamed:@"XButton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(clickXbutton:)];
}

- (void)configureState{
    hour = @"00";
    minutes = @"00";
    seconds = @"00";
    
    hoursArray = [[NSMutableArray alloc] init];
    minutesArray = [[NSMutableArray alloc] init];
    secondsArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < 5; i++){
        [hoursArray addObject: [NSString stringWithFormat:@"0%i", i]];
    }
    
    for(int i = 0; i < 60; i++){
        if(i < 10){
            [minutesArray addObject: [NSString stringWithFormat:@"0%i", i]];
            [secondsArray addObject: [NSString stringWithFormat:@"0%i", i]];
        } else {
            [minutesArray addObject: [NSString stringWithFormat:@"%i", i]];
            [secondsArray addObject: [NSString stringWithFormat:@"%i", i]];
        }
    }
}

- (void)configureUI{
    pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    textFieldView = _timer.textField;
    textFieldView.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textFieldView.textAlignment = NSTextAlignmentCenter;
    textFieldView.font = [UIFont systemFontOfSize:50];
    textFieldView.layer.borderWidth = 1.0;
    textFieldView.inputView = pickerView;
    [self.view addSubview:textFieldView];
    textFieldView.translatesAutoresizingMaskIntoConstraints = NO;
    [textFieldView.widthAnchor constraintEqualToConstant:320].active = YES;
    [textFieldView.heightAnchor constraintEqualToConstant:100].active = YES;
    [textFieldView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [textFieldView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [_timer displayTime];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Timer";
    [label setTextAlignment:NSTextAlignmentCenter];
    label.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:label];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [label.widthAnchor constraintEqualToConstant:320].active = YES;
    [label.heightAnchor constraintEqualToConstant:100].active = YES;
    [label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [label.bottomAnchor constraintEqualToAnchor:textFieldView.topAnchor].active = YES;
    
    startButton = [[UIButton alloc] init];
    [self toggleButtonImage];
    [startButton addTarget:self action:@selector(clickPlayButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    startButton.translatesAutoresizingMaskIntoConstraints = NO;
    [startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [startButton.topAnchor constraintEqualToAnchor:textFieldView.bottomAnchor constant:50].active = YES;
    
    CGRect toolBarFrame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:toolBarFrame];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    toolbar.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(clickCancelButton:)];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(clickDoneButton:)];
    
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [toolbar setItems:@[cancelButton, flexButton, doneButton] animated:YES];
    textFieldView.inputAccessoryView = toolbar;
}

- (void)clickXbutton:(UIBarButtonItem*)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickCancelButton:(UIBarButtonItem*)sender{
    [textFieldView resignFirstResponder];
}

- (void)clickDoneButton:(UIBarButtonItem*)sender{
    _timer.hour = hour;
    _timer.minutes = minutes;
    _timer.seconds = seconds;
    [_timer displayTime];
    [textFieldView resignFirstResponder];
}

- (void)clickPlayButton:(UIButton*)sender{
    if([_timer.hour isEqualToString:@"00"] && [_timer.minutes isEqualToString:@"00"] && [_timer.seconds isEqualToString:@"00"]){
        return;
    }
    _timer.isOn = !_timer.isOn;
    [self toggleButtonImage];
    [self handleTimer];
}


- (void)handleTimer{
    if(_timer.isOn){
        [_timer startTimer];
    } else {
        [_timer stopTimer];
    }
}

- (void)toggleButtonImage{
    UIImage *img;
    if(_timer.isOn){
        img = [UIImage imageNamed:@"PauseButton"];
    } else {
        img = [UIImage imageNamed:@"PlayButton"];
    }
    
    [startButton setImage:img forState:UIControlStateNormal];
}

- (void)timerFinished{
    [startButton setImage:[UIImage imageNamed:@"PlayButton"] forState:UIControlStateNormal];
}


# pragma mark - <UIPickerViewDelegate, UIPickerViewDataSource>
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSMutableArray* currentComponent;
    if(component == 0){
        currentComponent = hoursArray;
    } else if(component == 1){
        currentComponent = minutesArray;
    } else if(component == 2){
        currentComponent = secondsArray;
    }
    return [currentComponent count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *rowTitle;
    if(component == 0){
        rowTitle = [[hoursArray objectAtIndex:row] stringByAppendingString:@" hr"];
    } else if(component == 1){
        rowTitle = [[minutesArray objectAtIndex:row] stringByAppendingString:@" min"];
    } else if(component == 2){
        rowTitle = [[secondsArray objectAtIndex:row] stringByAppendingString:@" sec"];
    }
    
    return rowTitle;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSMutableArray* currentComponent;
    if(component == 0){
        currentComponent = hoursArray;
        hour = [currentComponent objectAtIndex:row];
    } else if(component == 1){
        currentComponent = minutesArray;
        minutes = [currentComponent objectAtIndex:row];
    } else if(component == 2){
        currentComponent = secondsArray;
        seconds = [currentComponent objectAtIndex:row];
    }
}

@end

