require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Mutations
    module Canvas
      class CrossListSection < BaseMutation
        argument :id, ID, required: true
        argument :new_course_id, ID, required: true
        argument :override_sis_stickiness, Boolean, required: false
        
        
        field :section, LMSGraphQL::Types::Canvas::CanvasSection, null: false
        
        def resolve(id:, new_course_id:, override_sis_stickiness: nil)
          context[:canvas_api].call("CROSS_LIST_SECTION").proxy(
            "CROSS_LIST_SECTION",
            {
              "id": id,
              "new_course_id": new_course_id
            },
            {
              "override_sis_stickiness": override_sis_stickiness
            },
          ).parsed_response
        end
      end
    end
  end
end