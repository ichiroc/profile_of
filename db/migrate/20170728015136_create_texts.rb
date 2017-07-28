class CreateTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :texts do |t|
      t.text :body
      t.float :score
      t.float :magnitude
      t.references :source, foreign_key: true

      t.timestamps
    end
  end
end
