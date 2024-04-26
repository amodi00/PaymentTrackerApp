using { InvoiceManagement } from '../db/schema.cds';

service InvoiceManagementSrv {
  @odata.draft.enabled
  entity Invoice as projection on InvoiceManagement.Invoice;
  @odata.draft.enabled
  entity LineItem as projection on InvoiceManagement.LineItem;
  @odata.draft.enabled
  entity Product as projection on InvoiceManagement.Product;
}