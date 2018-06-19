require_relative "../canvas_base_input_type"
require_relative "quiz_statistics_question_statistic"
require_relative "quiz_statistics_submission_statistic"
require_relative "quiz_statistics_link"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizStatisticInput < BaseInputObject
        description "Quiz Statistics. API Docs: https://canvas.instructure.com/doc/api/quiz_statistics.html"
        argument :id, ID, "The ID of the quiz statistics report..Example: 1", required: false
        argument :quiz_id, ID, "The ID of the Quiz the statistics report is for. 
NOTE: AVAILABLE ONLY IN NON-JSON-API REQUESTS..Example: 2", required: false
        argument :multiple_attempts_exist, Boolean, "Whether there are any students that have made mutliple submissions for this quiz..Example: true", required: false
        argument :includes_all_versions, Boolean, "In the presence of multiple attempts, this field describes whether the statistics describe all the submission attempts and not only the latest ones..Example: true", required: false
        argument :generated_at, LMSGraphQL::Types::DateTimeType, "The time at which the statistics were generated, which is usually after the occurrence of a quiz event, like a student submitting it..Example: 2013-01-23T23:59:00-07:00", required: false
        argument :url, String, "The API HTTP/HTTPS URL to this quiz statistics..Example: http://canvas.example.edu/api/v1/courses/1/quizzes/2/statistics", required: false
        argument :html_url, String, "The HTTP/HTTPS URL to the page where the statistics can be seen visually..Example: http://canvas.example.edu/courses/1/quizzes/2/statistics", required: false
        argument :question_statistics, LMSGraphQL::Types::Canvas::CanvasQuizStatisticsQuestionStatisticInput, "Question-specific statistics for each question and its answers..", required: false
        argument :submission_statistics, LMSGraphQL::Types::Canvas::CanvasQuizStatisticsSubmissionStatisticInput, "Question-specific statistics for each question and its answers..", required: false
        argument :links, LMSGraphQL::Types::Canvas::CanvasQuizStatisticsLinkInput, "JSON-API construct that contains links to media related to this quiz statistics object. 
NOTE: AVAILABLE ONLY IN JSON-API REQUESTS..", required: false

      end
    end
  end
end