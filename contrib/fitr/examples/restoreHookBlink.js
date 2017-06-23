%
% This script hooks into the DLJS of fitr to blink the field
% border when the user clicks in it. Length of the blink
% is 1250 milli-seconds.
%
\begin{insDLJS}[overlayRestoreHook]{rfitr}{Blink border on restore}
function overlayRestoreHook(event,bRestore) {
    if (!bRestore) return;
    toggleBC.field=event.target;
    toggleBC.startColor=event.target.strokeColor;
    toggleBC.altColor=(color.equal(toggleBC.startColor,color.transparent))?%
color.red:color.transparent;
    oSIR=app.setInterval("toggleBC();",250);
    oTOR=app.setTimeOut("app.clearInterval(oSIR); resetBC();",1250);
}
if (typeof toggleBC != "function" ) {
    function toggleBC() {
        var oField=toggleBC.field;
        oField.strokeColor=%
    (color.equal(oField.strokeColor,toggleBC.startColor))?%
toggleBC.altColor:toggleBC.startColor;
    }
    function resetBC() {
        toggleBC.field.strokeColor=toggleBC.startColor;
    }
}
\end{insDLJS}
\endinput
function toggleBC() {
    var oField=toggleBC.field;
    oField.strokeColor=%
(color.equal(oField.strokeColor,color.transparent))?color.red:color.transparent;
}
