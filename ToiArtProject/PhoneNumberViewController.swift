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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        autorizationview.localizedLanguage()
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
           
           if phoneNumberTFText.hasPrefix("+996") && phoneNumberTFText.count == 13 {
               authService.sendSmsCode(with: phoneNumberTFText) { result in
                   DispatchQueue.main.async {
                       switch result {
                       case .success:
                           let vc = SmsViewController()
                           self.navigationController?.pushViewController(vc, animated: true)
                       case .failure(let error):
                           self.presentAlert(with: "Ошибка отправки SMS", message: error.localizedDescription)
                       }
                   }
               }
           } else {
               
               self.presentAlert(with: "Неверный формат номера", message: "Пожалуйста, введите номер с кодом +996 и общей длиной 13 символов.")
           }
       }

       private func presentAlert(with title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
   }
