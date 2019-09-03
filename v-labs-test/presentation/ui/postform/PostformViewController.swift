//
//  PostformViewController.swift
//  v-labs-test
//
//  Created by Kévin Esprit on 02/09/2019.
//  Copyright © 2019 Kespri. All rights reserved.
//

import Eureka
import RxSwift

class PostformViewController: FormViewController {
    
    // MARK: - Properties
    var viewModel: PostformViewModel!
    var wireframe: RootWireframe!
    private let disposeBag = DisposeBag()
    
    enum PostRowTag: String {
        case title
        case body
    }
    
    enum PostAlertStyle {
        case success
        case error
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section(R.string.localizedString.postformViewControllerSectionTitle())
            <<< TextRow(){ row in
                row.title = PostRowTag.title.rawValue
                row.tag = PostRowTag.title.rawValue
                row.placeholder = R.string.localizedString.postformViewControllerRowTitle()
            }
            <<< TextRow(){ row in
                row.title = PostRowTag.body.rawValue
                row.tag = PostRowTag.body.rawValue
                row.placeholder = R.string.localizedString.postformViewControllerRowBody()
            }
            <<< ButtonRow() { row in
                row.title = R.string.localizedString.postformViewControllerRowValidationButton()
                }.onCellSelection({ [weak self] cell, row in
                    guard let strongSelf = self else { return }
                    strongSelf.createPost()
                })
    }
}

private extension PostformViewController {
    func createPost() {
        let values = form.values()
        
        guard let title = values[PostRowTag.title.rawValue] as? String,
            let body = values[PostRowTag.body.rawValue] as? String else {
                return
        }
        viewModel.createPost(title: title, body: body)
            .subscribe(onCompleted: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.createAlert(for: .success)
            }, onError: { [weak self] error in
                guard let strongSelf = self else { return }
                strongSelf.createAlert(for: .error)
            })
            .disposed(by: disposeBag)
    }
    
    func createAlert(for style: PostAlertStyle) {
        
        let title: String
        let message: String
        
        switch style {
        case .success:
            title = R.string.localizedString.postformViewControllerAlertSucceedTitle()
            message = R.string.localizedString.postformViewControllerAlertSucceedMessage()
        case .error:
            title = R.string.localizedString.postformViewControllerAlertErrorTitle()
            message = R.string.localizedString.postformViewControllerAlertErrorMessage()
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        if style == .success {
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] _ in
                guard let strongSelf = self else { return }
                strongSelf.closeForm()
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func closeForm() {
        self.dismiss(animated: true)
    }
}
