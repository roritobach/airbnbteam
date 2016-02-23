class AddUserToAnnounces < ActiveRecord::Migration
  def change
    add_reference :announces, :user, index: true, foreign_key: true
  end
end
