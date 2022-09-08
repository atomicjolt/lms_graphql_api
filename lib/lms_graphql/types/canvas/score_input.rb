require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasScoreInput < BaseInputObject
          description "Score. API Docs: https://canvas.instructure.com/doc/api/score.html"
        argument :user_id, String, "The lti_user_id or the Canvas user_id.Example: 50 | 'abcasdf'", required: false
        argument :score_given, Float, "The Current score received in the tool for this line item and user, scaled to the scoreMaximum.Example: 50", required: false
        argument :score_maximum, Float, "Maximum possible score for this result; it must be present if scoreGiven is present..Example: 50", required: false
        argument :comment, String, "Comment visible to the student about this score..", required: false
        argument :timestamp, String, "Date and time when the score was modified in the tool. Should use subsecond precision..Example: 2017-04-16T18:54:36.736+00:00", required: false
        argument :activity_progress, String, "Indicate to Canvas the status of the user towards the activity's completion. Must be one of Initialized, Started, InProgress, Submitted, Completed.Example: Completed", required: false
        argument :grading_progress, String, "Indicate to Canvas the status of the grading process. A value of PendingManual will require intervention by a grader. Values of NotReady, Failed, and Pending will cause the scoreGiven to be ignored. FullyGraded values will require no action. Possible values are NotReady, Failed, Pending, PendingManual, FullyGraded.Example: FullyGraded", required: false

      end
    end
  end
end