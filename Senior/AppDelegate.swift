//
//  AppDelegate.swift
//  Senior
//
//  Created by CPE KMUTT on 10/16/2558 BE.
//  Copyright © 2558 Naphat Jindathanakit. All rights reserved.
//

import UIKit
import Parse
import Bolts
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ESTBeaconManagerDelegate {

    var window: UIWindow?
    let beaconNotificationsManager = BeaconNotificationsManager()
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //ESTConfig.setupAppID("tikkiizz-hotmail-com-s-not-mfc", andAppToken: "955fdfa0974cac376345ca11531950dd")
        ESTConfig.setupAppID("senior-imv", andAppToken: "3b393148513ebe9ce59c7a13033e254c")
        self.beaconNotificationsManager.enableNotificationsForBeaconID(
            BeaconID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D", major: 49216, minor: 4376),
            enterMessage: "Hello, world.",
            exitMessage: "Goodbye, world." // NOTE: "exit" event has a built-in delay of 30 seconds, to make sure that the user has really exited the beacon's range. The delay is imposed by iOS and is non-adjustable.
        )

        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("fGTU9xvUuaXtqIW7vekR8AzfbabgepPQY2Kk1uKZ",
            clientKey: "2FH65XD7RyeRj2KBSVwlZ4t0py9yYI9tFRUhaLff")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

