require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class MarkModuleItemAsDoneNotDone < BaseMutation
        argument :course_id, ID, required: true
        argument :module_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, module_id:, id:)
          context[:canvas_api].call("MARK_MODULE_ITEM_AS_DONE_NOT_DONE").proxy(
            "MARK_MODULE_ITEM_AS_DONE_NOT_DONE",
            {
              "course_id": course_id,
              "module_id": module_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end