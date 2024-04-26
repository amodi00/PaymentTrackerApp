sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'invoicetrackingapp/test/integration/FirstJourney',
		'invoicetrackingapp/test/integration/pages/InvoiceList',
		'invoicetrackingapp/test/integration/pages/InvoiceObjectPage'
    ],
    function(JourneyRunner, opaJourney, InvoiceList, InvoiceObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('invoicetrackingapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheInvoiceList: InvoiceList,
					onTheInvoiceObjectPage: InvoiceObjectPage
                }
            },
            opaJourney.run
        );
    }
);