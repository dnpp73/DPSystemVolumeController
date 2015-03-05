#import <Foundation/Foundation.h>


#if TARGET_OS_IPHONE && !(TARGET_IPHONE_SIMULATOR)
#define ENABLE_ACCESS_PRIVATE_API 1
#if ENABLE_ACCESS_PRIVATE_API


@class DPSystemVolumeController;


@protocol DPSystemVolumeControllerObserving <NSObject>
@optional
- (void)systemVolumeController:(DPSystemVolumeController*)systemVolumeController
               didChangeVolume:(float)volume
               isExplictChange:(BOOL)isExplictChange
                 audioCategory:(id)audioCategory;
@end


@interface DPSystemVolumeController : NSObject

+ (instancetype)sharedController;

@property (nonatomic) float volumeForRingtone;
@property (nonatomic) float volumeForAudioVideo;

- (void)addSystemVolumeControllerObserver:(__weak id<DPSystemVolumeControllerObserving>)observer;
- (void)removeSystemVolumeControllerObserver:(__weak id<DPSystemVolumeControllerObserving>)observer;

@end


#endif
#endif
