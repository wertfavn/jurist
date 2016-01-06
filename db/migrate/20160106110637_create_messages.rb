class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :studywork
      t.integer :year_birth
      t.string :phone
      t.text :why
      t.string :email
      t.text :content

      t.timestamps null: false
    end
  end
end
