//
//  LoginViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/10/24.
//

import UIKit

protocol loginViewControllerDelegate: AnyObject {
    func didRegisterTapped()
    func didLoginTapped()
}

class LoginViewController: UIViewController {
    
    private let loginUI = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
    }
    
    private func setupHelpers() {
        view.backgroundColor = .systemBackground
        loginUI.delegate = self
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
    }
    
    private func setupConstraints() {
        view.addSubview(loginUI)
        loginUI.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension LoginViewController: loginViewControllerDelegate {
    func didRegisterTapped() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    
    func didLoginTapped() {
        let vc = TabBarController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
