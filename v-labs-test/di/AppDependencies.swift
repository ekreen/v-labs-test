//
//  AppDependencies.swift
//  
//
//  Created by Kevin ESPRIT on 02/09/2019.
//

import Swinject

protocol AppDependencies {
    var contentRepository: ContentRepository { get }
    var controllerFactory: ControllerFactory { get }
}

class AppDependenciesImpl {
    let dataContainer: Container = Container() { container in
        container.register(ApiManager.self) { _ in ApiManagerImpl()}.inObjectScope(.container)
        container.register(ContentRepository.self) {
            resolver in ContentRepository(apiManager: resolver.resolve(ApiManager.self)!)
            }.inObjectScope(.container)
    }
    
    let navigationContainer: Container = Container() { container in
        container.register(ControllerFactory.self) { _ in
            ControllerFactoryImpl()
            }.inObjectScope(.container)
    }
}

extension AppDependenciesImpl: AppDependencies {
    var contentRepository: ContentRepository {
        return dataContainer.resolve(ContentRepository.self)!
    }
    
    var controllerFactory: ControllerFactory {
        return navigationContainer.resolve(ControllerFactory.self)!
    }
    
}
