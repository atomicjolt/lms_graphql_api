require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/assignment_group"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateAssignmentGroup < BaseMutation
        argument :course_id, ID, required: true
        argument :name, String, required: false
        argument :position, Int, required: false
        argument :group_weight, Float, required: false
        argument :sis_source_id, ID, required: false
        argument :integration_data, String, required: false
        argument :rules, String, required: false
        field :assignment_group, LMSGraphQL::Types::Canvas::CanvasAssignmentGroup, null: false
        def resolve(course_id:, name: nil, position: nil, group_weight: nil, sis_source_id: nil, integration_data: nil, rules: nil)
          context[:canvas_api].call("CREATE_ASSIGNMENT_GROUP").proxy(
            "CREATE_ASSIGNMENT_GROUP",
            {
              "course_id": course_id
            },
            {
              "name": name,
              "position": position,
              "group_weight": group_weight,
              "sis_source_id": sis_source_id,
              "integration_data": integration_data,
              "rules": rules
            },
          ).parsed_response
        end
      end
    end
  end
end