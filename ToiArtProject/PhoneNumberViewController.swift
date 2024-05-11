//
//  PhoneNumberViewController.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit
import FirebaseAuth
import SnapKit

class PhoneNumberViewController: UIViewController {

    private let autorizationview = PhoneNumberView()
    private let authService = AuthService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHelpers()
        setupConstrains()
    }
    
    private func setupHelpers() {
        view.backgroundColor = .systemBackground
        autorizationview.delegate = self
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .label
    }
    
    private func setupConstrains() {
        view.addSubview(autorizationview)
        autorizationview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(135)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-250)
        }
    }
    
    private func smsCode() {
        let vc = SmsViewController()
        self.navigationController?.pushViewController(vc,
                                                      animated: true)
    }
}

extension PhoneNumberViewController: PhoneNumberViewDelegate {
    
    func smsCode(with phoneNumberTFText: String) {
        
        authService.sendSmsCode(with: phoneNumberTFText) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    let vc = SmsViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                case .failure(let error):
                    print("Failed to send SMS: \(error.localizedDescription)")
                }
            }
        }
    }
    
}
