//
//  CountryPicker2.h
//  SimpleForm
//
//  Created by Minni Arora on 31/05/13.
//  Copyright (c) 2013 Minni Arora. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountryPicker2;

@protocol CountryPicker2Delegate <NSObject>

- (void)countryPicker2: (CountryPicker2 *)controller didSelectCountry:(NSString *)country;

@end

@interface CountryPicker2 : UITableViewController

@property (nonatomic, weak) id <CountryPicker2Delegate> delegate;
@property (nonatomic, strong) NSString *country;

@end
