class CreateSpreeAttachedOptionTypes < ActiveRecord::Migration
  def change
    create_table :spree_attached_option_types do |t|
      t.belongs_to :product
      t.belongs_to :option_type

      t.timestamps
    end
    add_index :spree_attached_option_types, :product_id
    add_index :spree_attached_option_types, :option_type_id
  end
end
