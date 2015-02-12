/*
 * (C) Copyright Itude Mobile B.V., The Netherlands.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "CustomStyleHandler.h"
#import "UIImage+CustomStyle.h"

@implementation CustomStyleHandler

- (void) applyStyle:(UIView *)contentView page:(MBPage *)page viewState:(MBViewState)viewState
{    
    // Set a simple background image
	NSString *style = [MBProperties valueForProperty:@"styleScheme"];
    UIImage *image = [UIImage imageNamed:@"Background" forStyleScheme:style];
	UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:image];
	[contentView addSubview:backgroundImageView];
	[contentView sendSubviewToBack:backgroundImageView];
}

- (void) styleNavigationBar:(UINavigationBar *)bar
{
	bar.tintColor = [UIColor colorWithRed:0 green:0.34 blue:0.66 alpha:1.0];
}

- (void) styleToolbar:(UIToolbar *)toolbar
{
    toolbar.tintColor = [UIColor colorWithRed:0 green:0.34 blue:0.66 alpha:1.0];
}

@end
