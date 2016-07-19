Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  These will help people to find your library, and whilst it
#  can feel like a chore to fill in it's definitely to your advantage. The
#  summary should be tweet-length, and the description more in depth.
#

s.name         = "AlamofireOauth2Core"
s.version      = "1.2.0"
s.summary      = "Oauth2 implementation using Alamofire"

s.description  = "A Swift implementation of Oauth2 using Alamofire"

s.homepage     = "https://github.com/evermeer/AlamofireOauth2"

# ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  Licensing your code is important. See http://choosealicense.com for more info.
#  CocoaPods will detect a license file if there is a named LICENSE*
#  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
#

s.license      = { :type => "MIT", :file => "LICENSE" }


# ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  Specify the authors of the library, with email addresses. Email addresses
#  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
#  accepts just a name if you'd rather not provide an email address.
#
#  Specify a social_media_url where others can refer to, for example a twitter
#  profile URL.
#

s.author    = "evermeer"
s.social_media_url   = "http://twitter.com/evermeer"

s.platform     = :ios, "8.0"

#s.source       = { :git => "https://github.com/evermeer/SwiftOauth2.git", :tag => s.version.to_s }
s.source       = { :git => "https://github.com/jrmiddle/AlamofireOauth2.git", :branch => 'extension-support' }


s.source_files  = 'AlamofireOauth2/*'
s.source_files = 'AlamofireOauth2/{AlamofireOauth2,AuthenticationViewController,OAuth2Client,Oauth2Settings}.swift'
s.frameworks = "Foundation", "UIKit"
s.requires_arc = true


s.dependency "Alamofire"
s.dependency "KeychainAccess"

end
