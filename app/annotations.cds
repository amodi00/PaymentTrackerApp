using { InvoiceManagementSrv } from '../srv/service.cds';

annotate InvoiceManagementSrv.Invoice with @UI.DataPoint #amount: {
  Value: amount,
  Title: 'Amount',
};
annotate InvoiceManagementSrv.Invoice with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#amount', ID: 'Amount' }
];
annotate InvoiceManagementSrv.Invoice with @UI.HeaderInfo: {
  TypeName: 'Invoice',
  TypeNamePlural: 'Invoices',
  Title: { Value: invoiceID }
};
annotate InvoiceManagementSrv.Invoice with {
  ID @UI.Hidden
};
annotate InvoiceManagementSrv.Invoice with @UI.Identification: [{ Value: invoiceID }];
annotate InvoiceManagementSrv.Invoice with {
  invoiceID @Common.Label: 'Id';
  amount @Common.Label: 'Amount';
  dueDate @Common.Label: 'Due Date';
  status @Common.Label: 'Status';
  vendor @Common.Label: 'Vendor';
  lineItems @Common.Label: 'Line Items'
};
annotate InvoiceManagementSrv.Invoice with {
  ID @Common.Text: { $value: invoiceID, ![@UI.TextArrangement]: #TextOnly };
};
annotate InvoiceManagementSrv.Invoice with @UI.SelectionFields: [
  invoiceID
];
annotate InvoiceManagementSrv.Invoice with @UI.LineItem #invoicesTable: [
    { $Type: 'UI.DataField', Value: invoiceID },
    { $Type: 'UI.DataField', Value: amount },
    { $Type: 'UI.DataField', Value: dueDate },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: vendor }
];
annotate InvoiceManagementSrv.Invoice with @UI.SelectionPresentationVariant #invoicesTable: {
  Text : 'Invoices',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#invoicesTable']
  }
};
annotate InvoiceManagementSrv.Invoice with @UI.LineItem #lineItemsTable: [
    { $Type: 'UI.DataField', Value: lineItems.lineItemID },
    { $Type: 'UI.DataField', Value: lineItems.quantity },
    { $Type: 'UI.DataField', Value: lineItems.price }
];
annotate InvoiceManagementSrv.Invoice with @UI.SelectionPresentationVariant #lineItemsTable: {
  Text : 'Line Items',
  SelectionVariant : {
    SelectOptions : []
  },
  PresentationVariant : {
    Visualizations : ['@UI.LineItem#lineItemsTable']
  }
};
annotate InvoiceManagementSrv.Invoice with @UI.FieldGroup #invoiceDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: invoiceID },
    { $Type: 'UI.DataField', Value: amount },
    { $Type: 'UI.DataField', Value: dueDate },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: vendor }

  ]
};


annotate InvoiceManagementSrv.LineItem with @UI.LineItem #lineItems: [
    { $Type: 'UI.DataField', Value: lineItemID },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: price }

  ];


annotate InvoiceManagementSrv.Invoice with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'invoiceTab',
    Label: 'Invoice',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'invoiceDetails', Label: 'Invoice Details', Target: '@UI.FieldGroup#invoiceDetails' },
      { $Type: 'UI.ReferenceFacet', ID: 'lineItems', Label: 'Line Items', Target: 'lineItems/@UI.LineItem#lineItems' } ]
  }
];
annotate InvoiceManagementSrv.LineItem with {
  invoice @Common.ValueList: {
    CollectionPath: 'Invoice',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: invoice_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'invoiceID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'amount'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dueDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'vendor'
      },
    ],
  }
};
annotate InvoiceManagementSrv.LineItem with {
  product @Common.ValueList: {
    CollectionPath: 'Product',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: product_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'category'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
    ],
  }
};
annotate InvoiceManagementSrv.LineItem with @UI.HeaderInfo: {
  TypeName: 'Line Item',
  TypeNamePlural: 'Line Items',
  Title: { Value: lineItemID }
};
annotate InvoiceManagementSrv.LineItem with {
  ID @UI.Hidden
};
annotate InvoiceManagementSrv.LineItem with @UI.Identification: [{ Value: lineItemID }];
annotate InvoiceManagementSrv.LineItem with {
  lineItemID @Common.Label: 'Id';
  quantity @Common.Label: 'Quantity';
  price @Common.Label: 'Price';
  invoice @Common.Label: 'Invoice';
  product @Common.Label: 'Product'
};
annotate InvoiceManagementSrv.LineItem with {
  ID @Common.Text: { $value: lineItemID, ![@UI.TextArrangement]: #TextOnly };
  invoice @Common.Text: { $value: invoice.invoiceID, ![@UI.TextArrangement]: #TextOnly };
  product @Common.Text: { $value: product.productID, ![@UI.TextArrangement]: #TextOnly };
};
annotate InvoiceManagementSrv.LineItem with @UI.SelectionFields: [
  invoice_ID,
  product_ID
];
annotate InvoiceManagementSrv.LineItem with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: lineItemID },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Invoice', Value: invoice_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
];
annotate InvoiceManagementSrv.LineItem with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: lineItemID },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: price },
    { $Type: 'UI.DataField', Label: 'Invoice', Value: invoice_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
]};
annotate InvoiceManagementSrv.LineItem with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate InvoiceManagementSrv.Product with @UI.HeaderInfo: {
  TypeName: 'Product',
  TypeNamePlural: 'Products',
  Title: { Value: productID }
};
annotate InvoiceManagementSrv.Product with {
  ID @UI.Hidden
};
annotate InvoiceManagementSrv.Product with @UI.Identification: [{ Value: productID }];
annotate InvoiceManagementSrv.Product with {
  productID @Common.Label: 'Id';
  name @Common.Label: 'Name';
  description @Common.Label: 'Description';
  category @Common.Label: 'Category';
  price @Common.Label: 'Price';
  lineItems @Common.Label: 'Line Items'
};
annotate InvoiceManagementSrv.Product with {
  ID @Common.Text: { $value: productID, ![@UI.TextArrangement]: #TextOnly };
};
annotate InvoiceManagementSrv.Product with @UI.SelectionFields: [
  productID
];
annotate InvoiceManagementSrv.Product with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: productID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: category },
    { $Type: 'UI.DataField', Value: price }
];
annotate InvoiceManagementSrv.Product with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: productID },
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: category },
    { $Type: 'UI.DataField', Value: price }
]};
annotate InvoiceManagementSrv.Product with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];