//
//  RegisterViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/10/24.
//

import UIKit

protocol RegisterViewControllerDelegate: AnyObject {
    func didLoginButton()
    func didSingupButton()
}

class RegisterViewController: UIViewController {
    
    private let registerUI = RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
    }
    
    private func setupHelpers() {
        view.backgroundColor = .systemBackground
        registerUI.delegate = self
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
    }
    
    private func setupConstraints() {
        view.addSubview(registerUI)
        registerUI.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension RegisterViewController: RegisterViewControllerDelegate {
    func didLoginButton() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    func didSingupButton() {
        let vc = TabBarController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
