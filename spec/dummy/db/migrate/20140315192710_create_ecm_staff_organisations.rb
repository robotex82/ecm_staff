class CreateEcmStaffOrganisations < ActiveRecord::Migration
  def change
    create_table :ecm_staff_organisations do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
