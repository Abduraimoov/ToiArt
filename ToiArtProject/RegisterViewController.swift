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
    func showErrorAlert(message: String)
}

class RegisterViewController: UIViewController {
    
    private let registerUI = RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerUI.localizesLanguage()
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
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка".localized(),
                                      message: message.localized(),
                                      preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Ок".localized(), style: .destructive, handler: nil)
        alert.addAction(acceptAction)
        present(alert, animated: true)
    }
}

extension RegisterViewController: RegisterViewControllerDelegate {
    
    func showErrorAlert(message: String) {
        showAlert(message: message)
    }
    
    func didLoginButton() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    func didSingupButton() {
        let vc = TabBarController()
        if let menuVC = (vc.viewControllers?[3] as? UINavigationController)?.viewControllers.first as? MenuViewController {
            menuVC.name = registerUI.nameTextField.text
        }
        navigationController?.pushViewController(ViewController(), animated: true)
    }
}
