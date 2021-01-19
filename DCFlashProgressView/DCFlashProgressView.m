//
//  DCFlashProgressView.m
//  S.T.A.R.
//
//  Created by 李夙璃 on 2048/10/24.
//

#import "DCFlashProgressView.h"

#if defined(__cplusplus)
    #define let auto const
#else
    #define let const __auto_type
#endif

@interface DCFlashProgressView ()

@property (nonatomic, readonly) CAShapeLayer *progressLayer;

@end

@implementation DCFlashProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.clearColor;
        
        _progress = 0;
        _progressTintColor = [UIColor blackColor];
        _trackTintColor = [UIColor colorWithRed:190.0 / 255.0 green:40.0 / 255.0 blue:7.0 / 255.0 alpha:1.0];
       
        _progressLayer = CAShapeLayer.layer;
        
        [self.layer addSublayer:_progressLayer];
        
        [self setNeedsLayout];
    }
    
    return self;
}

// MARK: - Refresh
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self refreshLayers];
    [self refreshProgress];
}

- (void)refreshLayers {
    let CGSizeScaleAspectFitInContainer = ^ CGRect (const CGSize size, const CGSize container) {
        if (size.width <= 0 || size.height <= 0) {
            return CGRectZero;
        }
        
        CGSize contentSize = CGSizeZero;
        CGFloat widthScale = container.width / size.width;
        CGFloat heightScale = container.height / size.height;

        if (widthScale > heightScale) {
            contentSize = CGSizeMake(size.width * heightScale, container.height);
        } else {
            contentSize = CGSizeMake(container.width, size.height * widthScale);
        }

        CGPoint origin = CGPointMake((container.width - contentSize.width) / 2.0, (container.height - contentSize.height) / 2.0);

        return CGRectMake(origin.x, origin.y, contentSize.width, contentSize.height);
    };
    
    let size = CGSizeMake(299.0, 308.0);
    let rect = CGSizeScaleAspectFitInContainer(size, self.bounds.size);
    let p = ^ CGPoint (CGFloat x, CGFloat y) {
        return CGPointMake(x * rect.size.width / size.width, y * rect.size.height / size.height);
    };

    let mask = CAShapeLayer.layer;
    mask.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
    mask.shadowOpacity = 0.75;
    mask.shadowOffset = CGSizeMake(2.0, 2.0);
    mask.shadowColor = self.trackTintColor.CGColor;
    mask.path = ({
        let path = UIBezierPath.bezierPath;
        [path moveToPoint:p(299.0, 0.0)];
        [path addLineToPoint:p(86.0, 130.0)];
        [path addLineToPoint:p(136.0, 138.0)];
        [path addLineToPoint:p(51.0, 205.0)];
        [path addLineToPoint:p(97.0, 212.0)];
        [path addLineToPoint:p(0.0, 308.0)];
        [path addLineToPoint:p(208.0, 180.0)];
        [path addLineToPoint:p(152.0, 172.0)];
        [path addLineToPoint:p(242.0, 108.0)];
        [path addLineToPoint:p(193.0, 99.0)];
        [path closePath];
        
        path.CGPath;
    });
    
    self.progressLayer.frame = rect;
    self.progressLayer.mask = mask;
    self.progressLayer.backgroundColor = self.trackTintColor.CGColor;
    self.progressLayer.fillColor = self.progressTintColor.CGColor;
}

- (void)refreshProgress {
    let rect = self.progressLayer.bounds;
    let height = self.progress * rect.size.height;
    
    self.progressLayer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, rect.size.height - height, rect.size.width, height)].CGPath;
}

// MARK: - Public
- (void)setProgress:(CGFloat)progress {
    _progress = MIN(MAX(0, progress), 1);
    
    [self refreshProgress];
}

- (void)setProgressTintColor:(UIColor *)progressTintColor {
    _progressTintColor = progressTintColor;
    
    [self setNeedsLayout];
}

- (void)setTrackTintColor:(UIColor *)trackTintColor {
    _trackTintColor = trackTintColor;
    
    [self setNeedsLayout];
}

@end
