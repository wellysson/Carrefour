//
//  LottieAnimation.swift
//  desafio-carrefour
//
//  Created by Wellysson Avelar on 14/09/23.
//

import UIKit
import Lottie

private let data = ProgressHud()

final class ProgressHud: NSObject {
    static var shared: ProgressHud {
        return data
    }
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    let animationView = AnimationView(name: "loading_spinner")
    private var visible = false
    
    override init() {
        super.init()
        
        let colorCallback = ColorValueProvider(UIColor(rgba: "#C4C4C4").lottieColorValue)
        let keypath = AnimationKeypath(keypath: "**.Stroke 1.Color")
        animationView.setValueProvider(colorCallback, keypath: keypath)
        
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        
        container.frame = keyWindow.frame
        container.center = keyWindow.center
        container.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        
        container.accessibilityIdentifier = "ProgressHud"
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        loadingView.center = keyWindow.center
        loadingView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        
        animationView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        
        DispatchQueue.main.async { [weak self] in
            
            guard let _animationView = self?.animationView,
                  let _loadingView = self?.loadingView else { return }
            
            self?.loadingView.addSubview(_animationView)
            self?.container.addSubview(_loadingView)
        }
        
    }
    
    func showIn(view: UIView, loadingSize: CGRect) {
        self.container.frame = view.bounds
        self.loadingView.frame = loadingSize
        animationView.frame = loadingSize
        self.loadingView.center = view.convert(view.center, from: view.superview)
        self.loadingView.center = container.center
        view.addSubview(container)
        self.animationView.play()
    }

    func show() {
        if !visible {
            self.visible = true
            guard let keyWindow = UIApplication.shared.keyWindow else { return }
            
            if container.frame.height != keyWindow.frame.height {
                container.frame = keyWindow.frame
                container.center = keyWindow.center
                loadingView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                loadingView.center = keyWindow.center
                animationView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            }
            keyWindow.addSubview(container)
            animationView.play()
        }
    }
    
    func hide() {
        self.visible = false
        DispatchQueue.main.async { [weak self] in
            self?.animationView.stop()
            self?.container.removeFromSuperview()
        }
    }

}
