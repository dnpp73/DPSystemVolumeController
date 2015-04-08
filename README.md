DPSystemVolumeController
=================

### Dependency
* None

### Require Framework
* `AVFoundation.framework`
* `MediaPlayer.framework`

# Description

change iOS Ringtone/AudioVideo volume programmable, using private class.

# Warning

**USE AT YOUR OWN RISK.**

---

# Usage

### How to change volume

#### Ringtone

```Objective-C
// sender is UISlider, 0.0 to 1.0
[DPSystemVolumeController sharedController].volumeForRingtone = sender.value;
```

#### AudioVideo

```Objective-C
// sender is UISlider, 0.0 to 1.0
[DPSystemVolumeController sharedController].volumeForAudioVideo = sender.value;
```

### How to catch volume change event

```Objective-C
[[DPSystemVolumeController sharedController] addSystemVolumeControllerObserver:self];

- (void)systemVolumeController:(DPSystemVolumeController*)systemVolumeController
               didChangeVolume:(float)volume
               isExplictChange:(BOOL)isExplictChange
                 audioCategory:(id)audioCategory
{
    if ([audioCategory isEqualToString:@"Ringtone"]) {
        if (self.ringtoneVolumeSlider.isTracking == NO) {
            self.ringtoneVolumeSlider.value = volume;
        }
        self.ringtoneVolumeLabel.text = [NSString stringWithFormat:@"%.2f", volume];
    }
    else if ([audioCategory isEqualToString:@"Audio/Video"]) {
        if (self.audioVideoVolumeSlider.isTracking == NO) {
            self.audioVideoVolumeSlider.value = volume;
        }
        self.audioVideoVolumeLabel.text = [NSString stringWithFormat:@"%.2f", volume];
    }
}
```