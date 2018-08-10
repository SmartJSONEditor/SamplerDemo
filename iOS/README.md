# AudioKit Sampler Demo for iOS

## Using your own samples

This is the last step to  **to get files onto your iOS device** where they will be accessible to the app. Using *iTunes file sharing* is one approach. Another is to embed the samples into your app's bundle (see below).

## Additional information about working without a metadata file on iOS

The code in *loadAndMapCompressedSampleFiles()* creates URLs in the app's Documents folder, but if you choose to embed samples into your app's bundle, you would instead use something like this:

```Swift
let fileURL = Bundle.main.url(forResource:"mySampleFile", withExtension: "wav")
```
