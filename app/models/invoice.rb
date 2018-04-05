class Invoice < ApplicationRecord
	has_many :invoice_items
	after_create :set_invoice_number

    def set_invoice_number            
      @invoice_number = InvoiceNumber.all.first
      self.update_attribute(:number, "NEDT" + @invoice_number.value.to_s)      
      @invoice_number.increment!(:value, by = 1)      
    end
end
