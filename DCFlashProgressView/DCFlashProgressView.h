//
//  DCFlashProgressView.h
//  S.T.A.R.
//
//  Created by 李夙璃 on 2048/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// DCFlashProgressView, flash is aspect fit in view.
@interface DCFlashProgressView : UIView

@property (nonatomic) CGFloat progress;

@property(nonatomic) UIColor* progressTintColor;

@property(nonatomic) UIColor* trackTintColor;

@end

NS_ASSUME_NONNULL_END
