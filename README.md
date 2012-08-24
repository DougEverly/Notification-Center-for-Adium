Notification-Center-for-Adium
=============================

Adds Mountain Lion's Notification Center to Adium.

This code implements an AIActionHandler to create Notification Center (NSUserNotification) in Mountain Lion.

Code based off of AIEventSoundsPlugin and ESEventSoundAlertDetailPane files included in Adium.

Usage
-----

* Download Adium source code: hg clone http://hg.adium.im/adium/Source
* Add these files to Adium project. Target to Adium.
* Make this module available by adding @"DENotificationCenterPlugin" to componentClassNames in AICoreComponentLoader.m.
* Build and run.

"Display a notification" will appear in the Events preferences panel.
