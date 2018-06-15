require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasExternalToolTagAttribute < BaseType
        description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
        field :url, String, "URL to the external tool.Example: http://instructure.com", null: true
        field :new_tab, Boolean, "Whether or not there is a new tab for the external tool.", null: true
        field :resource_link_id, ID, "the identifier for this tool_tag.Example: ab81173af98b8c33e66a", null: true

      end
    end
  end
end