# Garmin Morse Time

A minimalist, elegant, typography-focused Garmin Connect IQ watch face that displays the current time with Morse digits.

![Morse time](resources/graphics/morse.png)
![Morse time](resources/graphics/morse-standard.png)

Available from [Garmin Connect IQ Developer portal](https://apps.garmin.com/apps/05ae153e-5370-45d7-ae2e-140b9216492b).


## Contents

* [Morse digits](#morse-digits)
* [Fonts](#fonts)
* [Build, test, deploy](#build-test-deploy)

## Morse digits

The [Morse code](https://en.wikipedia.org/wiki/Morse_code) represents the digits 0-9 with five dot or dash symbols each.
The table below shows the complete encoding.

| Decimal digit | Morse code |
| ------------: | :--------- |
| 0             | `-----`    |
| 1             | `.----`    |
| 2             | `..---`    |
| 3             | `...--`    |
| 4             | `....-`    |
| 5             | `.....`    |
| 6             | `-....`    |
| 7             | `--...`    |
| 8             | `---..`    |
| 9             | `----.`    |


## Fonts

The Morse Time watch face uses custom fonts:

* [SyneMono](https://fonts.google.com/specimen/Syne+Mono) for Morse time, 
* [Ubuntu](https://fonts.google.com/specimen/Ubuntu) for standard time.

The development process was as follows:

* The fonts were downloaded from [Google Fonts](https://fonts.google.com/) as True Type  (`.ttf`) fonts.
* The fonts were converted to bitmaps as `.fnt` and `.png` pairs using the open source command-line [`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp) converter.
* The font sizes were established to match the Garmin Fenix 7X Solar watch 280x280 pixel screen resolution.
* The fonts were then scaled proportionally to match other screen sizes available on Garmin watches with round screens using the included [utility script](utils/generate_fonts.py).

The table below lists all font sizes provided for the supported screen resolutions.

| Element       | Font             | 218 | 240 | 260 | 280 | 360 | 390 | 416 | 454 |
| :------------ | :--------------- | --: | --: | --: | --: | --: | --: | --: | --: |
| Morse time    | SyneMono regular |  54 |  60 |  65 |  70 |  90 |  98 | 104 | 114 |
| Standard time | Ubuntu regular   |  23 |  26 |  28 |  30 |  39 |  42 |  45 |  49 |

## Build, test, deploy

To modify and build the sources, you need to have installed:

* [Visual Studio Code](https://code.visualstudio.com/) with [Monkey C extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/).
* [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/).

Consult [Monkey C Visual Studio Code Extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/) for how to execute commands such as `build` and `test` to the Monkey C runtime.

You can use the included `Makefile` to conveniently trigger some of the actions from the command line.

```bash
# build binaries from sources
make build

# run unit tests
make test

# run the simulation
make run
```

**Note**  
To successfully execute the `test` and `run` targets, you need to start the simulator first.
Consult [developer.garmin.com/connect-iq/connect-iq-basics/your-first-app](https://developer.garmin.com/connect-iq/connect-iq-basics/your-first-app/) for details.
The site also explains how to sideload an application to a Garmin watch.
