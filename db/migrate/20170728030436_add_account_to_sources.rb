class AddAccountToSources < ActiveRecord::Migration[5.1]
  def change
    add_column :sources, :account, :string
  end
end
