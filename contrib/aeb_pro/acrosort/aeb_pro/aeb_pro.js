/* 
    AEB Pro Document Assembly Methods

    Copyright (C) 2009 AcroTeX.Net
    D. P. Story
    http://www.acrotex.net
    
    Version 1.1
*/

if ( typeof aebTrustedFunctions == "undefined") {
    aebTrustedFunctions = app.trustedFunction( function ( doc, oFunction, oArgs )
    {
        app.beginPriv();
            var retn = oFunction( oArgs, doc )
        app.endPriv();
        return retn;
    });
}
aebAddWatermarkFromFile = app.trustPropagatorFunction( function ( oArgs, doc )
{
    app.beginPriv();
        return retn = doc.addWatermarkFromFile(oArgs);
    app.endPriv();
});
aebImportIcon = app.trustPropagatorFunction( function ( oArgs, doc )
{
    app.beginPriv();
        return retn = doc.importIcon(oArgs);
    app.endPriv();
});
aebInsertPages = app.trustPropagatorFunction( function ( oArgs, doc )
{
    app.beginPriv();
        try { doc.insertPages(oArgs); } catch(e) {console.println("Error: " + e.toString());}
    app.endPriv();
})
aebAppOpenDoc = app.trustPropagatorFunction( function ( oArgs, doc )
{
    app.beginPriv();
        try { var retn = app.openDoc(oArgs); } catch(e) {console.println("Error: " + e.toString());}
    app.endPriv();
    return retn;
})
aebImportSound = app.trustPropagatorFunction( function ( oArgs, doc )
{
    app.beginPriv();
        return retn = doc.importSound(oArgs);
    app.endPriv();
});
aebSaveAs = app.trustPropagatorFunction( function ( oArgs, doc )
{
    app.beginPriv();
        app.execMenuItem("Save");
    app.endPriv();
});
aebExtractPages = app.trustPropagatorFunction( function ( oArgs, doc )
{
    app.beginPriv();
        return retn = doc.extractPages(oArgs);
    app.endPriv();
});
aebMailDoc = app.trustPropagatorFunction( function ( oArgs, doc )
{
    app.beginPriv();
        return retn = doc.mailDoc(oArgs);
    app.endPriv();
});
aebImportDataObject = app.trustPropagatorFunction( function ( oArgs, doc )
{
    app.beginPriv();
        return retn = doc.importDataObject(oArgs);
    app.endPriv();
});
aebSignatureSign = app.trustPropagatorFunction( function ( oArgs, field )
{
    app.beginPriv();
        return retn = field.signatureSign(oArgs);
    app.endPriv();
});
aebSecurityHandlerLogin = app.trustPropagatorFunction( function ( oArgs, securityHandler )
{
    app.beginPriv();
        return retn = securityHandler.login(oArgs);
    app.endPriv();
});
aebSecurityGetHandler = app.trustPropagatorFunction( function ( oArgs, security )
{
    app.beginPriv();
        return retn = security.getHandler(oArgs);
    app.endPriv();
});
aebAppGetPath = app.trustPropagatorFunction( function ( oArgs, doc )
{
    app.beginPriv();
        var retn = app.getPath(oArgs);
    app.endPriv();
    return retn;
})
aebSignatureSetSeedValue = app.trustPropagatorFunction( function ( oArgs, field )
{
    app.beginPriv();
        return retn = field.signatureSetSeedValue(oArgs);
    app.endPriv();
});

