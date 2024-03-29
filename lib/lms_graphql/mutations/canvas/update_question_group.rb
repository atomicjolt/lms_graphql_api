require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateQuestionGroup < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        argument :quiz_groups_name, [String], required: false
        argument :quiz_groups_pick_count, [Int], required: false
        argument :quiz_groups_question_points, [Int], required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, quiz_id:, id:, quiz_groups_name: nil, quiz_groups_pick_count: nil, quiz_groups_question_points: nil)
          context[:canvas_api].call("UPDATE_QUESTION_GROUP").proxy(
            "UPDATE_QUESTION_GROUP",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "id": id
            },
            {
              "quiz_groups[name]": quiz_groups_name,
              "quiz_groups[pick_count]": quiz_groups_pick_count,
              "quiz_groups[question_points]": quiz_groups_question_points
            },
          ).parsed_response
        end
      end
    end
  end
end