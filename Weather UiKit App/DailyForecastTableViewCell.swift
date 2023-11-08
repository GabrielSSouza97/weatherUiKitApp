//
//  DailyForecastTableViewCell.swift
//  Weather UiKit App
//
//  Created by Gabriel Santos de Souza on 08/11/23.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    
    static let identifier: String = "DailyForecastTableViewCell"
    
    private lazy var weekDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "SEG"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dailyIconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "dailyIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "min 25°C"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "máx 25°C"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mainCellStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [weekDayLabel, dailyIconImageView, minTemperatureLabel, maxTemperatureLabel])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        stack.spacing = 15
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        addSubview(mainCellStackView)
    }
    
    private func setupConstraints() {
        mainCellStackView.setConstraintsToParent(contentView)
        
        NSLayoutConstraint.activate([
            mainCellStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            mainCellStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
}
