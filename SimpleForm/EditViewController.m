//
//  EditViewController.m
//  SimpleForm
//
//  Created by Minni Arora on 31/05/13.
//  Copyright (c) 2013 Minni Arora. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController{
    NSString *country;
}

@synthesize delegate;
@synthesize form;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.editEmail.text = self.form.email;
    self.editCountry.text = self.form.country;
    //NSLog(@"Segment index %d", self.form.segmentIndex);
    self.genSeg.selectedSegmentIndex = self.form.segmentIndex;
    
    self.editEmail.enabled = NO;
    self.editEmail.backgroundColor = [UIColor grayColor];
    self.editCountry.enabled = NO;
    self.countryBtn.enabled = NO;
    self.genSeg.enabled = NO;
    // Do any additional setup after loading the view.
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
		country = @"Qatar";
	}
	return self;
}


- (IBAction)save:(id)sender
{
    Form *formTemp = [[Form alloc] init];
    formTemp.email = self.editEmail.text;
    formTemp.country = self.editCountry.text;
    formTemp.segmentIndex = self.genSeg.selectedSegmentIndex;
    //NSLog(@"Not hello world");
    [self.delegate editViewController:self didSaveDetails:formTemp];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)edit:(id)sender
{
	self.editEmail.enabled = YES;
    self.editEmail.backgroundColor = nil;
    self.editCountry.enabled = YES;
    self.countryBtn.enabled = YES;
    self.genSeg.enabled = YES;
}

//Prepare for segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"PickCountry"])
	{
		CountryPicker2 *countryPicker2 = segue.destinationViewController;
		countryPicker2.delegate = self;
		countryPicker2.country = country;
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    
    if (theTextField == self.editEmail) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

#pragma mark - CountryPicker2Delegate

- (void)countryPicker2:
(CountryPicker2 *)controller
                   didSelectCountry:(NSString *)theCountry
{
	country = theCountry;
	self.editCountry.text = country;
	[self.navigationController popViewControllerAnimated:YES];
}




@end
