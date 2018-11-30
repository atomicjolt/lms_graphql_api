require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateSingleRubric < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :rubric_association_id, ID, required: false
        argument :rubric_title, String, required: false
        argument :rubric_free_form_criterion_comments, Boolean, required: false
        argument :rubric_skip_updating_points_possible, Boolean, required: false
        argument :rubric_association_association_id, Int, required: false
        argument :rubric_association_association_type, String, required: false
        argument :rubric_association_use_for_grading, Boolean, required: false
        argument :rubric_association_hide_score_total, Boolean, required: false
        argument :rubric_association_purpose, String, required: false
        argument :rubric_criteria, String, required: false
        field :return_value, Boolean, null: false
        def resolve(course_id:, id:, rubric_association_id: nil, rubric_title: nil, rubric_free_form_criterion_comments: nil, rubric_skip_updating_points_possible: nil, rubric_association_association_id: nil, rubric_association_association_type: nil, rubric_association_use_for_grading: nil, rubric_association_hide_score_total: nil, rubric_association_purpose: nil, rubric_criteria: nil)
          context[:canvas_api].call("UPDATE_SINGLE_RUBRIC").proxy(
            "UPDATE_SINGLE_RUBRIC",
            {
              "course_id": course_id,
              "id": id,
              "rubric_association_id": rubric_association_id,
              "rubric[title]": rubric_title,
              "rubric[free_form_criterion_comments]": rubric_free_form_criterion_comments,
              "rubric[skip_updating_points_possible]": rubric_skip_updating_points_possible,
              "rubric_association[association_id]": rubric_association_association_id,
              "rubric_association[association_type]": rubric_association_association_type,
              "rubric_association[use_for_grading]": rubric_association_use_for_grading,
              "rubric_association[hide_score_total]": rubric_association_hide_score_total,
              "rubric_association[purpose]": rubric_association_purpose,
              "rubric[criteria]": rubric_criteria            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end