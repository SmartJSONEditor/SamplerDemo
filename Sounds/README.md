# Compressed sounds for new AKSampler

This is a package of sound files for the new AKSampler AU/Node under development by Shane Dunne.

## Sample capture
The original samples were recorded and prepared by Matthew Fecher from a Yamaha TX81z hardware FM synthesizer module, using commercial sampling software called [SampleRobot](http://www.samplerobot.com).

## Sample file compression
Shane has compressed these using the open-source [WavPack](http://www.wavpack.com) software, using the following Python 2 script:

```python
import os, subprocess

for aif in os.listdir('.'):
  if os.path.isfile(aif) and aif.endswith('.aif'):
    print 'converting', aif
    name = aif[:-4]
    wav = name + '.wav'
    wv = name + '.wv'
    subprocess.call(['/usr/bin/afconvert', '-f', 'WAVE', '-d', 'LEI24', aif, wav])
    subprocess.call(['/usr/local/bin/wavpack', '-q', '-r', '-b24', wav])
    os.remove(wav)
    #os.remove(aif)
```

## MIDI mapping and other sample metadata
Mapping of MIDI (note-number, velocity) pairs to sample files requires additional data, which in the case of these demo samples uses the [SFZ format](https://en.wikipedia.org/wiki/SFZ_(file_format)), which is essentially a text-based, open-standard alternative to the proprietary [SoundFont](https://en.wikipedia.org/wiki/SoundFont) format.

In addition to key-mapping, SFZ files can also contain other important metadata such as loop-start and -end points for each sample file.

The full SFZ standard is very rich, but at the time of writing, AKSampler's SFZ import capability is limited to key mapping and loop metadata only.


## How the SFZ files were made
Matt originally provided `.esx` metadata files for use by Apple's ESX24 Sampler plugin included with Logic Pro X. These files use a proprietary binary format and are notoriously difficult to work with.

Fortunately, KVR user [vonRed](https://www.kvraudio.com/forum/memberlist.php?mode=viewprofile&u=134002) has provided a free tool called [esxtosfz.py](https://www.kvraudio.com/forum/viewtopic.php?t=399035), which does a reasonable job of reading `.esx` files and outputting equivalent `.sfz` files.

The ``esxtosf2.py`` file is included herewith, as permitted by the author's choice of the [ISC license](https://en.wikipedia.org/wiki/ISC_license). Note this tool is written in Python 3, which is not installed by default on Macs, but is [available here](https://www.python.org/downloads/mac-osx/).

Shane used the following Python 2 script to convert all `.esx` files in a folder to `.sfz` format:

```python
import os, subprocess

for exs in os.listdir('.'):
  if os.path.isfile(exs) and exs.endswith('.exs'):
    print 'converting', exs
    sfz = exs[:-4] + '.sfz'
    subprocess.call(['/usr/local/bin/python3', '/Users/shane/exs2sfz.py', exs, sfz, 'samples'])
    #os.remove(exs)
```

## Future work
AKSampler's SFZ import is rudimentary at best, little more than a quick hack at this point. As soon as possible, it should be replaced by a properly-designed SFZ interpreter.
