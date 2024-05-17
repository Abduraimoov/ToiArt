//
//  AttendanceTableViewCell.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/14/24.
//

import UIKit

class AttendanceTableViewCell: UITableViewCell {
    
     let stackDates: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 30
        return view
    }()
    
     let stackAllHours: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 30
        return view
    }()
    
     let dateLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
     let startData: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private let endDate: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private let allHourse: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14,
                                weight: .medium)
        view.textColor = .label
        return view
    }()
    
    private let cellId = "cell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAdd()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAdd() {
        addSubview(stackDates)
        addSubview(stackAllHours)
        stackDates.addArrangedSubview(dateLabel)
        stackDates.addArrangedSubview(startData)
        stackAllHours.addArrangedSubview(endDate)
        stackAllHours.addArrangedSubview(allHourse)
    }
    
    private func setupConstrains() {
        stackDates.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalToSuperview()
            make.width.equalTo(174)
        }
        
        stackAllHours.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.trailing.equalToSuperview()
            make.width.equalTo(153)
        }
    }
    
    func configure(with dates: AttendanceStruct) {
        dateLabel.text = dates.date
        startData.text = dates.startData
        endDate.text = dates.endDate
        allHourse.text = dates.workHour
   
    }
}

