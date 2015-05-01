DPSystemVolumeController
=================

[![Pod Version](http://img.shields.io/cocoapods/v/DPSystemVolumeController.svg?style=flat-square)](http://cocoadocs.org/docsets/DPSystemVolumeController/)
[![Pod Platform](http://img.shields.io/cocoapods/p/DPSystemVolumeController.svg?style=flat-square)](http://cocoadocs.org/docsets/DPSystemVolumeController/)
[![Pod License](http://img.shields.io/cocoapods/l/DPSystemVolumeController.svg?style=flat-square)](http://opensource.org/licenses/MIT)

### Dependency
* None

### Require Framework
* `AVFoundation.framework`
* `MediaPlayer.framework`

# Description

change iOS Ringtone/AudioVideo volume programmable, using private class.

This library can be pass the Apple's review for now(April, 2015).

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

# LICENSE

Copyright (c) 2015 Yusuke Sugamiya

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
