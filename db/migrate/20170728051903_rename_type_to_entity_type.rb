class RenameTypeToEntityType < ActiveRecord::Migration[5.1]
  def change
    rename_column :entities, :type, :entity_type
  end
end
