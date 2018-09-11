class AddFotoProfiloToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fotoProfilo, :string
  end
end
