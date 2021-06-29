//
//  AuthService.swift
//  Technical_Task_For_Flypika
//
//  Created by Baravitski Aliaksandr on 26.06.21.
//

import VKSdkFramework

protocol AuthServiceDelegate: class {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceDidSignInFail()
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appId = "7889225"
    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeUpSession() {
        let scope = ["offline"]
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            switch state {
            case .authorized:
                print("authorized")
                delegate?.authServiceSignIn()
            case .initialized:
                print("initialized")
                VKSdk.authorize(scope)
            default:
                delegate?.authServiceDidSignInFail()
                fatalError(error!.localizedDescription)
            }
        }
    }
    
    // MARK: - VKSdkDelegate
    var token: String? {
        return VKSdk.accessToken()?.accessToken
    }

    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSignIn()
        } else {
            print(result.error.localizedDescription)
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    // MARK: - VKSdkUIDelegate
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
