class AddNewsToSources < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :news, :string
  end
end
