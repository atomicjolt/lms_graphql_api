require_relative "../canvas_base_input_type"
require_relative "submission_comment"

module LMSGraphQL
  module Types
    module Canvas
        class SubmissionSubmissionTypeEnum < ::GraphQL::Schema::Enum
          value "online_text_entry"
          value "online_url"
          value "online_upload"
          value "media_recording"
        end

                class SubmissionWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "graded"
          value "submitted"
          value "unsubmitted"
          value "pending_review"
        end
      class CanvasSubmissionInput < BaseInputObject
        description "Submissions. API Docs: https://canvas.instructure.com/doc/api/submissions.html"
        argument :assignment_id, ID, "The submission's assignment id.Example: 23", required: false
        argument :assignment, String, "The submission's assignment (see the assignments API) (optional).Example: Assignment", required: false
        argument :course, String, "The submission's course (see the course API) (optional).Example: Course", required: false
        argument :attempt, Int, "This is the submission attempt number..Example: 1", required: false
        argument :body, String, "The content of the submission, if it was submitted directly in a text field..Example: There are three factors too.", required: false
        argument :grade, String, "The grade for the submission, translated into the assignment grading scheme (so a letter grade, for example)..Example: A-", required: false
        argument :grade_matches_current_submission, Boolean, "A boolean flag which is false if the student has re-submitted since the submission was last graded..Example: true", required: false
        argument :html_url, String, "URL to the submission. This will require the user to log in..Example: http://example.com/courses/255/assignments/543/submissions/134", required: false
        argument :preview_url, String, "URL to the submission preview. This will require the user to log in..Example: http://example.com/courses/255/assignments/543/submissions/134?preview=1", required: false
        argument :score, Float, "The raw score.Example: 13.5", required: false
        argument :submission_comments, [LMSGraphQL::Types::Canvas::CanvasSubmissionCommentInput], "Associated comments for a submission (optional).", required: false
        argument :submission_type, SubmissionSubmissionTypeEnum, "The types of submission ex: ('online_text_entry'|'online_url'|'online_upload'|'media_recording').Example: online_text_entry", required: false
        argument :submitted_at, LMSGraphQL::Types::DateTimeType, "The timestamp when the assignment was submitted.Example: 2012-01-01T01:00:00Z", required: false
        argument :url, String, "The URL of the submission (for 'online_url' submissions)..", required: false
        argument :user_id, ID, "The id of the user who created the submission.Example: 134", required: false
        argument :grader_id, ID, "The id of the user who graded the submission. This will be null for submissions that haven't been graded yet. It will be a positive number if a real user has graded the submission and a negative number if the submission was graded by a process (e.g. Quiz autograder and autograding LTI tools).  Specifically autograded quizzes set grader_id to the negative of the quiz id.  Submissions autograded by LTI tools set grader_id to the negative of the tool id..Example: 86", required: false
        argument :graded_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-01-02T03:05:34Z", required: false
        argument :user, String, "The submissions user (see user API) (optional).Example: User", required: false
        argument :late, Boolean, "Whether the submission was made after the applicable due date.", required: false
        argument :assignment_visible, Boolean, "Whether the assignment is visible to the user who submitted the assignment. Submissions where `assignment_visible` is false no longer count towards the student's grade and the assignment can no longer be accessed by the student. `assignment_visible` becomes false for submissions that do not have a grade and whose assignment is no longer assigned to the student's section..Example: true", required: false
        argument :excused, Boolean, "Whether the assignment is excused.  Excused assignments have no impact on a user's grade..Example: true", required: false
        argument :missing, Boolean, "Whether the assignment is missing..Example: true", required: false
        argument :late_policy_status, String, "The status of the submission in relation to the late policy. Can be late, missing, none, or null..Example: missing", required: false
        argument :points_deducted, Float, "The amount of points automatically deducted from the score by the missing/late policy for a late or missing assignment..Example: 12.3", required: false
        argument :seconds_late, Float, "The amount of time, in seconds, that an submission is late by..Example: 300", required: false
        argument :workflow_state, SubmissionWorkflowStateEnum, "The current state of the submission.Example: submitted", required: false

      end
    end
  end
end