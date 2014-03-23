ActiveAdmin.register Ecm::Staff::Position do
  form do |f|
    f.inputs do
      f.input :parent, :as => :select, :collection => nested_set_options(Ecm::Staff::Position, f.object) { |p| "#{'&#160;&#160;&#160;&#160;' * p.depth}&bull; #{p.to_s}".html_safe }
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
    column :people_count
    column :description
    column :created_at
    column :updated_at
    default_actions
  end # index
end
