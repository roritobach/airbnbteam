class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
