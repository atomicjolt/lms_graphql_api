require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasBookmark < BaseType
        description "Bookmarks. API Docs: https://canvas.instructure.com/doc/api/bookmarks.html"
      	field :id, ID, "Example: 1", null: true
      	field :name, String, "Example: Biology 101", null: true
      	field :url, String, "Example: /courses/1", null: true
      	field :position, Int, "Example: 1", null: true
      	field :data, String, "Example: 1", null: true

      end
    end
  end
end