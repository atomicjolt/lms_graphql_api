require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateSubgroupCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :title, String, required: true
        argument :description, String, required: false
        argument :vendor_guid, String, required: false
        field :outcome_group, LMSGraphQL::Types::Canvas::CanvasOutcomeGroup, null: false
        def resolve(course_id:, id:, title:, description: nil, vendor_guid: nil)
          context[:canvas_api].call("CREATE_SUBGROUP_COURSES").proxy(
            "CREATE_SUBGROUP_COURSES",
            {
              "course_id": course_id,
              "id": id
            },
            {
              "title": title,
              "description": description,
              "vendor_guid": vendor_guid
            },
          ).parsed_response
        end
      end
    end
  end
end