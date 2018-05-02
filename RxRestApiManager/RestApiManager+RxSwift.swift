//
//  RestApiManager+RxSwift.swift
//  SaleUp
//
//  Created by Panevnyk Vlad on 4/5/18.
//  Copyright © 2018 Devlight. All rights reserved.
//

import RestApiManager
import RxSwift

public extension RestApiManager {
    
    // ---------------------------------------------------------------------
    // MARK: - Simple requests
    // ---------------------------------------------------------------------
    
    /// Object and Array call
    ///
    /// - Parameters:
    ///   - method: RestApiMethod
    /// - Returns: Observable<T>
    public func call<T: Associated>(method: RestApiMethod) -> Observable<T> {
        return Observable<T>.create { observer in
            self.call(method: method) { (result: Result<T>) in
                switch result {
                case .success(let value):
                    observer.onNext(value)
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
    /// String call
    ///
    /// - Parameters:
    ///   - method: RestApiMethod
    /// - Returns: Observable<String>
    public func call(method: RestApiMethod) -> Observable<String> {
        return Observable<String>.create { observer in
            self.call(method: method) { (result: Result<String>) in
                switch result {
                case .success(let value):
                    observer.onNext(value)
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
    // ---------------------------------------------------------------------
    // MARK: - Multipart
    // ---------------------------------------------------------------------
    
    /// Multipart Object and Array call
    ///
    /// - Parameters:
    ///   - multipartData: MultipartData
    ///   - method: RestApiMethod
    /// - Returns: Observable<T>
    public func call<T: Associated>(multipartData: MultipartData, method: RestApiMethod) -> Observable<T> {
        return Observable<T>.create { observer in
            self.call(multipartData: multipartData, method: method) { (result: Result<T>) in
                switch result {
                case .success(let value):
                    observer.onNext(value)
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }

    ///  Multipart String call
    ///
    /// - Parameters:
    ///   - multipartData: MultipartData
    ///   - method: RestApiMethod
    /// - Returns: Observable<String>
    public func call(multipartData: MultipartData, method: RestApiMethod) -> Observable<String> {
        return Observable<String>.create { observer in
            self.call(multipartData: multipartData, method: method) { (result: Result<String>) in
                switch result {
                case .success(let value):
                    observer.onNext(value)
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
