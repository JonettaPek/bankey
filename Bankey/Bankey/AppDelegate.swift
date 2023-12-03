//
//  AppDelegate.swift
//  Bankey
//
//  Created by Jonetta Pek on 27/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var hasOnboarded: Bool = false
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyViewController.logoutDelegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = LoginViewController()
//        window?.rootViewController = OnboardingContainerViewController()
//        window?.rootViewController = OnboardingViewController(withImage: "delorean", withText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s.")
//        window?.rootViewController = loginViewController
        
        let navigationController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navigationController
        
        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(dummyViewController)
        } else {
            setRootViewController(onboardingContainerViewController)
        }
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(dummyViewController)
    }
}

extension AppDelegate: LogoutDelegate {
    
    func didLogout() {
        setRootViewController(loginViewController)
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
    
}
