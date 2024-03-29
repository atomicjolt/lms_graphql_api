require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasErrorReportInput < BaseInputObject
          description "Error Reports. API Docs: https://canvas.instructure.com/doc/api/error_reports.html"
        argument :subject, String, "The users problem summary, like an email subject line.Example: File upload breaking", required: false
        argument :comments, String, "long form documentation of what was witnessed.Example: When I went to upload a .mov file to my files page, I got an error.  Retrying didn't help, other file types seem ok", required: false
        argument :user_perceived_severity, String, "categorization of how bad the user thinks the problem is.  Should be one of [just_a_comment, not_urgent, workaround_possible, blocks_what_i_need_to_do, extreme_critical_emergency]..Example: just_a_comment", required: false
        argument :email, String, "the email address of the reporting user.Example: name@example.com", required: false
        argument :url, String, "URL of the page on which the error was reported.Example: https://canvas.instructure.com/courses/1", required: false
        argument :context_asset_string, String, "string describing the asset being interacted with at the time of error.  Formatted '[type]_[id]'.Example: user_1", required: false
        argument :user_roles, String, "comma seperated list of roles the reporting user holds.  Can be one [student], or many [teacher,admin].Example: user,teacher,admin", required: false

      end
    end
  end
end