class ChangeDataPaymentToOrders < ActiveRecord::Migration[5.2]
  def change
  	  change_column :orders, :payment, :text
  end
end
