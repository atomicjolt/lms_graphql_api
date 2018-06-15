require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/course_nickname"
module LMSGraphQL
  module Mutations
    module Canvas
      class SetCourseNickname < BaseMutation
        argument :course_id, ID, required: true
        argument :nickname, String, required: true
        field :course_nickname, LMSGraphQL::Types::Canvas::CanvasCourseNickname, null: false
        def resolve(course_id:, nickname:)
          context[:canvas_api].call("SET_COURSE_NICKNAME").proxy(
            "SET_COURSE_NICKNAME",
            {
              "course_id": course_id,
              "nickname": nickname            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end