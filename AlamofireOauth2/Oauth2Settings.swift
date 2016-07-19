
import Foundation

public class Oauth2Settings {
    
    public var baseURL: String
    public var authorizeURL: String
    public var tokenURL: String
    public var redirectURL: String
    public var clientID: String
    public var clientSecret: String
    public var scope: String

    
    public required init(baseURL: String, authorizeURL: String, tokenURL: String, redirectURL: String, clientID: String, clientSecret: String, scope: String = "") {
        
        self.baseURL = baseURL
        self.authorizeURL = authorizeURL
        self.tokenURL = tokenURL
        self.redirectURL = redirectURL
        self.clientID = clientID
        self.clientSecret = clientSecret
        self.scope = scope

    }
    
    func client() -> OAuth2Client {
        return clientClass.init(outh2Settings: self)
    }
    
    var clientClass: OAuth2Client.Type {
        
        if let clientClass = NSClassFromString("AlamofireOAuth2.OAuth2ApplicationClient") as? OAuth2Client.Type {
            print("Using oauth2AppCient)")
            return clientClass
        }
        
        let className = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String + ".OAuth2ApplicationClient"
        if let clientClass = NSClassFromString(className) as? OAuth2Client.Type {
            print("Using \(className)")
            return clientClass
        }
        
        return OAuth2Client.self

    }
    
}
