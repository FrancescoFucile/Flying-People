class AddLocalityToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :locality, :string
  end
end
