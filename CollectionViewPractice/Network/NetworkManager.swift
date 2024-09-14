//
//  NetworkManager.swift
//  CollectionViewPractice
//
//  Created by J Oh on 9/13/24.
//

import Foundation
import RxSwift
import Alamofire

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case decodingError
    case statusError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    func requestSingle(term: String) -> Single<SearchResponse> {
        return Single.create { observer -> Disposable in
            let url = API.url + "&term=\(term)"
            
            AF.request(url)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: SearchResponse.self) { response in
                    switch response.result {
                    case .success(let success):
                        observer(.success(success))
                    case .failure(let error):
                        observer(.failure(error))
                    }
                }
            
            return Disposables.create()
        }
        .debug("Single Request")
    }
}
