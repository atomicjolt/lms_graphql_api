require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAssignmentGroupAttributeInput < BaseInputObject
          description "SIS Integration. API Docs: https://canvas.instructure.com/doc/api/sis_integration.html"
        argument :id, ID, "the id of the Assignment Group.Example: 1", required: false
        argument :name, String, "the name of the Assignment Group.Example: group2", required: false
        argument :group_weight, Int, "the weight of the Assignment Group.Example: 20", required: false
        argument :sis_source_id, ID, "the sis source id of the Assignment Group.Example: 1234", required: false
        argument :integration_data, String, "the integration data of the Assignment Group.Example: 0954", required: false

      end
    end
  end
end