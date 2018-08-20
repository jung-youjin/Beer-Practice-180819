class ChangePhoneToBeStringInCustomers < ActiveRecord::Migration
  def change
    change_column :posts, :x, :float
    change_column :posts, :y, :float
  end
end
