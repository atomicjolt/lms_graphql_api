require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/module"
module LMSGraphQL
  module Mutations
    module Canvas
      class ReLockModuleProgression < CanvasBaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        field :module, LMSGraphQL::Types::Canvas::Module, null: false
        def resolve(course_id:, id:)
          ctx[:canvas_api].proxy(
            "RE_LOCK_MODULE_PROGRESSIONS",
            {
              "course_id": course_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end