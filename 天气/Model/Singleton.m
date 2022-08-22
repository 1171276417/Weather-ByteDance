//
//  Singleton.m
//  Weather
//
//  Created by 邓杰 on 2022/7/27.
//

#import "Singleton.h"

@implementation Singleton


+ (Singleton *)sharedManager {
  static dispatch_once_t onceToken;
  static Singleton *sharedManager;
  dispatch_once(&onceToken, ^{
    sharedManager=[[Singleton alloc] init];
  });
  return sharedManager;
}


@end
