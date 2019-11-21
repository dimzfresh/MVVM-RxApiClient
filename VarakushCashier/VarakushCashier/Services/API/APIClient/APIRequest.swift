//
//  Request.swift
//  VarakushCashier
//
//  Created by Dmitrii Ziablikov on 13/10/2019.
//  Copyright © 2019 di. All rights reserved.
//

import Foundation
import Alamofire

public typealias Resource = (method: HTTPMethod, route: String)

public protocol APIRequest: AlamofireManager {
            
    var resource: Resource { get }
      
    var encoding: Alamofire.ParameterEncoding { get }
    
    var method: Alamofire.HTTPMethod { get }
    
    var parameters: [String : Any]? { get }
  
    var headers: HTTPHeaders { get }
    
    var networkClient: APIClientProtocol { get }
    
}

extension APIRequest {

    var url: String { Server.base.description + resource.route }
    
    var method: Alamofire.HTTPMethod { .get }

    public var encoding: Alamofire.ParameterEncoding { method == .get ? URLEncoding.default : JSONEncoding.default }
    
    var parameters: [String : Any]? { nil }
 
    public var headers: HTTPHeaders { defaultHeaders }
       
    public var networkClient: APIClientProtocol { APIClient() }
}
