PROJECT_NAME = 'EarlGreyTest'
TEST_TARGET = 'EarlGreyTestTests'
SCHEME_FILE = 'EarlGreyTestTests.xcscheme'

target TEST_TARGET do
  project PROJECT_NAME

  inherit! :search_paths
  pod 'EarlGrey'
end

post_install do |installer|
  load('configure_earlgrey_pods.rb')
  configure_for_earlgrey(installer, PROJECT_NAME, TEST_TARGET, SCHEME_FILE)
end