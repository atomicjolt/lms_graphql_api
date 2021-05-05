require_relative "../canvas_base_type"
require_relative "enrollment_term"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasEnrollmentTermsList < BaseType
          description "Enrollment Terms. API Docs: https://canvas.instructure.com/doc/api/enrollment_terms.html"
        field :enrollment_terms, [LMSGraphQL::Types::Canvas::CanvasEnrollmentTerm], "a paginated list of all terms in the account.", null: true

      end
    end
  end
end