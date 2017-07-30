class AddTextTypeToText < ActiveRecord::Migration[5.1]
  def change
    add_column :texts, :text_type, :integer
  end
end
