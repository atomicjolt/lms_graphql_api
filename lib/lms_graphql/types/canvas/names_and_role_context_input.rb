require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasNamesAndRoleContextInput < BaseInputObject
        description "Names and Role. API Docs: https://canvas.instructure.com/doc/api/names_and_role.html"
        argument :id, ID, "LTI Context unique identifier.Example: 4dde05e8ca1973bcca9bffc13e1548820eee93a3", required: false
        argument :label, String, "LTI Context short name or code.Example: CS-101", required: false
        argument :title, String, "LTI Context full name.Example: Computer Science 101", required: false

      end
    end
  end
end