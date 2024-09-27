Pod::Spec.new do |s|
    s.name = "apple-swift-markdown"
    s.version = "0.5.0"
    s.summary = "Swift Markdown is a Swift package for parsing, building, editing, and analyzing Markdown documents."
    s.homepage = "https://github.com/pleisto/swift-markdown-cocoapods"
    s.license = { :type => "Apache", :file => "LICENSE.txt" }
    s.author = { 
        "Apple" => "apple@apple.com",
        "Pleisto" => "engineering@pleisto.com"
    }
    s.source = { 
        :git => "https://github.com/pleisto/swift-markdown-cocoapods.git",
    }
    s.ios.deployment_target = "15.0"
 
    s.requires_arc = true
    s.module_name = "Markdown"
    s.source_files = [
        "Sources/Markdown/**/*.swift",
        "Sources/CAtomic/**/*.{h,c}",
        "swift-cmark/src/**/*.{h,c}",
        "swift-cmark/extensions/**/*.{h,c}",
    ]
    s.preserve_paths = [
        "README.md",
        "swift-cmark/src/*.inc",
        "swift-cmark/COPYING",
        "swift-cmark/README.md",
    ]
    s.pod_target_xcconfig = {
        'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => 'SWIFT_MARKDOWN_COCOA_PODS'
    }
    

end