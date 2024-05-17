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
    func showErrorAlert(message: String)
}

class LoginViewController: UIViewController {
    
    private let loginUI = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginUI.languagelocalizable()
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
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка".localized(),
                                      message: message.localized(),
                                      preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Ок".localized(), style: .destructive, handler: nil)
        alert.addAction(acceptAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: loginViewControllerDelegate {
    
    func showErrorAlert(message: String) {
        showAlert(message: message)
    }
    
    func didRegisterTapped() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    
    func didLoginTapped() {
        let vc = NameViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
}
