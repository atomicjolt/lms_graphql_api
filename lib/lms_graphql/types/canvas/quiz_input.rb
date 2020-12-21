require_relative "../canvas_base_input_type"
require_relative "lock_info"
require_relative "quiz_permission"
require_relative "assignment_date"

module LMSGraphQL
  module Types
    module Canvas
        class QuizQuizTypeEnum < ::GraphQL::Schema::Enum
          value "practice_quiz"
          value "assignment"
          value "graded_survey"
          value "survey"
        end

                class QuizHideResultEnum < ::GraphQL::Schema::Enum
          value "always"
          value "until_after_last_attempt"
        end

                class QuizScoringPolicyEnum < ::GraphQL::Schema::Enum
          value "keep_highest"
          value "keep_latest"
        end
      class CanvasQuizInput < BaseInputObject
        description "Quizzes. API Docs: https://canvas.instructure.com/doc/api/quizzes.html"
      	argument :id, ID, "the ID of the quiz.Example: 5", required: false
      	argument :title, String, "the title of the quiz.Example: Hamlet Act 3 Quiz", required: false
      	argument :html_url, String, "the HTTP/HTTPS URL to the quiz.Example: http://canvas.example.edu/courses/1/quizzes/2", required: false
      	argument :mobile_url, String, "a url suitable for loading the quiz in a mobile webview.  it will persiste the headless session and, for quizzes in public courses, will force the user to login.Example: http://canvas.example.edu/courses/1/quizzes/2?persist_healdess=1&force_user=1", required: false
      	argument :preview_url, String, "A url that can be visited in the browser with a POST request to preview a quiz as the teacher. Only present when the user may grade.Example: http://canvas.example.edu/courses/1/quizzes/2/take?preview=1", required: false
      	argument :description, String, "the description of the quiz.Example: This is a quiz on Act 3 of Hamlet", required: false
      	argument :quiz_type, QuizQuizTypeEnum, "type of quiz possible values: 'practice_quiz', 'assignment', 'graded_survey', 'survey'.Example: assignment", required: false
      	argument :assignment_group_id, ID, "the ID of the quiz's assignment group:.Example: 3", required: false
      	argument :time_limit, Int, "quiz time limit in minutes.Example: 5", required: false
      	argument :shuffle_answers, Boolean, "shuffle answers for students?.", required: false
      	argument :hide_results, QuizHideResultEnum, "let students see their quiz responses? possible values: null, 'always', 'until_after_last_attempt'.Example: always", required: false
      	argument :show_correct_answers, Boolean, "show which answers were correct when results are shown? only valid if hide_results=null.Example: true", required: false
      	argument :show_correct_answers_last_attempt, Boolean, "restrict the show_correct_answers option above to apply only to the last submitted attempt of a quiz that allows multiple attempts. only valid if show_correct_answers=true and allowed_attempts > 1.Example: true", required: false
      	argument :show_correct_answers_at, LMSGraphQL::Types::DateTimeType, "when should the correct answers be visible by students? only valid if show_correct_answers=true.Example: 2013-01-23T23:59:00-07:00", required: false
      	argument :hide_correct_answers_at, LMSGraphQL::Types::DateTimeType, "prevent the students from seeing correct answers after the specified date has passed. only valid if show_correct_answers=true.Example: 2013-01-23T23:59:00-07:00", required: false
      	argument :one_time_results, Boolean, "prevent the students from seeing their results more than once (right after they submit the quiz).Example: true", required: false
      	argument :scoring_policy, QuizScoringPolicyEnum, "which quiz score to keep (only if allowed_attempts != 1) possible values: 'keep_highest', 'keep_latest'.Example: keep_highest", required: false
      	argument :allowed_attempts, Int, "how many times a student can take the quiz -1 = unlimited attempts.Example: 3", required: false
      	argument :one_question_at_a_time, Boolean, "show one question at a time?.", required: false
      	argument :question_count, Int, "the number of questions in the quiz.Example: 12", required: false
      	argument :points_possible, Int, "The total point value given to the quiz.Example: 20", required: false
      	argument :cant_go_back, Boolean, "lock questions after answering? only valid if one_question_at_a_time=true.", required: false
      	argument :access_code, String, "access code to restrict quiz access.Example: 2beornot2be", required: false
      	argument :ip_filter, String, "IP address or range that quiz access is limited to.Example: 123.123.123.123", required: false
      	argument :due_at, LMSGraphQL::Types::DateTimeType, "when the quiz is due.Example: 2013-01-23T23:59:00-07:00", required: false
      	argument :lock_at, LMSGraphQL::Types::DateTimeType, "when to lock the quiz.", required: false
      	argument :unlock_at, LMSGraphQL::Types::DateTimeType, "when to unlock the quiz.Example: 2013-01-21T23:59:00-07:00", required: false
      	argument :published, Boolean, "whether the quiz has a published or unpublished draft state..Example: true", required: false
      	argument :unpublishable, Boolean, "Whether the assignment's 'published' state can be changed to false. Will be false if there are student submissions for the quiz..Example: true", required: false
      	argument :locked_for_user, Boolean, "Whether or not this is locked for the user..", required: false
      	argument :lock_info, LMSGraphQL::Types::Canvas::CanvasLockInfoInput, "(Optional) Information for the user about the lock. Present when locked_for_user is true..", required: false
      	argument :lock_explanation, String, "(Optional) An explanation of why this is locked for the user. Present when locked_for_user is true..Example: This quiz is locked until September 1 at 12:00am", required: false
      	argument :speedgrader_url, String, "Link to Speed Grader for this quiz. Will not be present if quiz is unpublished.Example: http://canvas.instructure.com/courses/1/speed_grader?assignment_id=1", required: false
      	argument :quiz_extensions_url, String, "Link to endpoint to send extensions for this quiz..Example: http://canvas.instructure.com/courses/1/quizzes/2/quiz_extensions", required: false
      	argument :permissions, LMSGraphQL::Types::Canvas::CanvasQuizPermissionInput, "Permissions the user has for the quiz.", required: false
      	argument :all_dates, [LMSGraphQL::Types::Canvas::CanvasAssignmentDateInput], "list of due dates for the quiz.", required: false
      	argument :version_number, Int, "Current version number of the quiz.Example: 3", required: false
      	argument :question_types, String, "List of question types in the quiz.Example: multiple_choice, essay", required: false
      	argument :anonymous_submissions, Boolean, "Whether survey submissions will be kept anonymous (only applicable to 'graded_survey', 'survey' quiz types).", required: false

      end
    end
  end
end