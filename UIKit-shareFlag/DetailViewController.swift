//
//  DetailViewController.swift
//  UIKit-shareFlag
//
//  Created by AKSHAY MAHAJAN on 2023-05-25.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet var imageView: UIImageView!
	var selectedImage: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
		
		if let selectedImage {
			imageView.image = UIImage(named: selectedImage)
		}
        
    }
	
	@objc func shareButtonTapped() {
		guard let image = imageView.image else {
			print("No image found")
			return
		}
		let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
		vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
		present(vc, animated: true)
	}
}
