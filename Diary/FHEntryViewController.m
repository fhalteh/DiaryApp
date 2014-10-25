//
//  FHNewEntryViewController.m
//  Diary
//
//  Created by Faris Halteh on 01/08/14.
//  Copyright (c) 2014 FarisHalteh. All rights reserved.
//

#import "FHEntryViewController.h"
#import "FHDiaryEntry.h"
#import "FHCoreDataStack.h"

@interface FHEntryViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation FHEntryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) updateDiaryEntry{
    
    self.entry.body = self.textField.text;
    FHCoreDataStack *coreDataStack = [FHCoreDataStack defaultStack];
    [coreDataStack saveContext];
    
}
- (IBAction)doneWasPressed:(id)sender {
    if(self.entry !=nil){
        [self updateDiaryEntry];
    }else{
        if([self.textField.text isEqualToString:@""]){
        NSLog(@"There's nothing written here"); //so no need to add anything?
            [self showMessageNoDataEntered];
        }
        else
        [self insertDiaryEntry];}
        [self dismissSelf];

}

- (IBAction)showMessageNoDataEntered
{
    UIAlertView *noDataEntered = [[UIAlertView alloc]
                                    initWithTitle:@"Notification" message:@"You did not enter any text." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display the Message
    [noDataEntered show];
}
- (IBAction)cancelWasPressed:(id)sender {
    [self dismissSelf];
}
-(void) dismissSelf{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if(self.entry != nil)
    {
        self.textField.text = self.entry.body;
    }
    
    // Do any additional setup after loading the view.
    //[self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) insertDiaryEntry{
    FHCoreDataStack *coreDataStack = [FHCoreDataStack defaultStack];
    FHDiaryEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"FHDiaryEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.body = self.textField.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    [coreDataStack saveContext];
}


#pragma mark - Navigation




@end
