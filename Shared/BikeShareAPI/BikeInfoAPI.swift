//
//  BikeInfoAPI.swift
//  CombineMe
//
//  Created by Swift Developer on 8/7/20.
//

import Foundation
import Combine

protocol BikeInfoCall {
    //func sysInfo() -> AnyPublisher<DataClass, BikeError>
    func stationInfo() -> AnyPublisher<StationInfo, Error>
}

class BikeInfoAPI {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension BikeInfoAPI: BikeInfoCall {
    func stationInfo() -> AnyPublisher<StationInfo, Error> {
        return getBikeInfo(www_url : stationURLComponents().url!)
    }
    
    func getBikeInfo(www_url:URL) ->   AnyPublisher<StationInfo, Error>{
        /* cancellable = */
        print(www_url)
        return session.dataTaskPublisher(for: www_url)
            //.print("step ==> ") // debug
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                print("data \(element.data)")
                return element.data
            }
            .decode(type: StationInfo.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

private extension BikeInfoAPI {
    struct GobalBikeAPI {
        static let scheme = "https"
        static let host = "gbfs.fordgobike.com"
        static let path = "/gbfs/en"
        //static let key = "<your key>"
    }
    
    func stationURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = GobalBikeAPI.scheme
        components.host = GobalBikeAPI.host
        components.path = GobalBikeAPI.path + "/station_information.json"
        
        components.queryItems = [
            //URLQueryItem(name: "name", value: value)
        ]
        return components
    }
    
    func systemURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = GobalBikeAPI.scheme
        components.host = GobalBikeAPI.host
        components.path = GobalBikeAPI.path + "/system_information.json"
        
        components.queryItems = [
            //URLQueryItem(name: "name", value: value)
        ]
        return components
    }
    
}


