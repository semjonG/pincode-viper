//
//  Assembly.swift
//  pincode-viper
//
//  Created by SemjonG on 20/08/2022.
//  Copyright © 2022 Company. All rights reserved.
//

import Foundation

final class Assembly: NSObject {

//    private var view = ViewController(nibName: "ViewController", bundle: Bundle.main)
    private var view = ViewController()
    private var presenter = Presenter()
    private var router = Router()
    private var interactor = Interactor()
    private var service = PincodeService()

    // MARK: - Public method
    
    func createRouter() -> Router {
        
        configureDependenciesWithModuleOutput()
//        configureDependenciesWithModuleOutput(moduleOutput: self.presenter.moduleOutput as! PrefixHomeModuleModuleOutput)
        view.setupViewReadyBlock {
            self.addChildComponents()
        }
        return self.router
    }
    
    @objc func assembleModule(
                              transition: ((RouterInput) -> Void)?,
                              completion: ((ModuleInput) -> Void)?) {
        
        configureDependenciesWithModuleOutput()
        
        view.setupViewReadyBlock {
            self.addChildComponents()
            if let completion = completion {
                completion(self.presenter)
            }
        }
        
        if let transition = transition {
            transition(router)
        }
        
    }
    
    // MARK: - Child components
    private func addChildComponents() {
        
//        TRFirstAssembly().assembleModule(moduleOutput: self.presenter) { [weak self] router in
//
//            if self != nil {
//                router.openModuleFrom(viewController: self!.presenter.view as! UIViewController, inView: self!.presenter.view!.firstContainerView, onFullViewArea: false)
//            }
//
//        } completion: { [weak self] input in
//            self?.presenter.firstInput = input
//        }
        
    }
    
    // MARK: - Configure dependencies

    
    private func configureDependenciesWithModuleOutput() {
        
        view.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.service = service
        interactor.output = presenter
        
        router.view = view
        
//        presenter.moduleOutput = moduleOutput
    }
}

