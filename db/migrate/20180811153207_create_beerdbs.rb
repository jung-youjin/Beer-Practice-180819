class CreateBeerdbs < ActiveRecord::Migration
  def change
    create_table :beerdbs do |t|
      t.string :num
      t.string :name
      t.string :brewery
      t.string :style
      t.string :alcohol
      t.string :fruit
      t.string :ibu
      t.string :text

      t.timestamps null: false
    end
  end
end
