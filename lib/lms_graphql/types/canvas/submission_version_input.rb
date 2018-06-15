require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasSubmissionVersionInput < BaseInputObject
        description "Gradebook History. API Docs: https://canvas.instructure.com/doc/api/gradebook_history.html"
        argument :assignment_id, ID, "the id of the assignment this submissions is for.Example: 22604", required: false
        argument :assignment_name, String, "the name of the assignment this submission is for.Example: some assignment", required: false
        argument :body, String, "the body text of the submission.Example: text from the submission", required: false
        argument :current_grade, String, "the most up to date grade for the current version of this submission.Example: 100", required: false
        argument :current_graded_at, LMSGraphQL::Types::DateTimeType, "the latest time stamp for the grading of this submission.Example: 2013-01-31T18:16:31Z", required: false
        argument :current_grader, String, "the name of the most recent grader for this submission.Example: Grader Name", required: false
        argument :grade_matches_current_submission, Boolean, "boolean indicating whether the grade is equal to the current submission grade.Example: true", required: false
        argument :graded_at, LMSGraphQL::Types::DateTimeType, "time stamp for the grading of this version of the submission.Example: 2013-01-31T18:16:31Z", required: false
        argument :grader, String, "the name of the user who graded this version of the submission.Example: Grader Name", required: false
        argument :grader_id, ID, "the user id of the user who graded this version of the submission.Example: 67379", required: false
        argument :id, ID, "the id of the submission of which this is a version.Example: 11607", required: false
        argument :new_grade, String, "the updated grade provided in this version of the submission.Example: 100", required: false
        argument :new_graded_at, LMSGraphQL::Types::DateTimeType, "the timestamp for the grading of this version of the submission (alias for graded_at).Example: 2013-01-31T18:16:31Z", required: false
        argument :new_grader, String, "alias for 'grader'.Example: Grader Name", required: false
        argument :previous_grade, String, "the grade for the submission version immediately preceding this one.Example: 90", required: false
        argument :previous_graded_at, LMSGraphQL::Types::DateTimeType, "the timestamp for the grading of the submission version immediately preceding this one.Example: 2013-01-29T12:12:12Z", required: false
        argument :previous_grader, String, "the name of the grader who graded the version of this submission immediately preceding this one.Example: Graded on submission", required: false
        argument :score, Int, "the score for this version of the submission.Example: 100", required: false
        argument :user_name, String, "the name of the student who created this submission.Example: student@example.com", required: false
        argument :submission_type, String, "the type of submission.Example: online", required: false
        argument :url, String, "the url of the submission, if there is one.", required: false
        argument :user_id, ID, "the user ID of the student who created this submission.Example: 67376", required: false
        argument :workflow_state, String, "the state of the submission at this version.Example: unsubmitted", required: false

      end
    end
  end
end