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

#import "CustomApplicationController.h"
#import "CustomApplicationFactory.h"
#import "CustomStyleHandler.h"
#import "CustomDataHandler.h"

@implementation CustomApplicationController

- (void) startController
{
	// Uncomment this in development/test mode to get the stacktrace on-screen
	//InstallUncaughtExceptionHandler();

    [MBViewBuilderFactory sharedInstance].styleHandler = [CustomStyleHandler new];
    
    // Uncomment to register a custom datahandler
    // [[MBDataManagerService sharedInstance] registerDataHandler:[[CustomDataHandler new] autorelease] withName:@"CustomDataHandler"];
    
    // registers a factory that creates custom ViewControllers and Custom Actions
    [MBApplicationFactory setSharedInstance:[CustomApplicationFactory new]];
    
    [self performSelectorOnMainThread:@selector(startApplication:) withObject:[MBApplicationFactory sharedInstance] waitUntilDone:YES];
}

- (void) startApplication:(MBApplicationFactory *)_applicationFactory
{
    // Start the application
    [super startApplication:_applicationFactory];
}

// support 3.x
- (void) applicationDidFinishLaunching:(UIApplication *)application
{
	[self application:application didFinishLaunchingWithOptions:nil];
}

// for 4.x
- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // start startup sequence in background
    // todo: waarom is dit nodig?
    [self performSelectorInBackground:@selector(startController) withObject:nil];
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
	
    return YES;
}


@end
