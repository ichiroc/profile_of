class CreateEntities < ActiveRecord::Migration[5.1]
  def change
    create_table :entities do |t|
      t.string :type
      t.float :salience
      t.string :name
      t.references :text, foreign_key: true

      t.timestamps
    end
  end
end
