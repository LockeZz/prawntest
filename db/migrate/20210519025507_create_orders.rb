class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :index
      t.string :show

      t.timestamps
    end
  end
end
