Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "SwiftDropDownList"
s.summary = "SwiftDropDownList lets a user select an item."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Surendra Singh" => "surendra.miet.2004@gmail.com" }

# For example,
# s.author = { "Surendra Singh" => "surendra.miet.2004@gmail.com" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/SurendraCodeBase/SwiftDropDownList"

# For example,
# s.homepage = "https://github.com/JRG-Developer/SwiftDropDownList"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/SurendraCodeBase/SwiftDropDownList.git", :tag => "#{s.version}"}

# For example,
# s.source = { :git => "https://github.com/JRG-Developer/SwiftDropDownList.git", :tag => "#{s.version}"}


# 7
s.framework = "UIKit"

# 8
s.source_files = "SwiftDropDownList/**/*.{swift}"

# 9
s.resources = "SwiftDropDownList/**/*.{png,jpeg,jpg,storyboard,xib}"
end