```
cd "$(dirname "$0")"
cd ./
set -eu

mkdir -p ./test.app/Contents/{MacOS,Resources}
clang++ -std=c++20 -Wc++20-extensions -fobjc-arc -O3 -framework Cocoa ./test.mm -o ./test.app/Contents/MacOS/test

cp ./Info.plist ./test.app/Contents/
cp ./PkgInfo ./test.app/Contents/

# codesign --force --options runtime --deep --entitlements "entitlements.plist" --sign "Developer ID Application" --timestamp --verbose test.app
```