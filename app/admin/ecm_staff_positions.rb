ActiveAdmin.register Ecm::Staff::Position do
  menu :parent => Proc.new { I18n.t('ecm.staff.active_admin.menu') }.call

  # Nested set settings
  config.sort_order = 'lft_asc'
  sortable_tree_member_actions

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
    sortable_tree_columns
    sortable_tree_indented_column :name
    column :people_count
    column :description
    column :created_at
    column :updated_at
    default_actions
  end # index
end
