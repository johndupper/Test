class AddUserIdToSources < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :user_id, :integer
  end
end
