require_relative "canvas_base_type"

# The generate User class depends on Enrollment and Enrollment depends on User
# so we have a circular dependency. We use a forward declaration here to overcome the problem.
module LMSGraphQL
  module Types
    module Canvas
      class Enrollment < BaseType
      end
      class User < BaseType
      end
    end
  end
end
