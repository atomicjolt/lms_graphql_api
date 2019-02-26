require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/course_nickname"
module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveCourseNickname < BaseMutation
        argument :course_id, ID, required: true
        field :course_nickname, LMSGraphQL::Types::Canvas::CanvasCourseNickname, null: false
        def resolve(course_id:)
          context[:canvas_api].call("REMOVE_COURSE_NICKNAME").proxy(
            "REMOVE_COURSE_NICKNAME",
            {
              "course_id": course_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end