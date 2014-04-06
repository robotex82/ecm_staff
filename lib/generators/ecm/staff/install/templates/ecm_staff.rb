Ecm::Staff.configure do |config|
  # Accepted markup languages
  #
  # default: config.markup_languages = %w[ markdown rdoc textile ]
  config.markup_languages = %w[ markdown rdoc textile ]

  # Default markup language
  #
  # default: config.default_markup_language = 'textile'
  config.default_markup_language = 'textile'

  # Person model
  #
  # default: config.person_class_name = 'Person'
  config.person_class_name = 'Ecm::Staff::Person'
end # Ecm::Staff.configure
