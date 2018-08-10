# AudioKit Sampler Demo for iOS

## Getting samples into the program
Note you must **run the SamplerDemo program once on your iOS device** to get it ready to work with samples. When you do this, it won't make any sound at all, because there are no samples.

The demo program supports *iTunes File Sharing*, so once you have installed it on your iOS device, you can use iTunes to copy samples into its *Documents* folder. See [this Apple document](https://support.apple.com/en-ca/HT201301) for details.

## Getting the demo samples
To use this demo, you will first need to have some samples to load. Start by downloading [these ready-made samples](http://audiokit.io/downloads/ROMPlayerInstruments.zip). Unzip wherever you wish, and use *iTunes File Sharing* as described above, to copy the *ROMPlayer Instruments** folder into the Documents area for **AKSamplerDemo**.


## Using your own samples

This is the last step to  **to get files onto your iOS device** where they will be accessible to the app. Using *iTunes file sharing* is one approach. Another is to embed the samples into your app's bundle (see below).

## Additional information about working without a metadata file on iOS

The code in *loadAndMapCompressedSampleFiles()* creates URLs in the app's Documents folder, but if you choose to embed samples into your app's bundle, you would instead use something like this:

```Swift
let fileURL = Bundle.main.url(forResource:"mySampleFile", withExtension: "wav")
```
