ActiveAdmin.register Ecm::Staff::BusinessUnit do
  form do |f|
    f.inputs do
      f.input :organisation, :as => :select, :collection => Ecm::Staff::Organisation.all.collect { |o| [ o.to_s, o.id ] }
      f.input :parent, :as => :select, :collection => nested_set_options(Ecm::Staff::BusinessUnit, f.object) { |bu| "#{'&#160;&#160;&#160;&#160;' * bu.depth}&bull; #{bu.to_s}".html_safe }
    end # f.inputs

    f.inputs do
      f.input :name
      f.input :description
    end # f.inputs

#    f.inputs do
#      f.input :markup_language, :as => :select, :collection => Ecm::References::Configuration.markup_languages.map(&:to_s)
#    end # f.inputs

    f.actions
  end # form

  index do
    selectable_column
    column :name
    column :description
    column :created_at
    column :updated_at
    default_actions
  end # def
end
