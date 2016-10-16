//
//  AppDelegate.swift
//  WhatsTheWeather
//
//  Created by brizton floyd on 10/12/16.
//  Copyright © 2016 brizton floyd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // set up the main launch screen
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: WeatherViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        UINavigationBar.appearance().barTintColor = UIColor.setTransParency(redColor: 100, green: 149, blue: 237)
        application.statusBarStyle = .lightContent
        
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.setTransParency(redColor: 65, green: 105, blue: 225)
        window?.addSubview(statusBarBackgroundView)
        window?.addContraints(formatString:"H:|[v0]|", view: statusBarBackgroundView)
        window?.addContraints(formatString: "V:|[v0(20)]", view: statusBarBackgroundView)
        
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

