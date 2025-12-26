using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.Application;
using Toybox.Application.Properties;

using MorseTime;
using StringUtils;

class SwatchTimeView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        var clockTime = System.getClockTime();
        var hour = clockTime.hour;
        var minutes = clockTime.min;
        var seconds = clockTime.sec;

        var morseHourDigits = MorseTime.getMorseDigits(hour);
        var morseMinutesDigits = MorseTime.getMorseDigits(minutes);
        if (!MORSE_SYMBOLS.equals(DOT_DASH)) {
            morseHourDigits = [
                StringUtils.transliterate(morseHourDigits[0], DOT_DASH, MORSE_SYMBOLS),
                StringUtils.transliterate(morseHourDigits[1], DOT_DASH, MORSE_SYMBOLS)
            ];
            morseMinutesDigits = [
                StringUtils.transliterate(morseMinutesDigits[0], DOT_DASH, MORSE_SYMBOLS),
                StringUtils.transliterate(morseMinutesDigits[1], DOT_DASH, MORSE_SYMBOLS)
            ];
        }

        var viewHourTens = View.findDrawableById(DRAWABLE_HOUR_TENS_ID) as WatchUi.Text;
        var viewHourOnes = View.findDrawableById(DRAWABLE_HOUR_ONES_ID) as WatchUi.Text;
        var viewMinutesTens = View.findDrawableById(DRAWABLE_MINUTES_TENS_ID) as WatchUi.Text;
        var viewMinutesOnes = View.findDrawableById(DRAWABLE_MINUTES_ONES_ID) as WatchUi.Text;

        viewHourTens.setText(morseHourDigits[0]);
        viewHourOnes.setText(morseHourDigits[1]);
        viewMinutesTens.setText(morseMinutesDigits[0]);
        viewMinutesOnes.setText(morseMinutesDigits[1]);

        var standardTimeEnabled = PropertyUtils.getPropertyElseDefault(STANDARD_TIME_PROPERTY, STANDARD_TIME_MODE_DEFAULT);
        if (standardTimeEnabled) {
            var standardTime = Lang.format("$1$:$2$:$3$", [
                hour.format("%d"),
                minutes.format("%02d"),
                seconds.format("%02d")
            ]);
            var viewStandardTime = View.findDrawableById(DRAWABLE_STANDARD_TIME_ID) as WatchUi.Text;
            viewStandardTime.setText(standardTime);
        }        

        View.onUpdate(dc);

    }

}