#import <Foundation/Foundation.h>


#if TARGET_OS_IPHONE


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

@property (nonatomic) dispatch_queue_t observingQueue; // default: mainQueue

@end


#endif
