ActiveAdmin.register Ecm::Staff::Organisation do
  index do
    selectable_column
    column :name
    column :description
    column :created_at
    column :updated_at
    default_actions
  end # index
end
