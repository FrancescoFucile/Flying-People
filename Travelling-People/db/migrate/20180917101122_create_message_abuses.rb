class CreateMessageAbuses < ActiveRecord::Migration[5.1]
  def change
    create_table :message_abuses do |t|
      t.text :body
      t.integer :admin_id
      t.boolean :read, default: false	

      t.timestamps
    end
  end
end
