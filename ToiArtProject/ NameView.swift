//
//   NameView.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/16/24.
//

import UIKit
import SnapKit

class NameView: UIView {
    
    private lazy var logoIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoImageToi")
        return view
    }()
    
    private lazy var entranceTitle: UILabel = {
        let view = UILabel()
        view.text = "Фамилия и имя".localized()
        view.tintColor = .systemGray3
        view.font = .systemFont(
            ofSize: 24,
            weight: .medium)
        return view
    }()
    
    let nameTextField: PaddedTextField = {
        let view = PaddedTextField()
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.tintColor = .systemGray5
        view.text = " Напишите свою имю ".localized()
        view.font = .systemFont(
            ofSize: 16,
            weight: .regular)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var toComeInButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle(
            "Войти".localized(),
            for: .normal)
        view.tintColor = .white
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor.init(hex: "#00d400")
        return view
    }()
    
    weak var delegate: NameViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupAddTarget()
        setupAdd()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func localizedlanguage() {
        entranceTitle.text = "Фамилия и имя".localized()
        nameLabel.text = " Напишите свою имю ".localized()
        toComeInButton.setTitle(
            "Войти".localized(),
            for: .normal)
    }
    
    private func setupAddTarget() {
        toComeInButton.addTarget(self, action: #selector(screenTransition), for: .touchUpInside)
        nameTextField.delegate = self
    }
    
    
    private func setupAdd() {
        addSubview(logoIcon)
        addSubview(entranceTitle)
        addSubview(nameTextField)
        addSubview(nameLabel)
        addSubview(toComeInButton)
    }
    
    private func setupConstrains() {
        logoIcon.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(60)
            make.height.equalTo(80)
        }
        
        entranceTitle.snp.makeConstraints { make in
            make.top.equalTo(logoIcon.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(16)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(entranceTitle.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(nameTextField).offset(30)
            make.centerY.equalTo(nameTextField)
        }
        
        toComeInButton.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
    
    @objc
    private func screenTransition() {
        guard let nameText = nameTextField.text, !nameText.isEmpty else {
            delegate?.showErrorAlert(message: "Поле имени не должно быть пустым.".localized())
            return
        }
        UserDefaults.standard.set(nameText, forKey: "userName")
        delegate?.didTabBarController()
    }
}

extension NameView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            self.nameLabel.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.nameLabel.frame.origin = CGPoint(x: self.nameTextField.frame.origin.x + 15,
                                                  y: self.nameTextField.frame.minY - self.nameLabel.frame.height / 2)
        }
    }
}
