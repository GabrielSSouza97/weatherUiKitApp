//
//  HourlyForecastCollectionViewCell.swift
//  Weather UiKit App
//
//  Created by Gabriel Santos de Souza on 08/11/23.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HourlyForecast"
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .white
        label.text = "12:00"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconSunImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sunImageView")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var houryTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.text = "25°C"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mainCellStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement  = true
        stack.spacing = 0
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        stack.backgroundColor = .clear
        stack.layer.cornerRadius = 20
        stack.layer.borderWidth = 1
        stack.layer.borderColor = CGColor(gray: 1.0, alpha: 1.0)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setupHierarchy()
        setupContraints()
    }
    
    private func setupHierarchy() {
        contentView.addSubview(mainCellStackView)
        
        mainCellStackView.addArrangedSubview(hourLabel)
        mainCellStackView.addArrangedSubview(iconSunImageView)
        mainCellStackView.addArrangedSubview(houryTemperatureLabel)
    }
    
    private func setupContraints() {
        mainCellStackView.setConstraintsToParent(contentView)
        
        NSLayoutConstraint.activate([
            iconSunImageView.widthAnchor.constraint(equalToConstant: 33),
            iconSunImageView.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
}
