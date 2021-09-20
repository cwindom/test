//
//  TableViewCell.swift
//  test
//
//  Created by OUT-Korogodova-MM on 02.09.2021.
//

import UIKit

/// Этот класс хранит ячейку с данными из поста.
class TableViewCell: UITableViewCell {
    
    var imageService = ImageService()
    
    /// Название поста.
    var nameLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.minimumScaleFactor = 1.0
        
        return label
    }()
    
    /// Изображение из поста.
    var myImage: UIImageView = {
        
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true

        return image
    }()
    
    /// Описание поста.
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
    
    var data: DemoDataEntity? {
        
        didSet {
            guard let data = data, let url = data.imageUrl else {
                self.image = nil
                return
            }
            imageService.loadImage(url: url) { result in
                switch result{
                case .success(let image):
                    DispatchQueue.main.async() { [weak self] in
                        self?.image = image
                    }
                    print("success")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    var image: UIImage? {
        
        didSet {
            myImage.image = image
        }
    }
    
    /// Функция устанавливает и настраивает констрейнты.
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
