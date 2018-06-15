require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class ResetCourseFavorite < CanvasBaseMutation

        field :return_value, Boolean, null: false
        def resolve()
          context[:canvas_api].call("RESET_COURSE_FAVORITES").proxy(
            "RESET_COURSE_FAVORITES",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end