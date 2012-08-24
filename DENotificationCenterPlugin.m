/*
 * Adium is the legal property of its developers, whose names are listed in the copyright file included
 * with this source distribution.
 *
 * This program is free software; you can redistribute it and/or modify it under the terms of the GNU
 * General Public License as published by the Free Software Foundation; either version 2 of the License,
 * or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
 * the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
 * Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program; if not,
 * write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

#import <Adium/AIChatControllerProtocol.h>
#import <Adium/AIInterfaceControllerProtocol.h>
#import <Adium/AIContactAlertsControllerProtocol.h>
#import "DENotificationCenterPlugin.h"
#import <AIUtilities/AIImageAdditions.h>
#import <Adium/AIListContact.h>
#import <Adium/AIListObject.h>

#define OPEN_MESSAGE_ALERT_SHORT	AILocalizedString(@"Display user notifcation",nil)
#define OPEN_MESSAGE_ALERT_LONG		OPEN_MESSAGE_ALERT_SHORT

@implementation DENotificationCenterPlugin

- (void)installPlugin
{
	[adium.contactAlertsController registerActionID:@"DisplayUserNotication" withHandler:self];
}


    //Open Message Alert ---------------------------------------------------------------------------------------------------
#pragma mark Play Sound Alert
- (NSString *)shortDescriptionForActionID:(NSString *)actionID
{
	return OPEN_MESSAGE_ALERT_SHORT;
}

- (NSString *)longDescriptionForActionID:(NSString *)actionID withDetails:(NSDictionary *)details
{
	return OPEN_MESSAGE_ALERT_LONG;
}

- (NSImage *)imageForActionID:(NSString *)actionID
{
	return [NSImage imageNamed:@"events-notificationcenter-alert" forClass:[self class]];
}

- (AIActionDetailsPane *)detailsPaneForActionID:(NSString *)actionID
{
	return nil;
}

- (BOOL)performActionID:(NSString *)actionID forListObject:(AIListObject *)listObject withDetails:(NSDictionary *)details triggeringEventID:(NSString *)eventID userInfo:(id)userInfo
{
        // Insert code here to initialize your application

    AIListContact * obj2 = [userInfo objectForKey:@"AIListContact"];

    AIContentObject * obj = [userInfo objectForKey:@"AIContentObject"];

    NSUserNotification * notice = [[NSUserNotification alloc] init];
    notice.title = listObject.longDisplayName;
    notice.informativeText = [obj.message string];
    notice.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:listObject.internalObjectID, @"internalObjectID", nil];
    
    NSUserNotificationCenter * center = [NSUserNotificationCenter defaultUserNotificationCenter];
    [center setDelegate:self];
    
    [center deliverNotification:notice];

	return YES;
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification
{
    NSLog(@"userNotificationCenter:didActivateNotification:");
}

- (BOOL)allowMultipleActionsWithID:(NSString *)actionID
{
	return NO;
}

@end
