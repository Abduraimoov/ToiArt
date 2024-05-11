//
//  HomeView.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit

class HomeView: UIView {
    
    private let programmLabel: UILabel = {
        let view = UILabel()
        view.text = "Наши программы"
        view.font = .systemFont(ofSize: 19,
                                weight: .medium)
        view.textColor = UIColor.init(hex: "#0093B2")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAdd()
        setupConstraints()
        setupAddTardet()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAdd() {
        addSubview(programmLabel)
    }
    
    private func setupConstraints() {
        programmLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupAddTardet() {
        
    }
}
