module Ecm
  module Staff
    EXCEPTIONS = %w[ PersonClassNotDefinedError ]

    EXCEPTIONS.each { |exception| const_set(exception, Class.new(StandardError)) }
  end # module Staff
end # module Ecm
