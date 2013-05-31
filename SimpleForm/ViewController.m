//
//  ViewController.m
//  SimpleForm
//
//  Created by Minni Arora on 30/05/13.
//  Copyright (c) 2013 Minni Arora. All rights reserved.
//

#import "ViewController.h"
#import "Form.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSString *country;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.countryLabel.text = country;
	// Do any additional setup after loading the view, typically from a nib.
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
		country = @"Qatar";
	}
	return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Prepare for segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"SubmitDetails"]){
        UINavigationController *navigationController =
        segue.destinationViewController;
		
        EditViewController *controller = [[navigationController viewControllers]
                                          objectAtIndex:0];
        controller.delegate = self;

        Form *form = [[Form alloc] init];
        form.email = self.emailTextField.text;
        form.country = self.countryLabel.text;
        form.segmentIndex = self.genderSegCon.selectedSegmentIndex;
        controller.form = form;
    }
    
    if ([segue.identifier isEqualToString:@"PickCountry"])
	{
		CountryPickerViewController *countryPickerViewController = segue.destinationViewController;
		countryPickerViewController.delegate = self;
		countryPickerViewController.country = country;
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    
    if (theTextField == self.emailTextField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}


#pragma mark - CountryPickerViewControllerDelegate

- (void)countryPickerViewController:
(CountryPickerViewController *)controller
                   didSelectCountry:(NSString *)theCountry
{
	country = theCountry;
	self.countryLabel.text = country;
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - EditViewControllerDelegate
- (void)editViewController:
(EditViewController *)controller
                       didSaveDetails:(Form *)form
{
	self.countryLabel.text = form.country;
    self.emailTextField.text = form.email;
    self.genderSegCon.selectedSegmentIndex = form.segmentIndex;
	[self dismissViewControllerAnimated:YES completion:nil];
}



@end
