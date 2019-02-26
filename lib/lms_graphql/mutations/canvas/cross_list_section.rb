require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Mutations
    module Canvas
      class CrossListSection < BaseMutation
        argument :id, ID, required: true
        argument :new_course_id, ID, required: true
        field :section, LMSGraphQL::Types::Canvas::CanvasSection, null: false
        def resolve(id:, new_course_id:)
          context[:canvas_api].call("CROSS_LIST_SECTION").proxy(
            "CROSS_LIST_SECTION",
            {
              "id": id,
              "new_course_id": new_course_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end