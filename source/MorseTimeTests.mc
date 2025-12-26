using Toybox.Application;

import Toybox.Lang;

using MorseTime;


const TEST_CASE_INPUT_LABEL = "input";
const TEST_CASE_SYMBOLS_LABEL = "symbols";
const TEST_CASE_EXPECTED_LABEL = "expected";

const MORSE_TEST_ERROR_TEMPLATE = "Test $1$ failed: getMorseDigits($2$) expected to return $3$, returned $4$";


(:test)
function testMorseTime(logger) {
    var morseTests = Application.loadResource(Rez.JsonData.MorseTestCases) as Array<Dictionary<String, String or [String,String]>>;
    for (var i = 0; i < morseTests.size(); ++i) {
        var testCase = morseTests[i] as Dictionary<String, Number or String or [String,String]>;
        var number = testCase[TEST_CASE_INPUT_LABEL].toNumber();
        var symbols = testCase[TEST_CASE_SYMBOLS_LABEL] as String;
        var expected = testCase[TEST_CASE_EXPECTED_LABEL] as [String, String];
        var morseDigits = MorseTime.getMorseDigits(number);
        for (var j = 0; j < morseDigits.size(); ++j) {
            var result = StringUtils.transliterate(morseDigits[j], ".-", symbols);
            if (!result.equals(expected[j])) {
                var message = Lang.format(MORSE_TEST_ERROR_TEMPLATE, [i+1, number, expected[j], result]);
                logger.error(message);
                return false;
            }
        }
    }
    return true;
}
