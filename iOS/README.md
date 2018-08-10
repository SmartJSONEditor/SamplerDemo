# AKSamplerDemo for iOS

## Getting samples into the program
Note you must **run the AKSamplerDemo program once on your iOS device** to get it ready to work with samples. When you do this, it won't make any sound at all, because there are no samples.

The demo program supports *iTunes File Sharing*, so once you have installed it on your iOS device, you can use iTunes to copy samples into its *Documents* folder. See [this Apple document](https://support.apple.com/en-ca/HT201301) for details.

## Getting the demo samples
To use this demo, you will first need to have some samples to load. Start by downloading [these ready-made samples](http://audiokit.io/downloads/ROMPlayerInstruments.zip). Unzip wherever you wish, and use *iTunes File Sharing* as described above, to copy the *ROMPlayer Instruments** folder into the Documents area for **AKSamplerDemo**.

The demo samples are the same as the ones included in the AudioKit **ROMPlayer** code repo on GitHub. They have been compressed using [WavPack](http://www.wavpack.com), and a `.sfz` metadata file has been added, to specify key/velocity mapping and loop points.

## Using your own samples
Preparing samples for any sampler instrument is a somewhat complex process. The basic steps are:

1. **Acquire sample files**, either by recording a hardware or software instrument yourself, or purchasing ready-made samples.
2. If necessary, **edit the samples** to your liking.
3. If applicable, **identify loop-start and end points** for each sample file. With commercial samples, this will usually have been done for you.
4. (Optional) **Create a metadata file** to define the mapping of MIDI note and velocity values to specific samples. Commercial samples typically include such metadata files, often in multiple formats.
5. **Get files onto your iOS device** where they will be accessible to the app. Using *iTunes file sharing* is one approach. Another is to embed the samples into your app's bundle (see below).

## Additional information about working without a metadata file on iOS

The code in *loadAndMapCompressedSampleFiles()* creates URLs in the app's Documents folder, but if you choose to embed samples into your app's bundle, you would instead use something like this:

```Swift
let fileURL = Bundle.main.url(forResource:"mySampleFile", withExtension: "wav")
```
