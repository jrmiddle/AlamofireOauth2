//
//  OAuth2ApplicationClient.swift
//  AlamofireOauth2
//
//  Created by Justin Middleton on 7/18/16.
//  Copyright © 2016 evict. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIApplication Work -

class OAuth2ApplicationClient: OAuth2Client {
    
    // MARK: - Private helper methods
    
    var activeController: UIViewController {
        get {
            if self.sourceViewController == nil {
                self.sourceViewController = UIApplication.topViewController()
            }
            if self.sourceViewController != nil {
                return self.sourceViewController!
            }
            print("WARNING: You should have an active UIViewController! ")
            return UIViewController()
        }
    }
    
    // Retrieves the autorization code by presenting a webView that will let the user login
    override internal func retrieveAuthorizationCode(authoCode:((authorizationCode:String?, error: NSError?) -> Void)) -> Void{
        
        func success(code:String) -> Void {
            activeController.dismissViewControllerAnimated(true, completion: nil)
            authoCode(authorizationCode:code, error: nil)
        }
        
        func failure(error:NSError) -> Void {
            activeController.dismissViewControllerAnimated(true, completion: nil)
            authoCode(authorizationCode:nil, error: error)
        }
        
        let authenticationViewController:AuthenticationViewController = AuthenticationViewController(oauth2Settings: oauth2Settings, successCallback:success, failureCallback:failure)
        let navigationController:UINavigationController = UINavigationController(rootViewController: authenticationViewController)
        
        activeController.presentViewController(navigationController, animated:true, completion:nil)
    }
    
    
}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.sharedApplication().keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            
            if let top = moreNavigationController.topViewController where top.view.window != nil {
                return topViewController(top)
            } else if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        
        return base
    }
}