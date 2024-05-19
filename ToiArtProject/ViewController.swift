//
//  ViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/17/24.
//

import UIKit
import SnapKit

//MARK: - Экран логотипа с анимацией

class ViewController: UIViewController {
    
    //MARK: - Добавляем картинку на экран
    
    private let logoImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 310, height: 77))
        view.image = UIImage(named: "logoImageView")
        return view
    }()
    
    //MARK: - viewDidLoad() это типа отоброжи это все коды внутри него отображаеться на экран
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoImageView)
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
    }
    
    //MARK: - Дальше уже анимация картинка
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoImageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 1,
                                      execute: {
            self.animate()
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 2
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.logoImageView.frame = CGRect(
                x: -(diffX / 2),
                y: diffY / 2,
                width: size,
                height: size)
        })
        
        UIView.animate(withDuration: 1, animations: {
            self.logoImageView.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    let vc = TabBarController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc,
                                 animated: true)
                })
            }
        })
    }
}
