require_relative "../canvas_base_input_type"
require_relative "enrollment_term"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasEnrollmentTermsListInput < BaseInputObject
          description "Enrollment Terms. API Docs: https://canvas.instructure.com/doc/api/enrollment_terms.html"
        argument :enrollment_terms, [LMSGraphQL::Types::Canvas::CanvasEnrollmentTermInput], "a paginated list of all terms in the account.", required: false

      end
    end
  end
end