%%
%% This is file `fsprodef.js',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% aeb_pro.dtx  (with options: `copyright,fsdefjs')
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% aeb_pro.sty package,                      2016-05-15 %%
%% Copyright (C) 2006--2016  D. P. Story                %%
%%   dpstory@acrotex.net                                %%
%%                                                      %%
%% This program can redistributed and/or modified under %%
%% the terms of the LaTeX Project Public License        %%
%% Distributed from CTAN archives in directory          %%
%% macros/latex/base/lppl.txt; either version 1 of the  %%
%% License, or (at your option) any later version.      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\begin{insDLJS}[_fsDefaults]{fsdef}{AeB Pro: Presentation Defaults}
var _fsDefaults = true;
if ( typeof fsexec == "undefined" )
{
    try {
        var fsexec = true;
        var aebdefaultTransition = app.fs.defaultTransition;
        var aebbackgroundColor = app.fs.backgroundColor;
        var aebloop = app.fs.loop;
        var aebtimeDelay = app.fs.timeDelay;
        var aebuseTimer = app.fs.useTimer
        var aebusePageTiming = app.fs.usePageTiming;
        var aebclickAdvances = app.fs.clickAdvances;
        var aebcursor = app.fs.cursor;
        var aebescapeExits = app.fs.escapeExits;
\aeb@fsTran%
\aeb@fsBGColor%
\aeb@fsLoop%
\aeb@fsclickAdv%
\aeb@fscursor%
\aeb@fstimeDelay%
\aeb@fsuseTimer%
\aeb@fsusePageTiming%
\aeb@fsEscape%
\aeb@fsFS%
    } catch(e) {}
}
\end{insDLJS}
\begin{fs@willClose}
try {
    delete global.fsexec;
    app.fs.defaultTransition = aebdefaultTransition;
    app.fs.backgroundColor = aebbackgroundColor;
    app.fs.loop = aebloop;
    app.fs.timeDelay = aebtimeDelay;
    app.fs.useTimer = aebuseTimer;
    app.fs.usePageTiming = aebusePageTiming;
    app.fs.clickAdvances = aebclickAdvances;
    app.fs.cursor = aebcursor;
    app.fs.escapeExits = aebescapeExits;
} catch(e) { console.println("Could not reset one of the defaults"); }
\end{fs@willClose}
\endinput
%%
%% End of file `fsprodef.js'.
