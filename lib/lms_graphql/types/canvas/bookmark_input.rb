require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasBookmarkInput < BaseInputObject
          description "Bookmarks. API Docs: https://canvas.instructure.com/doc/api/bookmarks.html"
        argument :id, ID, "Example: 1", required: false
        argument :name, String, "Example: Biology 101", required: false
        argument :url, String, "Example: /courses/1", required: false
        argument :position, Int, "Example: 1", required: false
        argument :data, String, "Example: 1", required: false

      end
    end
  end
end