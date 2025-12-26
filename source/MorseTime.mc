import Toybox.Lang;

using StringUtils;


module MorseTime {

    function getMorseDigits(number as Number) as [String, String] {
        var tens = (number / 10) % 10;
        var ones = number % 10;
        var morseDigits = [MORSE_DIGITS[tens], MORSE_DIGITS[ones]];
        return morseDigits;
    }

}

