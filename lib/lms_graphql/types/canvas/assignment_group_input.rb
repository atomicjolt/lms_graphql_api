require_relative "../canvas_base_input_type"
require_relative "grading_rule"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasAssignmentGroupInput < BaseInputObject
        description "Assignment Groups. API Docs: https://canvas.instructure.com/doc/api/assignment_groups.html"
        argument :id, ID, "the id of the Assignment Group.Example: 1", required: false
        argument :name, String, "the name of the Assignment Group.Example: group2", required: false
        argument :position, Int, "the position of the Assignment Group.Example: 7", required: false
        argument :group_weight, Int, "the weight of the Assignment Group.Example: 20", required: false
        argument :sis_source_id, ID, "the sis source id of the Assignment Group.Example: 1234", required: false
        argument :integration_data, String, "the integration data of the Assignment Group.Example: 0954", required: false
        argument :assignments, Int, "the assignments in this Assignment Group (see the Assignment API for a detailed list of fields).", required: false
        argument :rules, LMSGraphQL::Types::Canvas::CanvasGradingRule, "the grading rules that this Assignment Group has.", required: false

      end
    end
  end
end