//
//  EditViewController.h
//  SimpleForm
//
//  Created by Minni Arora on 31/05/13.
//  Copyright (c) 2013 Minni Arora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Form.h"
#import "CountryPicker2.h"

@class EditViewController;

@protocol EditViewControllerDelegate <NSObject>
- (void)editViewController:
(EditViewController *)controller didSaveDetails:(Form *)form;
@end


@interface EditViewController : UIViewController <CountryPicker2Delegate>

@property (nonatomic, weak) id <EditViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *editEmail;
@property (weak, nonatomic) IBOutlet UILabel *editCountry;
@property (weak, nonatomic) IBOutlet UIButton *countryBtn;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genSeg;

@property (nonatomic) Form *form;

- (IBAction)edit:(id)sender;
- (IBAction)save:(id)sender;

@end
