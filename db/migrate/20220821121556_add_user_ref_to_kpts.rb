class AddUserRefToKpts < ActiveRecord::Migration[6.0]
  def change
    add_reference :kpts, :user, foreign_key: true
  end
end
