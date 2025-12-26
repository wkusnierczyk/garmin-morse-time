import Toybox.Lang;
using Toybox.StringUtil;

module StringUtils {

    class StringUtilsException extends Exception {

        private var _message;

        function initialize(message as String) {
            Exception.initialize();
            _message = message;
        }

        function getErrorMessage() as String or Null {
            return _message;
        }

    }   

    function  transliterate(string as String, fromChars as String, toChars as String) as String {
        if (fromChars.length() != toChars.length()) {
            var message = Lang.format("Unequal length: length(\"$1$\") != length(\"$2$\")", 
                [fromChars, toChars]);
            throw new StringUtilsException(message);
        }
        var characters = string.toCharArray();
        var fromArray = fromChars.toCharArray();
        var toArray = toChars.toCharArray();
        for (var i = 0; i < characters.size(); ++i) {
            for (var j = 0; j < fromArray.size(); ++j) {
                if (characters[i] == fromArray[j]) {
                    characters[i] = toArray[j];
                    break;
                }
            }
        }
        return StringUtil.charArrayToString(characters);
    }   

}