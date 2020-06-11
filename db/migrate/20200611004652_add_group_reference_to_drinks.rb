class AddGroupReferenceToDrinks < ActiveRecord::Migration[6.0]
  def change
    add_column :drinks, :group_id, :integer, null: true
  end
end
