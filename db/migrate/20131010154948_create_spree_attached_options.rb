class CreateSpreeAttachedOptions < ActiveRecord::Migration
  def change
    create_table :spree_attached_options do |t|
      t.belongs_to :variant
      t.belongs_to :option_value

      t.timestamps
    end
    add_index :spree_attached_options, :variant_id
    add_index :spree_attached_options, :option_value_id
  end
end
