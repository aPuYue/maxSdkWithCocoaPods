//
//  ViewController.swift
//  maxSdkWithCocoaPods
//
//  Created by Pu Yue - PU YUE on 2022/07/19.
//

import UIKit
import AppLovinSDK

class ViewController: UIViewController {
    
    var rewardedAd: MARewardedAd!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.rewardedAd = MARewardedAd.shared(withAdUnitIdentifier: "df67b45ce946d30d")
        self.rewardedAd.delegate = self
        self.rewardedAd.load()
    }
}

extension ViewController: MAAdViewAdDelegate, MARewardedAdDelegate {
    func didLoad(_ ad: MAAd) {
        let networkName = ad.networkName
        let creativeIdentifier = ad.creativeIdentifier
        let usingUnitId = ad.adUnitIdentifier
        print("TEST MAX NETWORK [Max Rewarded]: \(#function), adunitId: \(usingUnitId), networkName: \(networkName), creativeIdentifier: \(creativeIdentifier)")
        rewardedAd.show()
    }
    
    func didDisplay(_ ad: MAAd) {
        print("[Max Rewarded]: \(#function)")
    }
    
    func didHide(_ ad: MAAd) {
        print("[Max Rewarded]: \(#function)")
    }
    
    func didClick(_ ad: MAAd) {
        print("[Max Rewarded]: \(#function)")
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        print("[Max Rewarded]: \(#function): adUnitIdentifier: \(adUnitIdentifier), error: \(error.message)")
    }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError) {
        let networkName = ad.networkName
        let creativeIdentifier = ad.creativeIdentifier
        let usingUnitId = ad.adUnitIdentifier
        print("TEST MAX NETWORK [Max Rewarded]: \(#function): error: \(error.message), adunitId: \(usingUnitId), networkName: \(networkName), creativeIdentifier: \(creativeIdentifier)")
    }
    
    @objc(didStartRewardedVideoForAd:) func didStartRewardedVideo(for ad: MAAd) {
        print("[Max Rewarded]: \(#function)")
    }
    
    @objc(didCompleteRewardedVideoForAd:) func didCompleteRewardedVideo(for ad: MAAd) {
        print("[Max Rewarded]: \(#function)")
    }
    
    @objc(didRewardUserForAd:withReward:) func didRewardUser(for ad: MAAd, with reward: MAReward) {
        print("[Max Rewarded]: \(#function): \(reward.amount) \(reward.label)")
    }
    
    func didExpand(_ ad: MAAd) {
        print("[Max Rewarded]: \(#function)")
    }
    
    func didCollapse(_ ad: MAAd) {
        print("[Max Rewarded]: \(#function)")
    }
}
