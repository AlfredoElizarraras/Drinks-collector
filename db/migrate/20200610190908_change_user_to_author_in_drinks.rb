class ChangeUserToAuthorInDrinks < ActiveRecord::Migration[6.0]
  def change
    rename_column :drinks, :user_id, :author_id
  end
end
