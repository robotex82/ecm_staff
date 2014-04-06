class CreateEcmStaffOrganisations < ActiveRecord::Migration
  def change
    create_table :ecm_staff_organisations do |t|
      t.string :name
      t.text :description

      # acts as markup
      t.string :markup_language

      # friendly id
      t.string :slug

      t.timestamps
    end
  end
end
