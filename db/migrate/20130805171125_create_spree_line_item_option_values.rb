class CreateSpreeLineItemOptionValues < ActiveRecord::Migration
  def change
    create_table :spree_line_item_option_values do |t|
      t.belongs_to :line_item
      t.belongs_to :option_value

      t.timestamps
    end
    add_index :spree_line_item_option_values, :line_item_id
    add_index :spree_line_item_option_values, :option_value_id
  end
end
