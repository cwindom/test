//
//  TableViewCell.swift
//  test
//
//  Created by OUT-Korogodova-MM on 02.09.2021.
//

import UIKit

//@IBDesignable
//class MyImage: UIImageView{
//    @IBInspectable
//    var radius: CGFloat{
//        get{
//            layer.cornerRadius
//        }
//        set{
//            layer.cornerRadius = newValue
//        }
//    }
//
////    func myFunc() {
////        layoutMargins
////        layoutMarginsGuide
////        safeAreaInsets
////        safeAreaLayoutGuide
////
////        preservesSuperviewLayoutMargins
////        insetsLayoutMarginsFromSafeArea
////
////        traitCollectionDidChange(<#T##previousTraitCollection: UITraitCollection?##UITraitCollection?#>)
////    }
//
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        if traitCollection.verticalSizeClass == .compact{
//            backgroundColor = .blue
//        }
//    }
//}

class TableViewCell: UITableViewCell {
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var myImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .red
        return image
    }()
    
    // remake for textView
    var explanLabel: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isScrollEnabled = false
        return label
    }()
    
    var data: DemoData? {
        didSet {
//            nameLabel.text = data?.title
//            explanLabel.text = data?.explanation
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
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(myImage)
        contentView.addSubview(explanLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
//            nameLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            myImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            myImage.heightAnchor.constraint(equalToConstant: 240),
            myImage.widthAnchor.constraint(equalToConstant: 240),
            myImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
//            myImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
//            myImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
//            myImage.bottomAnchor.constraint(equalTo: explanLabel.topAnchor, constant: 0)
        ])
//
        NSLayoutConstraint.activate([
            explanLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            explanLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            explanLabel.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: 16),
//            explanLabel.heightAnchor.constraint(equalToConstant: 240),
            explanLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            explanLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 7/8)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
       super.init(style: style, reuseIdentifier: "TableViewCell")
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
