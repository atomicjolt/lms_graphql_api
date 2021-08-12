require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class SubmitAssignmentSection < BaseMutation
        argument :section_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :comment_text_comment, String, required: false
        argument :submission_submission_type, String, required: true
        argument :submission_body, String, required: false
        argument :submission_url, String, required: false
        argument :submission_file_ids, [Int], required: false
        argument :submission_media_comment_id, String, required: false
        argument :submission_media_comment_type, String, required: false
        argument :submission_user_id, Int, required: false
        argument :submission_annotatable_attachment_id, Int, required: false
        argument :submission_submitted_at, LMSGraphQL::Types::DateTimeType, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(section_id:, assignment_id:, comment_text_comment: nil, submission_submission_type:, submission_body: nil, submission_url: nil, submission_file_ids: nil, submission_media_comment_id: nil, submission_media_comment_type: nil, submission_user_id: nil, submission_annotatable_attachment_id: nil, submission_submitted_at: nil)
          context[:canvas_api].call("SUBMIT_ASSIGNMENT_SECTIONS").proxy(
            "SUBMIT_ASSIGNMENT_SECTIONS",
            {
              "section_id": section_id,
              "assignment_id": assignment_id
            },
            {
              "comment[text_comment]": comment_text_comment,
              "submission[submission_type]": submission_submission_type,
              "submission[body]": submission_body,
              "submission[url]": submission_url,
              "submission[file_ids]": submission_file_ids,
              "submission[media_comment_id]": submission_media_comment_id,
              "submission[media_comment_type]": submission_media_comment_type,
              "submission[user_id]": submission_user_id,
              "submission[annotatable_attachment_id]": submission_annotatable_attachment_id,
              "submission[submitted_at]": submission_submitted_at
            },
          ).parsed_response
        end
      end
    end
  end
end