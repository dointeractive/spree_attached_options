class DropSpreeAttachedOptionTypesTable < ActiveRecord::Migration
  def up
    drop_table :spree_attached_option_types
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
