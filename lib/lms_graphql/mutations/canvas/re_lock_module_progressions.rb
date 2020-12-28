require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/module"
module LMSGraphQL
  module Mutations
    module Canvas
      class ReLockModuleProgression < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :module, LMSGraphQL::Types::Canvas::CanvasModule, null: false, resolver_method: :resolve_module
        def resolve_module
          object[:module]
        end
        
        def resolve(course_id:, id:)
          context[:canvas_api].call("RE_LOCK_MODULE_PROGRESSIONS").proxy(
            "RE_LOCK_MODULE_PROGRESSIONS",
            {
              "course_id": course_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end