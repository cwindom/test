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
        return image
    }()
    
    // remake for textView
    var explanLabel: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var data: DemoData? {
        didSet {
            nameLabel.text = data?.title
            explanLabel.text = data?.explanation
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
       super.init(style: style, reuseIdentifier: "TableViewCell")
        
        addSubview(nameLabel)
        addSubview(myImage)
        addSubview(explanLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: myImage.topAnchor, constant: 10),
            nameLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            myImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            myImage.heightAnchor.constraint(equalToConstant: 240),
            myImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            myImage.bottomAnchor.constraint(equalTo: explanLabel.topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            explanLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            //explanLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            explanLabel.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: 0),
            explanLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            explanLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 7/8)
        ])
        
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
