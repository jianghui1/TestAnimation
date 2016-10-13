//
//  ViewController.swift
//  TestAnimation
//
//  Created by ys on 15/12/29.
//  Copyright © 2015年 ys. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var redView: UIView = UIView()
    var yellowView: UIView = UIView()
    var blackView: UIView = UIView()
    var lightView: UIView = UIView()
    var timer: NSTimer = NSTimer()
    var blueView: UIView = UIView()
    var whileView: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加旋转动画
        self.addRotationAnimation()
        
        // 添加UC加载动画
        self.addUCAnimation()
        
        // 添加圆圈动画
        self.addCircleAnimation()
    
    }
    
    func addRotationAnimation() {
        let redView: UIView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        redView.backgroundColor = UIColor.redColor()
        //        redView.layer.masksToBounds = true
        redView.layer.cornerRadius = 50
        self.view.addSubview(redView)
        self.redView = redView
        
        let yellowView: UIView = UIView(frame: CGRect(x: -10, y: 40, width: 20, height: 20))
        yellowView.backgroundColor = UIColor.yellowColor()
        yellowView.layer.masksToBounds = true
        yellowView.layer.cornerRadius = 10
        self.redView.addSubview(yellowView)
        self.yellowView = yellowView
        
        // 创建动画button
        let button: UIButton = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(100, 250, 100, 30)
        button.addTarget(self, action: "addAnimationToRedView", forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitle("旋转", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.greenColor()
        self.view.addSubview(button)
    }
    
    func addAnimationToRedView() {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = (0)
        animation.toValue = (-M_PI * 2)
        animation.duration = 5
    
        // 添加动画
        self.redView.layer.addAnimation(animation, forKey: "haha")
    }
    
    func addUCAnimation() {
        let blackView: UIView = UIView(frame: CGRect(x: 100, y: 400, width: 20, height: 20))
        blackView.backgroundColor = UIColor.blackColor()
        blackView.layer.masksToBounds = true
        blackView.layer.cornerRadius = 10
        self.view.addSubview(blackView)
        self.blackView = blackView
        
        let lightView: UIView = UIView(frame: CGRect(x: 150, y: 400, width: 20, height: 20))
        lightView.backgroundColor = UIColor.lightGrayColor()
        lightView.layer.masksToBounds = true
        lightView.layer.cornerRadius = 10
        self.view.addSubview(lightView)
        self.lightView = lightView
        
        // 开始动画按钮
        let ucButton: UIButton = UIButton(type: UIButtonType.System)
        ucButton.frame = CGRectMake(100, 450, 100, 30)
        ucButton.setTitle("UC旋转", forState: UIControlState.Normal)
        ucButton.addTarget(self, action: "ucButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(ucButton)
        // 结束动画按钮
        let ucStopButton: UIButton = UIButton(type: UIButtonType.System
        )
        ucStopButton.frame = CGRectMake(100, 500, 100, 30)
        ucStopButton.setTitle("UC停止", forState: UIControlState.Normal)
        ucStopButton.addTarget(self, action: "ucStopButton", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(ucStopButton)
    }
    
    func ucButtonAction() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "ucLoading", userInfo: nil, repeats: true)
    }
    
    var i: Bool = true
    func ucLoading() {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        let fromeValue: CGFloat = i ? 0.5 : 2
        let toValue: CGFloat = i ? 2 : 0.5
        animation.fromValue = (fromeValue)
        animation.toValue = (toValue)
        animation.duration = 1
        self.blackView.layer.addAnimation(animation, forKey: "haha1")
        
        animation.fromValue = (toValue)
        animation.toValue = (fromeValue)
        self.lightView.layer.addAnimation(animation, forKey: "haha2")
        i = !i
    }
    
    func ucStopButton() {
        self.timer.invalidate()
    }
    
    func addCircleAnimation() {
        self.blueView.frame = CGRectMake(100, 550, 100, 100)
        self.blueView.layer.cornerRadius = 50
        self.blueView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(self.blueView)
        
        let innerView: UIView = UIView(frame: CGRect(x: 5 / 2, y: 5 / 2, width: 100 - 5, height: 100 - 5))
        innerView.backgroundColor = UIColor.whiteColor()
        innerView.layer.cornerRadius = (100 - 5) / 2
        self.blueView.addSubview(innerView)
        
        self.whileView.frame = CGRectMake(0, 50 - 30 / 2, 30, 30)
        self.whileView.backgroundColor = UIColor.whiteColor()
        self.blueView.addSubview(self.whileView)
        
        // 开始动画按钮
        let button: UIButton = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(250, 600, 100, 30)
        button.setTitle("开始动画", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func buttonAction() {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = (0)
        animation.toValue = (-M_PI * 2)
        animation.duration = 5;
        
        self.blueView.layer.addAnimation(animation, forKey: "haha2")
    }
}
