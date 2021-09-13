//
//  TableViewCell.swift
//  test
//
//  Created by OUT-Korogodova-MM on 02.09.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.minimumScaleFactor = 1.0
        
        return label
    }()
    
    var myImage: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true

        return image
    }()
    
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
            if let hdurl =  data?.hdurl, let myURL = URL(string: hdurl)
               {
                URLSession.shared.dataTask(with: myURL) { data, response, error in
                           guard
                               let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                               let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                               let data = data, error == nil,
                               let image = UIImage(data: data)
                               else { return }
                           DispatchQueue.main.async() { [weak self] in
                            self?.image = image
                           }
                       }.resume()
                   }
            }
        }
    
    var image: UIImage? {
        didSet {
            myImage.image = image
        }
    }
    
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
