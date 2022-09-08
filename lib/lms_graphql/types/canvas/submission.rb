require_relative "../canvas_base_type"
require_relative "assignment"
require_relative "course"
require_relative "submission_comment"
require_relative "user"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasSubmission < BaseType
          class SubmissionSubmissionTypeEnum < ::GraphQL::Schema::Enum
          value "online_text_entry"
          value "online_url"
          value "online_upload"
          value "media_recording"
          value "student_annotation"
        end

                class SubmissionWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "graded"
          value "submitted"
          value "unsubmitted"
          value "pending_review"
        end

                class SubmissionReadStatusEnum < ::GraphQL::Schema::Enum
          value "read"
          value "unread"
        end
        description "Submissions. API Docs: https://canvas.instructure.com/doc/api/submissions.html"
        field :assignment_id, ID, "The submission's assignment id.Example: 23", null: true
        field :assignment, LMSGraphQL::Types::Canvas::CanvasAssignment, "The submission's assignment (see the assignments API) (optional).", null: true
        field :course, LMSGraphQL::Types::Canvas::CanvasCourse, "The submission's course (see the course API) (optional).", null: true
        field :attempt, Int, "This is the submission attempt number..Example: 1", null: true
        field :body, String, "The content of the submission, if it was submitted directly in a text field..Example: There are three factors too.", null: true
        field :grade, String, "The grade for the submission, translated into the assignment grading scheme (so a letter grade, for example)..Example: A-", null: true
        field :grade_matches_current_submission, Boolean, "A boolean flag which is false if the student has re-submitted since the submission was last graded..Example: true", null: true
        field :html_url, String, "URL to the submission. This will require the user to log in..Example: http://example.com/courses/255/assignments/543/submissions/134", null: true
        field :preview_url, String, "URL to the submission preview. This will require the user to log in..Example: http://example.com/courses/255/assignments/543/submissions/134?preview=1", null: true
        field :score, Float, "The raw score.Example: 13.5", null: true
        field :submission_comments, [LMSGraphQL::Types::Canvas::CanvasSubmissionComment], "Associated comments for a submission (optional).", null: true
        field :submission_type, SubmissionSubmissionTypeEnum, "The types of submission ex: ('online_text_entry'|'online_url'|'online_upload'|'media_recording'|'student_annotation').Example: online_text_entry", null: true
        field :submitted_at, LMSGraphQL::Types::DateTimeType, "The timestamp when the assignment was submitted.Example: 2012-01-01T01:00:00Z", null: true
        field :url, String, "The URL of the submission (for 'online_url' submissions)..", null: true
        field :user_id, ID, "The id of the user who created the submission.Example: 134", null: true
        field :grader_id, ID, "The id of the user who graded the submission. This will be null for submissions that haven't been graded yet. It will be a positive number if a real user has graded the submission and a negative number if the submission was graded by a process (e.g. Quiz autograder and autograding LTI tools).  Specifically autograded quizzes set grader_id to the negative of the quiz id.  Submissions autograded by LTI tools set grader_id to the negative of the tool id..Example: 86", null: true
        field :graded_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-01-02T03:05:34Z", null: true
        field :user, LMSGraphQL::Types::Canvas::CanvasUser, "The submissions user (see user API) (optional).", null: true
        field :late, Boolean, "Whether the submission was made after the applicable due date.", null: true
        field :assignment_visible, Boolean, "Whether the assignment is visible to the user who submitted the assignment. Submissions where `assignment_visible` is false no longer count towards the student's grade and the assignment can no longer be accessed by the student. `assignment_visible` becomes false for submissions that do not have a grade and whose assignment is no longer assigned to the student's section..Example: true", null: true
        field :excused, Boolean, "Whether the assignment is excused.  Excused assignments have no impact on a user's grade..Example: true", null: true
        field :missing, Boolean, "Whether the assignment is missing..Example: true", null: true
        field :late_policy_status, String, "The status of the submission in relation to the late policy. Can be late, missing, extended, none, or null..Example: missing", null: true
        field :points_deducted, Float, "The amount of points automatically deducted from the score by the missing/late policy for a late or missing assignment..Example: 12.3", null: true
        field :seconds_late, Float, "The amount of time, in seconds, that an submission is late by..Example: 300", null: true
        field :workflow_state, SubmissionWorkflowStateEnum, "The current state of the submission.Example: submitted", null: true
        field :extra_attempts, Float, "Extra submission attempts allowed for the given user and assignment..Example: 10", null: true
        field :anonymous_id, ID, "A unique short ID identifying this submission without reference to the owning user. Only included if the caller has administrator access for the current account..Example: acJ4Q", null: true
        field :posted_at, LMSGraphQL::Types::DateTimeType, "The date this submission was posted to the student, or nil if it has not been posted..Example: 2020-01-02T11:10:30Z", null: true
        field :read_status, SubmissionReadStatusEnum, "The read status of this submission for the given user (optional). Including read_status will mark submission(s) as read..Example: read", null: true
        field :redo_request, Boolean, "This indicates whether the submission has been reassigned by the instructor..Example: true", null: true

      end
    end
  end
end