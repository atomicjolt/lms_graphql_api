require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasExternalToolTagAttributeInput < BaseInputObject
          description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
        argument :url, String, "URL to the external tool.Example: http://instructure.com", required: false
        argument :new_tab, Boolean, "Whether or not there is a new tab for the external tool.", required: false
        argument :resource_link_id, ID, "the identifier for this tool_tag.Example: ab81173af98b8c33e66a", required: false

      end
    end
  end
end