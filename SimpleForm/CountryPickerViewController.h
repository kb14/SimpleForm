//
//  CountryPickerViewController.h
//  SimpleForm
//
//  Created by Minni Arora on 31/05/13.
//  Copyright (c) 2013 Minni Arora. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountryPickerViewController;

@protocol CountryPickerViewControllerDelegate <NSObject>

- (void)countryPickerViewController: (CountryPickerViewController *)controller didSelectCountry:(NSString *)country;

@end

@interface CountryPickerViewController : UITableViewController

@property (nonatomic, weak) id <CountryPickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *country;

@end
