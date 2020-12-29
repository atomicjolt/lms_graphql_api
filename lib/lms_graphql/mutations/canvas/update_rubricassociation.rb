require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/rubric_association"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateRubricassociation < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :rubric_association_rubric_id, Int, required: false
        argument :rubric_association_association_id, Int, required: false
        argument :rubric_association_association_type, String, required: false
        argument :rubric_association_title, String, required: false
        argument :rubric_association_use_for_grading, Boolean, required: false
        argument :rubric_association_hide_score_total, Boolean, required: false
        argument :rubric_association_purpose, String, required: false
        argument :rubric_association_bookmarked, Boolean, required: false
        
        
        field :rubric_association, LMSGraphQL::Types::Canvas::CanvasRubricAssociation, null: false
        
        def resolve(course_id:, id:, rubric_association_rubric_id: nil, rubric_association_association_id: nil, rubric_association_association_type: nil, rubric_association_title: nil, rubric_association_use_for_grading: nil, rubric_association_hide_score_total: nil, rubric_association_purpose: nil, rubric_association_bookmarked: nil)
          context[:canvas_api].call("UPDATE_RUBRICASSOCIATION").proxy(
            "UPDATE_RUBRICASSOCIATION",
            {
              "course_id": course_id,
              "id": id
            },
            {
              "rubric_association[rubric_id]": rubric_association_rubric_id,
              "rubric_association[association_id]": rubric_association_association_id,
              "rubric_association[association_type]": rubric_association_association_type,
              "rubric_association[title]": rubric_association_title,
              "rubric_association[use_for_grading]": rubric_association_use_for_grading,
              "rubric_association[hide_score_total]": rubric_association_hide_score_total,
              "rubric_association[purpose]": rubric_association_purpose,
              "rubric_association[bookmarked]": rubric_association_bookmarked
            },
          ).parsed_response
        end
      end
    end
  end
end