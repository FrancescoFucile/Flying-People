class AddNumLikeToReports < ActiveRecord::Migration[5.1]
  def change
  	add_column :reports, :num_likes, :integer, default: 0
  end
end
