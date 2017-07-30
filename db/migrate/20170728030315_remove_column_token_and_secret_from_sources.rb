class RemoveColumnTokenAndSecretFromSources < ActiveRecord::Migration[5.1]
  def change
    remove_columns :sources, :token, :secret
  end
end
