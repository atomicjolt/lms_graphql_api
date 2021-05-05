require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasLicense < BaseType
          description "Files. API Docs: https://canvas.instructure.com/doc/api/files.html"
        field :id, ID, "a short string identifying the license.Example: cc_by_sa", null: true
        field :name, String, "the name of the license.Example: CC Attribution ShareAlike", null: true
        field :url, String, "a link to the license text.Example: http://creativecommons.org/licenses/by-sa/4.0", null: true

      end
    end
  end
end