platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!


workspace 'Healthy.xcworkspace'
project 'Healthy/Healthy/Healthy.xcodeproj'
project 'Healthy/Domain/Domain.xcodeproj'
project 'Healthy/DesignSystem/DesignSystem.xcodeproj'
project 'Healthy/Presentation/Presentation.xcodeproj'
project 'Healthy/Data/Data.xcodeproj'
project 'Healthy/Util/Util.xcodeproj'



def pods
  pod 'RealmSwift'
end

target 'Healthy' do
  project 'Healthy/Healthy/Healthy.xcodeproj'

end

target 'Domain' do
  project 'Healthy/Domain/Domain.xcodeproj'

end

target 'DesignSystem' do
  project 'Healthy/DesignSystem/DesignSystem.xcodeproj'

end

target 'Presentation' do
  project 'Healthy/Presentation/Presentation.xcodeproj'

end

target 'Data' do
  project 'Healthy/Data/Data.xcodeproj'

  pod 'RealmSwift'

end

target 'Util' do
  project 'Healthy/Util/Util.xcodeproj'

end