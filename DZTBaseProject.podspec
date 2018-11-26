Pod::Spec.new do |spec|
  spec.name         = 'DZTBaseProject'
  spec.version      = '1.1.3'
  spec.ios.deployment_target = '8.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/YYDD/DZTBaseProject.git'
  spec.authors      = { 'YYDD' => '615689375@qq.com' }
  spec.summary      = 'iOS Tools'
  spec.requires_arc = true


  spec.source       = { :git => 'https://github.com/YYDD/DZTBaseProject.git',:tag => spec.version}
#  spec.source       = { :git => 'https://github.com/YYDD/DZTBaseProject.git'}


  spec.dependency 'MJRefresh'
  spec.dependency 'CFYNavigationBarTransition'


  spec.frameworks   = 'UIKit'

  spec.subspec 'DZTBaseVC' do |ss|
    ss.source_files = 'DZTBaseCommom/DZTBaseVC/*.{h,m}'
    ss.public_header_files = 'DZTBaseCommom/DZTBaseVC/*.h'
  end

  spec.subspec 'DZTBaseViewCell' do |ss|
    ss.source_files = 'DZTBaseCommom/DZTBaseViewCell/*.{h,m}'
    ss.public_header_files = 'DZTBaseCommom/DZTBaseViewCell/*.h'
  end

  spec.subspec 'DZTBaseViewModel' do |ss|
    ss.source_files = 'DZTBaseCommom/DZTBaseViewModel/*.{h,m}'
    ss.public_header_files = 'DZTBaseCommom/DZTBaseViewModel/*.h'
  end

  spec.subspec 'DZTConfig' do |ss|
    ss.source_files = 'DZTBaseCommom/DZTConfig/*.{h,m}'
    ss.public_header_files = 'DZTBaseCommom/DZTConfig/*.h'
  end

  

end
