//
//  LectureNetManager.h
//  BaseProject
//
//  Created by apple-jd01 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "LectureModel.h"
#import "LectureRoomModel.h"
#import "LectureAlbumsModel.h"
#import "LectureTracksModel.h"
@interface LectureNetManager : BaseNetManager

+ (id)getLectureWithPage:(NSInteger)page kCompletionHandle;

+ (id)getLectureRoomWithPage:(NSInteger)page uid:(NSNumber *)uid kCompletionHandle;

+ (id)getLectureAlbumsWithPage:(NSInteger)page albumId:(NSInteger)albumId kCompletionHandle;

+ (id)getLectureWithTracksId:(NSNumber *)tracksId kCompletionHandle;
@end
