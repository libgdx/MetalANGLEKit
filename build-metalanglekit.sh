#!/bin/sh
rm -r build
rm -r tmp
mkdir build
mkdir tmp

xcodebuild archive \
    -project MetalANGLEKit.xcodeproj \
    -scheme MetalANGLEKit \
    -destination "generic/platform=iOS" \
    -archivePath "tmp/MetalANGLEKit-iOS"

xcodebuild archive \
    -project MetalANGLEKit.xcodeproj \
    -scheme MetalANGLEKit \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "tmp/MetalANGLEKit-iOS_Simulator"

xcodebuild -create-xcframework \
    -archive tmp/MetalANGLEKit-iOS_Simulator.xcarchive -framework MetalANGLEKit.framework \
    -archive tmp/MetalANGLEKit-iOS.xcarchive -framework MetalANGLEKit.framework \
    -output build/MetalANGLEKit.xcframework

cp -r Frameworks/* build/