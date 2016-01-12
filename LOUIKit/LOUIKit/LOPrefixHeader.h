//
//  LOPrefixHeader.h
//  LOUIKit
//
//  Created by ShihKuo-Hsun on 2015/5/13.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#define OSVersion [UIDevice currentDevice].systemVersion.floatValue

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed: ((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green: ((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue: ((float)(rgbValue & 0xFF)) / 255.0 alpha: 1.0]

