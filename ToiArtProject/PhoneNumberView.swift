//
//  PhoneNumberView.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit
import SnapKit

protocol PhoneNumberViewDelegate: AnyObject {
    func smsCode(with phoneNumberTFText: String)
}

class PhoneNumberView: UIView {
    
    private lazy var logoIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoImageToi")
        return view
    }()
    
    private lazy var entranceTitle: UILabel = {
        let view = UILabel()
        view.text = "Введите номер мобильного телефона"
        view.tintColor = .systemGray3
        view.font = .systemFont(
            ofSize: 24,
            weight: .medium)
        return view
    }()
    
    private lazy var numberTextFeild: PaddedTextField = {
        let tf = PaddedTextField()
        tf.layer.borderColor = UIColor.label.cgColor
        tf.layer.borderWidth = 1
        tf.text = "+"
        let leftContainerView = UIView(frame: CGRect(
            x: 0,
            y: 0,
            width: 35 + 8,
            height: 24))
        let iconImageView = UIImageView(image: UIImage(systemName: "phone"))
        iconImageView.tintColor = .label
        iconImageView.frame = CGRect(
            x: 8,
            y: 2,
            width: 20,
            height: 20)
        leftContainerView.addSubview(iconImageView)
        tf.leftView = leftContainerView
        tf.leftViewMode = .always
        return tf
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
    
    private lazy var toComeInButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle(
            "Войти",
            for: .normal)
        view.tintColor = .white
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor.init(hex: "#00d400")
        return view
    }()
    
    weak var delegate: PhoneNumberViewDelegate?
    
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
    
    func localizedLanguage() {
        entranceTitle.text = "Введите номер мобильного телефона".localized()
        numberLabel.text = " Введите номер ".localized()
        toComeInButton.setTitle(
            "Войти".localized(),
            for: .normal)
    }
    
    private func setupAddTarget() {
        toComeInButton.addTarget(
            self,
            action: #selector(logginButtonTapped),
            for: .touchUpInside)
        numberTextFeild.delegate = self
    }
    
    private func setupAdd() {
        addSubview(logoIcon)
        addSubview(entranceTitle)
        addSubview(numberTextFeild)
        addSubview(numberLabel)
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
        
        numberTextFeild.snp.makeConstraints { make in
            make.top.equalTo(entranceTitle.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.left.equalTo(numberTextFeild).offset(30)
            make.centerY.equalTo(numberTextFeild)
        }
        
        toComeInButton.snp.makeConstraints { make in
            make.top.equalTo(numberTextFeild.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
    
    @objc
    private func logginButtonTapped(){
        delegate?.smsCode(with: numberTextFeild.text ?? "" )
    }
}

extension PhoneNumberView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            self.numberLabel.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.numberLabel.frame.origin = CGPoint(x: self.numberTextFeild.frame.origin.x + 15,
                                                    y: self.numberTextFeild.frame.minY - self.numberLabel.frame.height / 2)
        }
    }
}

