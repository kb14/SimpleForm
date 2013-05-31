//
//  ViewController.h
//  SimpleForm
//
//  Created by Minni Arora on 30/05/13.
//  Copyright (c) 2013 Minni Arora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditViewController.h"
#import "CountryPickerViewController.h"

@interface ViewController : UIViewController <CountryPickerViewControllerDelegate,EditViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegCon;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;



@end
