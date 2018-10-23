//
//  AppDelegate.swift
//  Exercises
//
//  Created by  Kostantin Zarubin on 17.09.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FacebookCore
import YandexMobileMetrica

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        YMMYandexMetrica.activate(with: YMMYandexMetricaConfiguration.init(apiKey: "47ed2f13-cac9-44e4-8fba-e0dd28aeb408")!)
        
        if UserDefaults.standard.object(forKey: "OnOnboarding") as? Int == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "TabBar")
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        AppEventsLogger.activate(application)
    }

}

