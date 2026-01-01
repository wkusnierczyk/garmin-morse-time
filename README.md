# Garmin Morse Time

A minimalist, elegant, nerdy Garmin Connect IQ watch face that displays the current time with Morse digits.

![Morse Time](resources/graphics/MorseTimeHero-small.png)

Available from [Garmin Connect IQ Developer portal](https://apps.garmin.com/apps/05ae153e-5370-45d7-ae2e-140b9216492b).

> **Note**  
> Swatch Time is part of a [collection of unconventional Garmin watch faces](https://github.com/wkusnierczyk/garmin-watch-faces). It has been developed for fun, as a proof of concept, and as a learning experience.
> It is shared _as is_ as an open source project, with no commitment to long term maintenance and further feature development.
>
> Please use [issues](https://github.com/wkusnierczyk/garmin-morse-time/issues) to provide bug reports or feature requests.  
> Please use [discussions](https://github.com/wkusnierczyk/garmin-morse-time/discussions) for any other comments.
>
> All feedback is wholeheartedly welcome.

## Contents

* [Morse digits](#morse-digits)
* [Features](#features)
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


## Features

The Morse Time watch face supports the following features:

|Screenshot|Description|
|-|:-|
|![Morse time](resources/graphics/morse.png)|**Morse time**<br /> The current time is displayed as Morse digits, in four rows: Two top rows in white font show the two hour digits (including zero, when hour < 10), the bottom two rows in ornge font show the minute digits.|
|![Morse time](resources/graphics/morse-standard.png)| **Standard time**<br />A setting in the Customize menu enables the user to toggle the standard time display on and off. The standard time is shown below the Morse time in smaller, dimmer font.|


## Fonts

The Morse Time watch face uses custom fonts:

* [SyneMono](https://fonts.google.com/specimen/Syne+Mono) for Morse time, 
* [Ubuntu](https://fonts.google.com/specimen/Ubuntu) for standard time.

> The development of Garmin watch faces motivated the implementation of two useful tools:
> * A TTF to FNT+PNG converter ([`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp)).  
> Garmin watches use non-scalable fixed-size bitmap fonts, and cannot handle variable size True Type fonts directly.
> * An font scaler automation tool ([`garmin-font-scaler`](https://github.com/wkusnierczyk/garmin-font-scaler)).  
> Garmin watches come in a variety of shapes and resolutions, and bitmap fonts need to be scaled for each device proportionally to its resolution.

The font development proceeded as follows:

* The fonts were downloaded from [Google Fonts](https://fonts.google.com/) as True Type  (`.ttf`) fonts.
* The fonts were converted to bitmaps as `.fnt` and `.png` pairs using the open source command-line [`ttf2bmp`](https://github.com/wkusnierczyk/ttf2bmp) converter.
* The font sizes were established to match the Garmin Fenix 7X Solar watch 280x280 pixel screen resolution.
* The fonts were then scaled proportionally to match other screen sizes available on Garmin watches using the [`garmin-font-scaler`](https://github.com/wkusnierczyk/garmin-font-scaler) tool.

The table below lists all font sizes provided for the supported screen resolutions.

| Resolution |    Shape     |    Element    |       Font       | Size |
| ---------: | :----------- | :------------ | :--------------- | ---: |
|  148 x 205 | rectangle    | Morse time    | SyneMono regular |   37 |
|  148 x 205 | rectangle    | Standard time | Ubuntu regular   |   16 |
|  176 x 176 | semi-octagon | Morse time    | SyneMono regular |   44 |
|  176 x 176 | semi-octagon | Standard time | Ubuntu regular   |   19 |
|  215 x 180 | semi-round   | Morse time    | SyneMono regular |   45 |
|  215 x 180 | semi-round   | Standard time | Ubuntu regular   |   19 |
|  218 x 218 | round        | Morse time    | SyneMono regular |   54 |
|  218 x 218 | round        | Standard time | Ubuntu regular   |   23 |
|  240 x 240 | round        | Morse time    | SyneMono regular |   60 |
|  240 x 240 | rectangle    | Morse time    | SyneMono regular |   60 |
|  240 x 240 | round        | Standard time | Ubuntu regular   |   26 |
|  240 x 240 | rectangle    | Standard time | Ubuntu regular   |   26 |
|  260 x 260 | round        | Morse time    | SyneMono regular |   65 |
|  260 x 260 | round        | Standard time | Ubuntu regular   |   28 |
|  280 x 280 | round        | Morse time    | SyneMono regular |   70 |
|  280 x 280 | round        | Standard time | Ubuntu regular   |   30 |
|  320 x 360 | rectangle    | Morse time    | SyneMono regular |   80 |
|  320 x 360 | rectangle    | Standard time | Ubuntu regular   |   34 |
|  360 x 360 | round        | Morse time    | SyneMono regular |   90 |
|  360 x 360 | round        | Standard time | Ubuntu regular   |   39 |
|  390 x 390 | round        | Morse time    | SyneMono regular |   98 |
|  390 x 390 | round        | Standard time | Ubuntu regular   |   42 |
|  416 x 416 | round        | Morse time    | SyneMono regular |  104 |
|  416 x 416 | round        | Standard time | Ubuntu regular   |   45 |
|  454 x 454 | round        | Morse time    | SyneMono regular |  114 |
|  454 x 454 | round        | Standard time | Ubuntu regular   |   49 |

## Build, test, deploy

To modify and build the sources, you need to have installed:

* [Visual Studio Code](https://code.visualstudio.com/) with [Monkey C extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/).
* [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/).

Consult [Monkey C Visual Studio Code Extension](https://developer.garmin.com/connect-iq/reference-guides/visual-studio-code-extension/) for how to execute commands such as `build` and `test` to the Monkey C runtime.

You can use the included `Makefile` to conveniently trigger some of the actions from the command line.

```bash
# build binaries from sources
make build

# run unit tests -- note: requires the simulator to be running
make test

# run the simulation 
make run

# clean up the project directory
make clean
```

**Note**  
To successfully execute the `test` and `run` targets, you need to start the simulator first.
Consult [developer.garmin.com/connect-iq/connect-iq-basics/your-first-app](https://developer.garmin.com/connect-iq/connect-iq-basics/your-first-app/) for details.

To sideload your application to your Garmin watch, see [developer.garmin.com/connect-iq/connect-iq-basics/your-first-app](https://developer.garmin.com/connect-iq/connect-iq-basics/your-first-app/).
