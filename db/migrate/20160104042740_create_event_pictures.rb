class CreateEventPictures < ActiveRecord::Migration
  def change
    create_table :event_pictures do |t|
      t.string :caption
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
