require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasTabInput < BaseInputObject
        description "Tabs. API Docs: https://canvas.instructure.com/doc/api/tabs.html"
        argument :html_url, String, "Example: /courses/1/external_tools/4", required: false
        argument :id, ID, "Example: context_external_tool_4", required: false
        argument :label, String, "Example: WordPress", required: false
        argument :type, String, "Example: external", required: false
        argument :hidden, Boolean, "only included if true.Example: true", required: false
        argument :visibility, String, "possible values are: public, members, admins, and none.Example: public", required: false
        argument :position, Int, "1 based.Example: 2", required: false

      end
    end
  end
end