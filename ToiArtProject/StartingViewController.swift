//
//  StartingViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/8/24.
//

import UIKit
import SnapKit

protocol StartingViewControllerDelegate: AnyObject {
    func didRegisterButton()
    func didLoginButton()
    func didPhoneNumberButton()
}

class StartingViewController: UIViewController {
    
    private let startingUiView = StartingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
    }
    
    private func setupHelpers() {
        view.backgroundColor = .systemBackground
        startingUiView.delegate = self
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
    }
    
    private func setupConstraints() {
        view.addSubview(startingUiView)
        startingUiView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

extension StartingViewController: StartingViewControllerDelegate {
    
    func didRegisterButton() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    
    func didLoginButton() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    
    func didPhoneNumberButton() {
        let vc = PhoneNumberViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
