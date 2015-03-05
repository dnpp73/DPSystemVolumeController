#import "ViewController.h"
#if !(TARGET_IPHONE_SIMULATOR)
#import "DPSystemVolumeController.h"
#endif


@interface ViewController ()
#if !(TARGET_IPHONE_SIMULATOR)
<DPSystemVolumeControllerObserving>
#endif
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
    
    #if !(TARGET_IPHONE_SIMULATOR)
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
    #endif
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    #if TARGET_IPHONE_SIMULATOR
    [[[UIAlertView alloc] initWithTitle:@"Not Work in Simulator"
                                message:@"Go Back"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
    #endif
}

#pragma mark - IBActions

- (IBAction)valueChangedRingtoneVolumeSlider:(UISlider*)sender
{
    #if !(TARGET_IPHONE_SIMULATOR)
    [DPSystemVolumeController sharedController].volumeForRingtone = sender.value;
    #endif
}

- (IBAction)valueChangedAudioVideoVolumeSlider:(UISlider*)sender
{
    #if !(TARGET_IPHONE_SIMULATOR)
    [DPSystemVolumeController sharedController].volumeForAudioVideo = sender.value;
    #endif
}

#if !(TARGET_IPHONE_SIMULATOR)

#pragma mark - BILAudioVolumeManagerObserving

- (void)systemVolumeController:(DPSystemVolumeController*)audioVolumeManager
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

#endif

@end
