#!/bin/bash
# Run tests in Travis CI

set -o pipefail

cd iOS
pod install
xcodebuild -workspace SamplerDemo.xcworkspace -scheme SamplerDemo -sdk iphonesimulator clean build | xcpretty || exit 1

cd ../macOS
pod install
xcodebuild -workspace SamplerDemo.xcworkspace -scheme SamplerDemo clean build | xcpretty || exit 1

