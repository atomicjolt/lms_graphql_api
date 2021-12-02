require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class MarkRubricCommentsAsReadSection < BaseMutation
        argument :section_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :user_id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(section_id:, assignment_id:, user_id:)
          context[:canvas_api].call("MARK_RUBRIC_COMMENTS_AS_READ_SECTIONS").proxy(
            "MARK_RUBRIC_COMMENTS_AS_READ_SECTIONS",
            {
              "section_id": section_id,
              "assignment_id": assignment_id,
              "user_id": user_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end