using Toybox.Application;

import Toybox.Lang;


// Morse code
const DOT_DASH = ".-";
const MORSE_DIGITS = Application.loadResource(Rez.JsonData.MorseDigits) as Array<String>;
const MORSE_SYMBOLS = Application.loadResource(Rez.Strings.MorseSymbols) as Lang.String;


// Settings
const CUSTOMIZE_MENU_TITLE = Application.loadResource(Rez.Strings.MorseTime);

const STANDARD_TIME_LABEL = Application.loadResource(Rez.Strings.ShowStandardTimeTitle);
const STANDARD_TIME_PROPERTY = "ShowStandardTime";
const STANDARD_TIME_MODE_DEFAULT = false;


// Views
const DRAWABLE_HOUR_TENS_ID = "MorseTimeHourTens";
const DRAWABLE_HOUR_ONES_ID = "MorseTimeHourOnes";
const DRAWABLE_MINUTES_TENS_ID = "MorseTimeMinutesTens";
const DRAWABLE_MINUTES_ONES_ID = "MorseTimeMinutesOnes";
const DRAWABLE_STANDARD_TIME_ID = "StandardTime";

