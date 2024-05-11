//
//  ScheduleView.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/11/24.
//

import UIKit
import SnapKit

class ScheduleView: UIView {
    
    private let hoursImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "hours")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let stackLabels: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    private let hoursLabel: UILabel = {
        let view = UILabel()
        view.text = "10:00 - 19:00"
        view.font = .systemFont(ofSize: 18)
        view.tintColor = .black
        return view
    }()
    
    private let daysLabel: UILabel = {
        let view = UILabel()
        view.text = "Пн - Вс"
        view.font = .systemFont(ofSize: 18)
        view.textAlignment = .center
        view.tintColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAdd()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAdd() {
        addSubview(hoursImage)
        addSubview(stackLabels)
        stackLabels.addArrangedSubview(hoursLabel)
        stackLabels.addArrangedSubview(daysLabel)
    }
    
    private func setupConstrains() {
        hoursImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(137)
            make.height.equalTo(140)
        }
        
        stackLabels.snp.makeConstraints { make in
            make.top.equalTo(hoursImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(38)
        }
    }
    
    
}
