//
//  LectureBookManager.h
//  BaseProject
//
//  Created by apple-jd01 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "LectureBookModel.h"
typedef NS_ENUM(NSUInteger, BookType){
    BookTypeAll,
    BookTypeTeacher,
    BookTypeHistory,
    BookTypeKing,
    BookTypeMan,
    BookTypeTraditional
};

@interface LectureBookManager : BaseNetManager
+ (id)getLectureBookType:(BookType)type pageId:(NSInteger)pageId kCompletionHandle;
@end
