require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasGradeInput < BaseInputObject
        description "Enrollments. API Docs: https://canvas.instructure.com/doc/api/enrollments.html"
        argument :html_url, String, "The URL to the Canvas web UI page for the user's grades, if this is a student enrollment..", required: false
        argument :current_grade, String, "The user's current grade in the class. Only included if user has permissions to view this grade..", required: false
        argument :final_grade, String, "The user's final grade for the class. Only included if user has permissions to view this grade..", required: false
        argument :current_score, String, "The user's current score in the class. Only included if user has permissions to view this score..", required: false
        argument :final_score, String, "The user's final score for the class. Only included if user has permissions to view this score..", required: false
        argument :unposted_current_grade, String, "The user's current grade in the class including muted/unposted assignments. Only included if user has permissions to view this grade, typically teachers, TAs, and admins..", required: false
        argument :unposted_final_grade, String, "The user's final grade for the class including muted/unposted assignments. Only included if user has permissions to view this grade, typically teachers, TAs, and admins...", required: false
        argument :unposted_current_score, String, "The user's current score in the class including muted/unposted assignments. Only included if user has permissions to view this score, typically teachers, TAs, and admins...", required: false
        argument :unposted_final_score, String, "The user's final score for the class including muted/unposted assignments. Only included if user has permissions to view this score, typically teachers, TAs, and admins...", required: false

      end
    end
  end
end