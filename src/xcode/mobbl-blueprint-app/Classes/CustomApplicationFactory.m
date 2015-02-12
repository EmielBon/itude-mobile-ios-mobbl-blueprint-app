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

#import "CustomApplicationFactory.h"
// Controllers
#import "CustomViewController.h"
// Actions
#import "FireInitialOutcomes.h"

@implementation CustomApplicationFactory

- (id<MBResultListener>) createResultListener:(NSString *)listenerClassName
{
	return nil;
}

- (id<MBAction>) createAction:(NSString *)actionClassName
{
	if ([actionClassName isEqualToString:@"FireInitialOutcomes"]) {
		return [FireInitialOutcomes new];
	}
    /*
    else if ([actionClassName isEqualToString:@"MyCustomAction"]) {
        return [[MyCustomAction new] autorelease];
    }
     */
	return nil;
}

- (UIViewController<MBViewControllerProtocol> *) viewControllerForPageWithName:(NSString *)pageName
{
    // Home page (example)
    if ([@"PAGE-home" isEqualToString:pageName]) {
        return [[CustomViewController alloc] init];
    }
    return nil;
}

@end
