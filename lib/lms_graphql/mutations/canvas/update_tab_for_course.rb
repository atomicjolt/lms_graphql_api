require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/tab"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateTabForCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :tab_id, ID, required: true
        argument :position, Int, required: false
        argument :hidden, Boolean, required: false
        field :tab, LMSGraphQL::Types::Canvas::CanvasTab, null: false
        def resolve(course_id:, tab_id:, position: nil, hidden: nil)
          context[:canvas_api].call("UPDATE_TAB_FOR_COURSE").proxy(
            "UPDATE_TAB_FOR_COURSE",
            {
              "course_id": course_id,
              "tab_id": tab_id
            },
            {
              "position": position,
              "hidden": hidden
            },
          ).parsed_response
        end
      end
    end
  end
end