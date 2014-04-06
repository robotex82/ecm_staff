class CreateEcmStaffPeople < ActiveRecord::Migration
  def change
    create_table :ecm_staff_people do |t|
      t.string :prefix
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.text :description

      # acts as list
      t.integer :position

      # acts as markup
      t.string :markup_language

      # friendly id
      t.string :slug

      t.timestamps
    end
  end
end
