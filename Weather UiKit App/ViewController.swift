//
//  ViewController.swift
//  Weather UiKit App
//
//  Created by Gabriel Santos de Souza on 07/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Elements
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "MainBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var temperatureView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = "Florianópolis"
        label.textColor = UIColor.primaryColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mainTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 70, weight: .bold)
        label.textAlignment = .center
        label.text = "25°C"
        label.textColor = UIColor.primaryColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sunImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sunImageView")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.white
        label.text = "Umidade"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var humidityValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.white
        label.text = "1000mm"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var humidityStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [humidityLabel, humidityValueLabel])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.white
        label.text = "Vento"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var windValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.white
        label.text = "10km/h"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var windStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var statsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [humidityStackView, windStackView])
        stack.axis = .vertical
        stack.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        stack.layer.cornerRadius = 10
        stack.spacing = 3
        stack.isLayoutMarginsRelativeArrangement  = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var hourlyForecastLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor.white
        label.text = "PREVISÃO POR HORA"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var hourlyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 67, height: 84)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.register(HourlyForecastCollectionViewCell.self, forCellWithReuseIdentifier: HourlyForecastCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        setHierarchy()
        setupConstraints()
    }
    
    // MARK: - Setup ViewCode
    
    private func setHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(temperatureView)
        
        temperatureView.addSubview(cityLabel)
        temperatureView.addSubview(mainTemperatureLabel)
        temperatureView.addSubview(sunImageView)
        
        view.addSubview(statsStackView)
        view.addSubview(hourlyForecastLabel)
        view.addSubview(hourlyCollectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            temperatureView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            temperatureView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            temperatureView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            temperatureView.heightAnchor.constraint(equalToConstant: 169),
            
            cityLabel.topAnchor.constraint(equalTo: temperatureView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: temperatureView.leadingAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: temperatureView.trailingAnchor),
            cityLabel.heightAnchor.constraint(equalToConstant: 20),
            
            mainTemperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 21),
            mainTemperatureLabel.leadingAnchor.constraint(equalTo: temperatureView.leadingAnchor, constant: 26),
            
            sunImageView.centerYAnchor.constraint(equalTo: mainTemperatureLabel.centerYAnchor),
            sunImageView.leadingAnchor.constraint(equalTo: temperatureView.trailingAnchor, constant: 15),
            sunImageView.trailingAnchor.constraint(equalTo: temperatureView.trailingAnchor, constant: -16),
            sunImageView.widthAnchor.constraint(equalToConstant: 86),
            sunImageView.heightAnchor.constraint(equalToConstant: 86),
            
            statsStackView.topAnchor.constraint(equalTo: temperatureView.bottomAnchor, constant: 24),
            statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statsStackView.widthAnchor.constraint(equalToConstant: 206),
            
            hourlyForecastLabel.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 29),
            hourlyForecastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hourlyCollectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 22),
            hourlyCollectionView.heightAnchor.constraint(equalToConstant: 84),
            hourlyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hourlyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
}

