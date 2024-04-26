namespace InvoiceManagement;

entity Invoice {
  key ID: UUID;
  invoiceID: String(20) @assert.unique @mandatory;
  amount: Decimal;
  dueDate: Date;
  status: String(50);
  vendor: String(50);
  lineItems: Association to many LineItem on lineItems.invoice = $self;
}

entity LineItem {
  key ID: UUID;
  lineItemID: String(20) @assert.unique @mandatory;
  quantity: Integer;
  price: Decimal;
  invoice: Association to Invoice;
  product: Association to Product;
}

entity Product {
  key ID: UUID;
  productID: String(20) @assert.unique @mandatory;
  name: String(50);
  description: String(50);
  category: String(50);
  price: Decimal;
  lineItems: Association to many LineItem on lineItems.product = $self;
}
