//
//  SmsViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit

protocol SmsViewControllerDelegate: AnyObject {
    func didLoginButton()
}

class SmsViewController: UIViewController {
    
    private lazy var smsView = SmsView(frame: .zero)
    private let authService = AuthService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstraints()
    }
    
    private func setupHelpers() {
        view.backgroundColor = .systemBackground
        smsView.delegate = self
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
    }
    
    private func setupConstraints() {
        view.addSubview(smsView)
        smsView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-319)
        }
    }
}

extension SmsViewController: SmsViewControllerDelegate {
    func didLoginButton() {
        let fieldsCode = smsView.getFieldCode()
        authService.signIn(with: fieldsCode) { result in
            switch result {
            case .success(let success):
                let vc = TabBarController()
                self.navigationController?.pushViewController(vc,
                                                                     animated: true)
            case .failure(let error):
                self.showAlert()
            }
        }
    }
}

