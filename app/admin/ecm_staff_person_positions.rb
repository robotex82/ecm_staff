ActiveAdmin.register Ecm::Staff::PersonPosition do
  form do |f|
    f.inputs do
      f.input :person
      f.input :business_unit
      f.input :position
    end # f.inputs

    f.inputs do
      f.input :begin_at, :as => :datepicker
      f.input :end_at, :as => :datepicker
    end # f.inputs

#    f.inputs do
#      f.input :markup_language, :as => :select, :collection => Ecm::References::Configuration.markup_languages.map(&:to_s)
#    end # f.inputs

    f.actions
  end # form

  index do
    selectable_column
    column :person
    column :position
    column :organisation
    column :business_unit
    column :begin_at
    column :end_at
    default_actions
  end # index
end