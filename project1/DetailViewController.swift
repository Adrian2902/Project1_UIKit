//
//  DetailViewController.swift
//  project1
//
//  Created by Adrian Gutierrez Carbajal  on 26/08/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedPictureNumber = 0
    var totalPictures = 0
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        title = "Image\(selectedPictureNumber + 1) of 10"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }

        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
