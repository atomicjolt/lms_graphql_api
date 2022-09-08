require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizSubmissionInput < BaseInputObject
          description "Quiz Submissions. API Docs: https://canvas.instructure.com/doc/api/quiz_submissions.html"
        argument :id, ID, "The ID of the quiz submission..Example: 1", required: false
        argument :quiz_id, ID, "The ID of the Quiz the quiz submission belongs to..Example: 2", required: false
        argument :user_id, ID, "The ID of the Student that made the quiz submission..Example: 3", required: false
        argument :submission_id, ID, "The ID of the Submission the quiz submission represents..Example: 1", required: false
        argument :started_at, String, "The time at which the student started the quiz submission..Example: 2013-11-07T13:16:18Z", required: false
        argument :finished_at, String, "The time at which the student submitted the quiz submission..Example: 2013-11-07T13:16:18Z", required: false
        argument :end_at, String, "The time at which the quiz submission will be overdue, and be flagged as a late submission..Example: 2013-11-07T13:16:18Z", required: false
        argument :attempt, Int, "For quizzes that allow multiple attempts, this field specifies the quiz submission attempt number..Example: 3", required: false
        argument :extra_attempts, Int, "Number of times the student was allowed to re-take the quiz over the multiple-attempt limit..Example: 1", required: false
        argument :extra_time, Int, "Amount of extra time allowed for the quiz submission, in minutes..Example: 60", required: false
        argument :manually_unlocked, Boolean, "The student can take the quiz even if it's locked for everyone else.Example: true", required: false
        argument :time_spent, Int, "Amount of time spent, in seconds..Example: 300", required: false
        argument :score, Int, "The score of the quiz submission, if graded..Example: 3", required: false
        argument :score_before_regrade, Int, "The original score of the quiz submission prior to any re-grading..Example: 2", required: false
        argument :kept_score, Int, "For quizzes that allow multiple attempts, this is the score that will be used, which might be the score of the latest, or the highest, quiz submission..Example: 5", required: false
        argument :fudge_points, Int, "Number of points the quiz submission's score was fudged by..Example: 1", required: false
        argument :has_seen_results, Boolean, "Whether the student has viewed their results to the quiz..Example: true", required: false
        argument :workflow_state, String, "The current state of the quiz submission. Possible values: ['untaken'|'pending_review'|'complete'|'settings_only'|'preview']..Example: untaken", required: false
        argument :overdue_and_needs_submission, Boolean, "Indicates whether the quiz submission is overdue and needs submission.Example: false", required: false

      end
    end
  end
end