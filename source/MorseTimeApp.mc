using Toybox.Application;


class MorseTimeApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
        return [ new SwatchTimeView() ];
    }

    function onSettingsChanged() as Void {
        WatchUi.requestUpdate();
    }

    function getSettingsView() {
        return [ new MorseTimeSettingsMenu(), new MorseTimeSettingsDelegate() ];
    }

}