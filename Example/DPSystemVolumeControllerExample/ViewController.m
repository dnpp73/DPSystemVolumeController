#import "ViewController.h"
#import "DPSystemVolumeController.h"


@interface ViewController () <DPSystemVolumeControllerObserving>
@property (nonatomic, weak) IBOutlet UISlider* ringtoneVolumeSlider;
@property (nonatomic, weak) IBOutlet UILabel*  ringtoneVolumeLabel;
@property (nonatomic, weak) IBOutlet UISlider* audioVideoVolumeSlider;
@property (nonatomic, weak) IBOutlet UILabel*  audioVideoVolumeLabel;
@end


@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[DPSystemVolumeController sharedController] addSystemVolumeControllerObserver:self];
    
    {
        float volume = [DPSystemVolumeController sharedController].volumeForRingtone;
        self.ringtoneVolumeSlider.value = volume;
        self.ringtoneVolumeLabel.text = [NSString stringWithFormat:@"%.2f", volume];
    }
    {
        float volume = [DPSystemVolumeController sharedController].volumeForAudioVideo;
        self.audioVideoVolumeSlider.value = volume;
        self.audioVideoVolumeLabel.text = [NSString stringWithFormat:@"%.2f", volume];
    }
    
    {
        #if TARGET_IPHONE_SIMULATOR
        self.ringtoneVolumeSlider.enabled = NO;
        self.audioVideoVolumeSlider.enabled = NO;
        #endif
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    #if TARGET_IPHONE_SIMULATOR
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Not Work in Simulator"
                                                                   message:@"Go Back"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
    #endif
}

#pragma mark - IBActions

- (IBAction)valueChangedRingtoneVolumeSlider:(UISlider*)sender
{
    [DPSystemVolumeController sharedController].volumeForRingtone = sender.value;
}

- (IBAction)valueChangedAudioVideoVolumeSlider:(UISlider*)sender
{
    [DPSystemVolumeController sharedController].volumeForAudioVideo = sender.value;
}

#pragma mark - DPSystemVolumeControllerObserving

- (void)systemVolumeController:(DPSystemVolumeController*)systemVolumeController
               didChangeVolume:(float)volume
               isExplictChange:(BOOL)isExplictChange
                 audioCategory:(id)audioCategory
{
    if ([audioCategory isKindOfClass:[NSString class]] && [audioCategory isEqualToString:@"Ringtone"]) {
        if (self.ringtoneVolumeSlider.isTracking == NO) {
            self.ringtoneVolumeSlider.value = volume;
        }
        self.ringtoneVolumeLabel.text = [NSString stringWithFormat:@"%.2f", volume];
    }
    else if ([audioCategory isKindOfClass:[NSString class]] && [audioCategory isEqualToString:@"Audio/Video"]) {
        if (self.audioVideoVolumeSlider.isTracking == NO) {
            self.audioVideoVolumeSlider.value = volume;
        }
        self.audioVideoVolumeLabel.text = [NSString stringWithFormat:@"%.2f", volume];
    }
    
}

@end
