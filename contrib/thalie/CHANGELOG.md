* thalie 0.9b (2017-04-24)

    * Remove blank page at the beginning of documentation.
    * Add missing dependency.

    -- Louis Paternault <spalax+ctan@gresille.org>

* thalie 0.9a (2017-04-22)

    * Thalie.sty

      * Commands `\playmark`, `\actmark` and `\scenemark` no longer include label (e.g. "Act 1"). It is up to the user to add it or not.
      * Display default translations, even in language environments using non-latin characters where no latin font is available (closes #24).
      * Do not add a wrong indentation after character name in verse environment (closes #3).
      * Package options can be redefined anywhere in the document (closes #5).
      * Reduce vertical space around character names in style `imprimerie-verse` (closes #6).
      * Replace package [ifthen](http://ctan.org/pkg/ifthen) with package [etoolbox](http://ctan.org/pkg/etoolbox) (closes #29).
      * Style of ramatis personæ can be customized (closes #9 #15 #18 #19).
      * Use [translations](http://ctan.org/pkg/translations) to translate words ("act", "scene", etc.).

    * Documentation

      * Add sections *Examples* and *Localization*.
      * Add a note about non-latin characters and character style `bold` (closes #26).
      * Fix `\customact` example.
      * Various minor improvements.

    * README

      *  Convert README from text to markdown.
      *  Add examples.

    -- Louis Paternault <spalax+ctan@gresille.org>

* thalie 0.8 (2015-12-30)

    * Fix release errors in previous release.

    -- Louis Paternault <spalax+ctan@gresille.org>

* thalie 0.7 (2015-12-28)

    * Update project URL to http://framagit.org/spalax/thalie.
    * Add commands `\pauseverse`, `\resumeverse` and `\adjustverse`.
    * Add package option `xspace`.
    * Minor documentation improvements.

    -- Louis Paternault <spalax+ctan@gresille.org>

* thalie 0.6 (2014-06-26)

    * Add character style `imprimerie-verse`, `imprimerie-prose`, and `arden`.
    * Correct a lot of typos in documentation (thanks Per).
    * Better alignment of groups of characters.
    * Improve spacing (thanks Caroline).
    * Several documentation and core improvements.

    -- Louis Paternault <spalax+ctan@gresille.org>

* thalie 0.5 (2013-06-08)

    * Initial release.

    -- Louis Paternault <spalax+ctan@gresille.org>
