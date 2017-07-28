class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :provider
      t.string :token
      t.string :secret
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
