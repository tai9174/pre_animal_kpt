class AddDateToKpts < ActiveRecord::Migration[6.0]
  def change
    add_column :kpts, :date, :datetime
  end
end
