class AddScoreAndMagnitudeToSources < ActiveRecord::Migration[5.1]
  def change
    add_column :sources, :score, :float
    add_column :sources, :magnitude, :float
  end
end
