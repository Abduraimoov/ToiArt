//
//  RegisterView.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/8/24.
//

import UIKit

class RegisterView: UIView {
    
    private let logoIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoImageToi")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.tintColor = .label
        
        return label
    }()
    
    private let enterCredemtailsLabel: UILabel = {
        let view = UILabel()
        view.text = "Введите свои учетные данные, чтобы продолжить"
        view.font = .systemFont(ofSize: 16,
                                weight: .medium)
        view.textColor = UIColor.init(hex: "#7C7C7C")
        view.numberOfLines = 0
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
        view.text = " Электронная почта "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    let nameTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.tintColor = .label
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " Введите имя "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    private let numberTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let numberLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " Введите номер "
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
        view.tag = 1
        return view
    }()
    
    private let passwordLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " Введите пароль "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    private let confirmTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.isSecureTextEntry = true
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        let rightView = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: 24,
            height: 24))
        rightView.setImage(UIImage(
            systemName: "eye.slash"),
                           for: .normal)
        rightView.tintColor = .label
        rightView.tag = 1
        rightView.addTarget(self,
                            action: #selector(hideText),
                            for: .touchUpInside)
        view.rightView = rightView
        view.rightViewMode = .always
        view.tag = 1
        return view
    }()
    
    private let confirmLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " Подтвердите пароль "
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    
    private let SingupButton: UIButton = {
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
        view.text = "Уже есть аккаунт ?"
        view.font = .systemFont(ofSize: 14,
                                weight: .regular)
        view.textColor = .black
        return view
    }()
    
    private let loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Логин",
                      for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14,
                                                  weight: .medium)
        view.setTitleColor(UIColor.init(hex: "#53B175"),
                           for: .normal)
        return view
    }()
    
    weak var delegate: RegisterViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupAdd()
        setupConstraints()
        setupAddTarget()
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func localizesLanguage() {
        registerLabel.text = "Регистрация".localized()
        enterCredemtailsLabel.text = "Введите свои учетные данные, чтобы продолжить".localized()
        emailLabel.text = " Электронная почта ".localized()
        nameLabel.text = " Введите имя ".localized()
        numberLabel.text = " Введите номер ".localized()
        passwordLabel.text = " Введите пароль ".localized()
        confirmLabel.text = " Подтвердите пароль ".localized()
        SingupButton.setTitle("Войти".localized(),
                              for: .normal)
        accountLabel.text = "Уже есть аккаунт ?".localized()
        loginButton.setTitle("Логин".localized(),
                             for: .normal)
    }
    
    private func setupAdd() {
        addSubview(logoIcon)
        addSubview(registerLabel)
        addSubview(enterCredemtailsLabel)
        addSubview(emailTextField)
        addSubview(emailLabel)
        addSubview(nameTextField)
        addSubview(nameLabel)
        addSubview(numberTextField)
        addSubview(numberLabel)
        addSubview(passwordTextField)
        addSubview(passwordLabel)
        addSubview(confirmTextField)
        addSubview(confirmLabel)
        addSubview(SingupButton)
        addSubview(stackLabels)
        stackLabels.addArrangedSubview(accountLabel)
        stackLabels.addArrangedSubview(loginButton)
    }
    
    private func setupConstraints() {
        
        logoIcon.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(60)
            make.height.equalTo(80)
        }
        
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(logoIcon.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(24)
            
        }
        
        enterCredemtailsLabel.snp.makeConstraints { make in
            make.top.equalTo(registerLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(enterCredemtailsLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(45)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.left.equalTo(emailTextField).offset(15)
            make.centerY.equalTo(emailTextField)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(emailTextField)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(nameTextField).offset(15)
            make.centerY.equalTo(nameTextField)
        }
        
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(emailTextField)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.left.equalTo(numberTextField).offset(15)
            make.centerY.equalTo(numberTextField)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(emailTextField)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.left.equalTo(passwordTextField).offset(15)
            make.centerY.equalTo(passwordTextField)
        }
        
        confirmTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(12)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(emailTextField)
        }
        
        confirmLabel.snp.makeConstraints { make in
            make.left.equalTo(confirmTextField).offset(15)
            make.centerY.equalTo(confirmTextField)
        }
        
        SingupButton.snp.makeConstraints { make in
            make.top.equalTo(confirmTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(emailTextField)
        }
        
        stackLabels.snp.makeConstraints { make in
            make.top.equalTo(SingupButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(14)
        }
    }
    
    private func setupAddTarget() {
        loginButton.addTarget(self,
                              action: #selector(screenTransilation),
                              for: .touchUpInside)
        SingupButton.addTarget(self,
                               action: #selector(homeUITransilation),
                               for: .touchUpInside)
        
    }
    
    private func setupDelegates() {
        emailTextField.delegate = self
        nameTextField.delegate = self
        numberTextField.delegate = self
        passwordTextField.delegate = self
        confirmTextField.delegate = self
    }
    
    @objc
    private func hideText(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        case 1:
            confirmTextField.isSecureTextEntry = !confirmTextField.isSecureTextEntry
        default:
            break
        }
    }
    
    @objc
    private func screenTransilation() {
        delegate?.didLoginButton()
    }
    
    @objc
    private func homeUITransilation() {
        guard let email = emailTextField.text, email.contains("@gmail.com") else {
            delegate?.showErrorAlert(message: "Обязательно напишите @gmail.com".localized())
            return
        }
        
        guard let name = nameTextField.text, !name.isEmpty else {
            delegate?.showErrorAlert(message: "Поле не должно быть пустым".localized())
            return
        }
        
        guard let number = numberTextField.text, number.hasPrefix("+996"), number.count == 13 else {
            delegate?.showErrorAlert(message: "Напишите номер с +996 и убедитесь, что номер содержит 16 символов".localized())
            return
        }
        
        guard let password = passwordTextField.text, password.count >= 6 else {
            delegate?.showErrorAlert(message: "Пароль должен быть не менее 6 символов".localized())
            return
        }
        
        guard let confirm = confirmTextField.text, confirm.count >= 6 else {
            delegate?.showErrorAlert(message: "Пароль должен быть не менее 6 символов".localized())
            return
        }
        
        guard password == confirm else {
            delegate?.showErrorAlert(message: "Пароли не совпадают".localized())
            return
        }
        proceedToNextScreen()
    }
    
    private func proceedToNextScreen() {
        delegate?.didSingupButton()
        UserDefaults.standard.set(nameTextField.text, forKey: "userName")
    }
    
}

extension RegisterView: UITextFieldDelegate {
    
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
            case self.nameTextField:
                label = self.nameLabel
            case self.numberTextField:
                label = self.numberLabel
            case self.passwordTextField:
                label = self.passwordLabel
            case self.confirmTextField:
                label = self.confirmLabel
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
