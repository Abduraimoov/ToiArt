//
//  LoginView.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/10/24.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    private let logoIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoImageToi")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин"
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.tintColor = .label
        
        return label
    }()
    
    private let enterCredemtailsLabel: UILabel = {
        let view = UILabel()
        view.text = "Введите адрес электронной почты и пароль"
        view.font = .systemFont(ofSize: 16,
                                weight: .medium)
        view.numberOfLines = 0
        view.textColor = UIColor.init(hex: "#7C7C7C")
        return view
    }()
    
   private let emailTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let emailLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .label
        view.text = " Емаил "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    private let passwordTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.isSecureTextEntry = true
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        let rightView = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: 24,
            height: 24))
        rightView.setBackgroundImage(UIImage(
            systemName: "eye.slash"),
                                     for: .normal)
        rightView.tintColor = .label
        rightView.tag = 0
        rightView.addTarget(self,
                            action: #selector(hideText),
                            for: .touchUpInside)
        view.rightView = rightView
        view.rightViewMode = .always
        return view
    }()
    
    private let passwordLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " Пароль "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    private let forgotButton: UIButton = {
        let view = UIButton()
        view.setTitle("Забыли пароль ?",
                      for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 14,
                                            weight: .medium)
        view.setTitleColor(UIColor.init(hex: "#53B175"),
                           for: .normal)
        return view
    }()
    
    private let LoginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Войти",
                      for: .normal)
        view.tintColor = .black
        view.backgroundColor = UIColor.init(hex: "#00d400")
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let stackLabels: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 4
        return view
    }()
    
    private let accountLabel: UILabel = {
        let view = UILabel()
        view.text = "У вас нету аккаунта ?"
        view.font = .systemFont(ofSize: 14,
                                weight: .regular)
        view.textColor = .black
        return view
    }()
    
    private let RegisterButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Регстрация",
                      for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14,
                                                  weight: .medium)
        view.setTitleColor(UIColor.init(hex: "#53B175"),
                           for: .normal)
        return view
    }()
    
    weak var delegate: loginViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAdd()
        setupConstraints()
        setupAddTarget()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func languagelocalizable() {
        loginLabel.text = "Логин".localized()
        enterCredemtailsLabel.text = "Введите адрес электронной почты и пароль".localized()
        emailLabel.text = " Емаил ".localized()
        passwordLabel.text = " Пароль ".localized()
        forgotButton.setTitle("Забыли пароль ?".localized(), for: .normal)
        LoginButton.setTitle("Войти".localized(),
                      for: .normal)
        accountLabel.text = "У вас нету аккаунта ?".localized()
        RegisterButton.setTitle("Регстрация".localized(),
                      for: .normal)
    }
    
    private func setupAdd() {
        addSubview(logoIcon)
        addSubview(loginLabel)
        addSubview(enterCredemtailsLabel)
        addSubview(emailTextField)
        addSubview(emailLabel)
        addSubview(passwordTextField)
        addSubview(passwordLabel)
        addSubview(forgotButton)
        addSubview(LoginButton)
        addSubview(stackLabels)
        stackLabels.addArrangedSubview(accountLabel)
        stackLabels.addArrangedSubview(RegisterButton)
    }
    
    private func setupConstraints() {
        logoIcon.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(60)
            make.height.equalTo(80)
        }
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(logoIcon.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(24)
            make.width.equalTo(108)
            make.height.equalTo(28)
        }
        
        enterCredemtailsLabel.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(enterCredemtailsLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(50)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.left.equalTo(emailTextField).offset(15)
            make.centerY.equalTo(emailTextField)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(50)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.left.equalTo(passwordTextField).offset(30)
            make.centerY.equalTo(passwordTextField)
        }
        
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(14)
            make.width.equalTo(125)
        }
        
        LoginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotButton.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(55)
        }
        
        stackLabels.snp.makeConstraints { make in
            make.top.equalTo(LoginButton.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    private func setupAddTarget() {
        LoginButton.addTarget(self,
                              action: #selector(loginButtonTapped),
                              for: .touchUpInside)
        RegisterButton.addTarget(self,
                                 action: #selector(registerUI),
                                 for: .touchUpInside)
        emailTextField.addTarget(self,
                                 action: #selector(textFieldsDidChange),
                                 for: .editingChanged)
        passwordTextField.addTarget(self,
                                    action: #selector(textFieldsDidChange), 
                                    for: .editingChanged)
    }
    
    private func setupDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @objc
    private func hideText(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc
    private func registerUI() {
        delegate?.didRegisterTapped()
    }
    
    @objc
    private func TabBarUI() {
        delegate?.didLoginTapped()
    }
    
    @objc
    private func loginButtonTapped() {
        guard let emailText = emailTextField.text, let passwordText = passwordTextField.text else {
            return
        }
        
        var errorMessages: [String] = []
        
        if !emailText.contains("@gmail.com") {
            errorMessages.append("Обязательно напишите @gmail.com".localized())
        }
        
        if passwordText.count < 6 {
            errorMessages.append("Пароль должен быть не менее 6 символов".localized())
        }
        
        if errorMessages.isEmpty {
            delegate?.didLoginTapped()
        } else {
            let message = errorMessages.joined(separator: "\n")
            delegate?.showErrorAlert(message: message)
        }
    }
    
    @objc
    private func textFieldsDidChange() {
       
        guard let emailText = emailTextField.text, let passwordText = passwordTextField.text else {
            return
        }
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateLabel(for: textField)
    }
    
    private func animateLabel(for textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            var label: UILabel?
            var textFieldFrame: CGRect
            var labelOrigin: CGPoint
            switch textField {
            case self.emailTextField:
                label = self.emailLabel
            case self.passwordTextField:
                label = self.passwordLabel
            default:
                break
            }
            
            if let label = label {
                textFieldFrame = textField.frame
                labelOrigin = CGPoint(x: textFieldFrame.origin.x + 15,
                                      y: textFieldFrame.minY - label.frame.height / 2)
                label.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                label.frame.origin = labelOrigin
            }
        }
    }
}
