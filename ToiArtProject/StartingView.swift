//
//  StartingView.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/8/24.
//

import UIKit
import SnapKit

class StartingView: UIView {
    
    private let logoIMage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "imagretoi")
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let logoToiArt: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoo")
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let deckriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Добро пожаловать на творческую платформу Toi Art. выберите способ входа."
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 20,
                                weight: .semibold)
        view.textAlignment = .center
        view.textColor = UIColor.init(hex: "#00AA00")
        return view
    }()
    
    private let registrationbutton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle(
            "Зарегистрироваться",
            for: .normal)
        view.tintColor = .label
        view.titleLabel?.font = .systemFont(ofSize: 18)
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let numberPhoneButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle(
            "Войти по номеру телефона",
            for: .normal)
        view.tintColor = .label
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let loginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle(
            "Войти",
            for: .normal)
        view.tintColor = .label
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1.5
        view.layer.cornerRadius = 16
        return view
    }()
    
    weak var delegate: StartingViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAdd()
        setupConstraints()
        setupAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func localizedLanguage() {
        deckriptionLabel.text = "Добро пожаловать на творческую платформу Toi Art. выберите способ входа.".localized()
        registrationbutton.setTitle(
            "Зарегистрироваться".localized(),
            for: .normal)
        numberPhoneButton.setTitle(
            "Войти по номеру телефона".localized(),
            for: .normal)
        loginButton.setTitle(
            "Войти".localized(),
            for: .normal)
    }
    
    private func setupAdd() {
        addSubview(logoIMage)
        addSubview(logoToiArt)
        addSubview(deckriptionLabel)
        addSubview(registrationbutton)
        addSubview(loginButton)
        addSubview(numberPhoneButton)
    }
    
    private func setupConstraints() {
        logoIMage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(120)
        }
        
        logoToiArt.snp.makeConstraints { make in
            make.top.equalTo(logoIMage.snp.bottom).offset(80)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(54)
        }
        
        deckriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(logoToiArt.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(22)
        }
        
        registrationbutton.snp.makeConstraints { make in
            make.top.equalTo(deckriptionLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        numberPhoneButton.snp.makeConstraints { make in
            make.top.equalTo(registrationbutton.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(numberPhoneButton.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
    
    private func setupAddTarget() {
        registrationbutton.addTarget(self,
                                     action: #selector(registerScreen),
                                     for: .touchUpInside)
        loginButton.addTarget(self,
                              action: #selector(loginUITransilation),
                              for: .touchUpInside)
        numberPhoneButton.addTarget(self,
                                    action: #selector(phoneNumberUI),
                                    for: .touchUpInside)
    }
    
    @objc
    private func registerScreen() {
        delegate?.didRegisterButton()
    }
    
    @objc
    private func loginUITransilation() {
        delegate?.didLoginButton()
    }
    
    @objc
    private func phoneNumberUI() {
        delegate?.didPhoneNumberButton()
    }
}
