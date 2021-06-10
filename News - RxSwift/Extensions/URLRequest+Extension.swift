//
//  URLRequest+Extension.swift
//  News - RxSwift
//
//  Created by Rohit Kumar on 11/06/21.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest{
    static func Load<T>(resource: Resource<T>) -> Observable<T?>{
        return Observable.from([resource.url])
            .flatMap{ url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map{ data -> T? in
                return try? JSONDecoder().decode(T.self, from: data)
            }.asObservable()
    }
}
 
