/*
   AeB Slicing Dialog Box for AeB Slice batch sequence   
   Copyright (C) 2006 AcroTeX.Net
   D. P. Story
   http://www.acrotex.net
   
   Version 1.0
   
*/

app.addMenuItem( { cName: "aebSlicemenuItem", cUser: "AeB Slicing Parameters",
    cParent: "Tools", cExec: "aebGetSliceData();", nPos: 0 } );

function aebGetSliceData() 
{
    var retn = aebTrustedFunctions(this, aebExecDialog, aebGetSliceDialog);
    if ( retn == "cancel" ) delete global.aebGetSliceData;
    else {
        console.show();
        console.println("\nAeB Slice settings are set, now run the AeB Slice batch sequence");
    }
}

if ( typeof aebTrustedFunctions == "undefined") {
    aebTrustedFunctions = app.trustedFunction( function ( doc, oFunction, oArgs )
    {
        app.beginPriv();
            var retn = oFunction( oArgs, doc )
        app.endPriv();
        return retn;
    });
}
if ( typeof aebExecDialog == "undefined" ) {
    var aebExecDialog = app.trustedFunction( function (dialog,parentDoc)
    {
        app.beginPriv();
        dialog.doc = parentDoc;
        try { return retn = app.execDialog(dialog); } catch(e){}
        app.endPriv();
    })
}
var aebGetSliceDialog = {
    initialize: function (dialog)
    {
        if ( typeof global.aebSliceDialogData == "undefined" ) {
            this.loadDefaults(dialog);             
        } else {
            var sData = global.aebSliceDialogData;
            dialog.load({
                sFmt: {
                    "PDF": (sData.format =="") ? +1 : -1,
                    "EPS": (sData.format =="com.adobe.acrobat.eps") ? +2 : -2,
                    "JPEG": (sData.format =="com.adobe.acrobat.jpeg") ? +3 : -3,
                    "JP2K": (sData.format =="com.adobe.acrobat.jp2k") ? +4 : -4,
                    "PNG": (sData.format =="com.adobe.acrobat.png") ? +5 : -5,
                    "PS": -(sData.format =="com.adobe.acrobat.ps") ? +6 : -6,
                    "TIFF": (sData.format =="com.adobe.acrobat.tiff") ? +7 : -7
                },
                nRow: sData.nRows,
                nCol: sData.nCols,
                path: sData.path,
                bNam: sData.basename,
                nPag: sData.page,
                relp: sData.relativepath,
                pack: sData.package
            });
            dialog.enable({
                pack: ( sData.format == "") ? true : false,
            });
        }
        
    },
    loadDefaults: function (dialog) {
        dialog.load({
            sFmt: {
                "PDF": +1,
                "EPS": -2,
                "JPEG": -3,
                "JP2K": -4,                
                "PNG": -5,                
                "PS": -6,
                "TIFF": -7
            },
            relp: true,
            pack: false
        })
    },
    commit:function (dialog) { // called when OK pressed
        var results = dialog.store();
        // sFmt -- save format
        // nRow -- number of rows
        // nCol -- number of columns
        // path -- save path
        // bNam -- base name
        // nPag -- page number
        global.aebSliceDialogData = new Object();
        var sData = global.aebSliceDialogData;
        var elements = results["sFmt"];
        for(var i in elements) if ( elements[i] > 0 ) break;
        switch ( elements[i] ) {
            case 1: sData.format = "";
                sData.ext = "pdf";
                break;
            case 2: sData.format = "com.adobe.acrobat.eps";
                sData.ext = "eps";
                break;
            case 3: sData.format = "com.adobe.acrobat.jpeg";                
                sData.ext = "jpg";
                break;
            case 4: sData.format = "com.adobe.acrobat.jp2k";  
                sData.ext = "jp2k";
                break;
            case 5: sData.format = "com.adobe.acrobat.png";
                sData.ext = "png";
                break;
            case 6: sData.format = "com.adobe.acrobat.ps";                
                sData.ext = "ps";
                break;
            case 7: sData.format = "com.adobe.acrobat.tiff";  
                sData.ext = "tif";
        }
        var nRows = results["nRow"];
        nRows = this.ck4Int(nRows,"Rows",2);
        sData.nRows = ""+nRows;
        
        var nCols = results["nCol"];
        nCols = this.ck4Int(nCols,"Columns",2);
        sData.nCols = ""+nCols;
        
        sData.path = results["path"];
        sData.basename = results["bNam"];
        
        var nPage = results["nPag"];
        nPage = this.ck4Int(nPage,"Page Number",this.doc.pageNum);
        sData.page = ""+nPage;
        
        sData.relativepath = results["relp"];
        sData.package  = results["pack"];
    },
    ck4Int: function (n,str,def) {
        if (isFinite(n)) {
            n = parseFloat(n);
            n = (isNaN(n)) ? def : n;
            n = parseInt(n);
        } else {
            console.println("The value of the \""+str
                +"\" field specified was not an integer, changing it to a value of "
                +def+" for now, please fix.");
            n = def;
        }
        return n;        
    },
    sFmt: function (dialog) {
        var results = dialog.store();
        var elements = results["sFmt"];
        for(var i in elements) if ( elements[i] > 0 ) break;
        switch ( elements[i] ) {
            case 1: 
                dialog.enable({ pack: true });
                break;
            default: 
                dialog.enable({ pack: false });
        }        
    },
    rest: function (dialog) {
        dialog.load({
            sFmt: {
                "PDF": +1,
                "EPS": -2,
                "JPEG": -3,
                "JP2K": -4,                
                "PNG": -5,                
                "PS": -6,
                "TIFF": -7
            },
            nRow: "",
            nCol: "",
            path: "",
            bNam: "",
            nPag: "",
            relp: true,
            pack: false
        });
    },
    description:
    {
        name: "AcroTeX.Net: AeB Slicing Batch Sequence Dialog Box",    // dialog title
        align_children: "align_left",
        elements:
        [
            {
                type: "view",
                align_children: "align_left",
                elements:
                [
                    {
                        type: "cluster",
                        name: "aeb: Slicing Parameters",
                        item_id: "info",
                        align_children: "align_right",
                        elements:
                        [
                            {
                                type: "view",
                                align_children: "align_row",
                                elements:
                                [
                                    {
                                        type: "static_text",
                                        name: "Save Format:" 
                                    },
                                    {
                                        item_id: "sFmt",
                                        type: "popup",
                                        alignment: "align_fill",
                                        width: 200,
                                        height: 20
                                    },
                                    {
                                        type: "gap",
                                        width: 65,
                                        height: 20
                                    }                                    
                                ]
                            },
                            {
                                type: "view",
                                align_children: "align_row",
                                elements:
                                [
                                    {
                                        type: "static_text",
                                        name: "Rows:",
                                        height: 20
                                    },
                                    {
                                        item_id: "nRow",
                                        type: "edit_text",
                                        alignment: "align_fill",
                                        width: 300,
                                        height: 20
                                    }
                                ]
                            },
                            {
                                type: "view",
                                align_children: "align_row",
                                elements:
                                [
                                    {
                                        type: "static_text",
                                        name: "Columns:",
                                        height: 20
                                    },
                                    {
                                        item_id: "nCol",
                                        type: "edit_text",
                                        alignment: "align_fill",
                                        width: 300,
                                        height: 20
                                    }
                                ]
                            },
                            {
                                type: "view",
                                align_children: "align_row",
                                elements:
                                [
                                    {
                                        type: "static_text",
                                        name: "Base name:",
                                        height: 20
                                    },
                                    {
                                        item_id: "bNam",
                                        type: "edit_text",
                                        alignment: "align_fill",
                                        width: 300,
                                        height: 20
                                    }
                                ]
                            },
                            {
                                type: "view",
                                align_children: "align_row",
                                elements:
                                [
                                    {
                                        type: "static_text",
                                        name: "Page Number:",
                                        height: 20
                                    },
                                    {
                                        item_id: "nPag",
                                        type: "edit_text",
                                        alignment: "align_fill",
                                        width: 300,
                                        height: 20
                                    }
                                ]
                            },
                            {
                                type: "view",
                                align_children: "align_row",
                                elements:
                                [
                                    {
                                        type: "static_text",
                                        name: "Path:",
                                        height: 20
                                    },
                                    {
                                        item_id: "path",
                                        type: "edit_text",
                                        alignment: "align_fill",
                                        width: 300,
                                        height: 20
                                    }
                                ]
                            },
                            { type: "view", align_children: "align_row", width:300,
                              elements:
                                [ {type: "check_box", item_id: "relp", name: "Relative path"},
                                  {type: "check_box", item_id: "pack", name: "Package files"}  
                                ]
                            },                 
                        ]
                    },
                    {
                        type: "view",
                        align_children: "align_row",
                        elements:
                        [
                            { alignment: "align_right",type: "ok_cancel" },
                            { type: "gap", width: 100  },
                            { type: "button", item_id: "rest", name: "Reset" }
                        ]
                    }
                ]
            }
       ]
    }
};


