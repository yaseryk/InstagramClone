//
//  FeedCollectionViewCell.swift
//  InstagramClone
//
//  Created by Yaser on 3/30/21.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    //MARK: -  Properties
    
    private let profileImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = .systemRed
        return iv
    }()
    
    private lazy var usernameButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Yaser", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        btn.addTarget(self, action: #selector(didtapUserName), for: .touchUpInside)
        return btn
    }()
    
    private let postImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.backgroundColor = .blue
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        btn.tintColor = .black
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        btn.addTarget(self, action: #selector(didtapUserName), for: .touchUpInside)
        return btn
    }()
    
    private lazy var commentButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        btn.tintColor = .black
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        btn.addTarget(self, action: #selector(didtapUserName), for: .touchUpInside)
        return btn
    }()
    
    private lazy var shareButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "paperplane"), for: .normal)
        btn.tintColor = .black
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        btn.addTarget(self, action: #selector(didtapUserName), for: .touchUpInside)
        return btn
    }()
    
    private let likesLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "1 Like"
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        return lbl
    }()
    
    private let captionLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "Some caption here..."
        lbl.font = UIFont.systemFont(ofSize: 14)
        return lbl
    }()
    
    private let postTimeLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "2 days ago"
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textColor = .lightGray
        return lbl
    }()
    
    
    //MARK: -  Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor,
                                paddingTop: 12, paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        
        addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configureActionButtons()
        
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder) not been implented")
    }
    
    //MARK: - Actions
    @objc func didtapUserName() {
        print("did tap username")
        
    }
    
    //MARK: -  Helpers
    
    func configureActionButtons() {
       let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, paddingTop: 8, height: 50)
        
    }
}
