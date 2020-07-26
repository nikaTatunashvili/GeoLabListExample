//
//  ThreadsViewController.swift
//  List Example
//
//  Created by GL on 7/26/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class ThreadsViewController: UIViewController {
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    let url1 = "https://sea-eu.org/wp-content/uploads/2019/10/dest_1.jpg"
    let url2 = "https://cdn.britannica.com/95/156695-131-FF89C9FA/oak-tree.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.addTarget(self, action: #selector(firstButtonAction), for: .touchUpInside)
        button2.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)
    }
    
    @objc func firstButtonAction(_ sender: UIButton) {
        imageView2.image = nil
        imageView1.image = nil
        imageView1.startLoader()
        imageView2.startLoader()
        self.fetchImage(from: self.url1) { [weak self] image in
            DispatchQueue.main.async {
                self?.imageView1.image = image
                self?.imageView1.stopLoader()
            }
        }
        
        self.fetchImage(from: self.url2) { [weak self] image in
            DispatchQueue.main.async {
                self?.imageView2.image = image
                self?.imageView2.stopLoader()
            }
        }
    }
    
    @objc func secondButtonAction(_ sender: UIButton) {
        imageView2.image = nil
        imageView1.image = nil
        imageView1.startLoader()
        imageView2.startLoader()
        
        var images: [UIImage] = []
        
        let group = DispatchGroup()
        
        [url1, url2].forEach { url in
            group.enter()
            fetchImage(from: url) { image in
                if let image = image {
                    images.append(image)
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) { [weak self] in
            self?.imageView1.image = images.value(for: 0)
            self?.imageView2.image = images.value(for: 1)
            self?.imageView1.stopLoader()
            self?.imageView2.stopLoader()
        }
        
    }

    func fetchImage(from url: String, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global(qos: .utility).async {
            guard let url = URL(string: url),
                let data = try? Data(contentsOf: url) else {
                return completion(nil)
            }
            completion(UIImage(data: data))
        }
    }
}

extension UIImageView {
    func startLoader() {
        if let indicator = self.subviews.first(where: { $0 is UIActivityIndicatorView }) as? UIActivityIndicatorView {
            indicator.startAnimating()
            return
        }
        let indicator = UIActivityIndicatorView(style: .gray)
        self.addSubview(indicator)
        indicator.center = self.center
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
    }

    func stopLoader() {
        (self.subviews.first(where: {$0 is UIActivityIndicatorView}) as? UIActivityIndicatorView)?.stopAnimating()
    }
}

extension Array {
    func value(for index: Int) -> Element? {
        if self.indices.contains(index) {
            return self[index]
        }
        return nil
    }
}
