//
//  TableViewCell.swift
//  test
//
//  Created by OUT-Korogodova-MM on 02.09.2021.
//

import UIKit

/// ячейка с постом
class TableViewCell: UITableViewCell {
    
    var loadImage = LoadImageService()
    
    /// название поста
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.minimumScaleFactor = 1.0
        
        return label
    }()
    
    /// изображение поста
    var myImage: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true

        return image
    }()
    
    /// описание поста
    var explanLabel: UITextView = {
        let label = UITextView()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isScrollEnabled = false
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [nameLabel, myImage, explanLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.layoutMargins = .init(top: 0, left: 8, bottom: 0, right: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        return stackView
    }()
    
    var data: DemoData? {
        didSet {
            loadImage.loadImage(data: data) { image in
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                }
            }
            }
        }
    
    var image: UIImage? {
        didSet {
            myImage.image = image
        }
    }
    
    /// установка и настройка констрейнтов
    func setUp(){
        selectionStyle = .none
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        let constr = myImage.heightAnchor.constraint(equalToConstant: 150)
        constr.priority = .init(rawValue: 999)
        constr.isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: "TableViewCell")
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
