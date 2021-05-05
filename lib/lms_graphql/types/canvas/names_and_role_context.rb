require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasNamesAndRoleContext < BaseType
          description "Names and Role. API Docs: https://canvas.instructure.com/doc/api/names_and_role.html"
        field :id, ID, "LTI Context unique identifier.Example: 4dde05e8ca1973bcca9bffc13e1548820eee93a3", null: true
        field :label, String, "LTI Context short name or code.Example: CS-101", null: true
        field :title, String, "LTI Context full name.Example: Computer Science 101", null: true

      end
    end
  end
end