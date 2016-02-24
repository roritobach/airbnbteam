class CreateAnnouncePhotos < ActiveRecord::Migration
  def change
    create_table :announce_photos do |t|
      t.references :announce, index: true, foreign_key: true
      t.string :photo
      t.string :description
    end
  end
end
