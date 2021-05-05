require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasChangeRecordInput < BaseInputObject
          description "Blueprint Courses. API Docs: https://canvas.instructure.com/doc/api/blueprint_courses.html"
      argument :asset_id, ID, "The ID of the learning object that was changed in the blueprint course..Example: 2", required: false
      argument :asset_type, String, "The type of the learning object that was changed in the blueprint course.  One of 'assignment', 'attachment', 'discussion_topic', 'external_tool', 'quiz', 'wiki_page', 'syllabus', or 'settings'.  For 'syllabus' or 'settings', the asset_id is the course id..Example: assignment", required: false
      argument :asset_name, String, "The name of the learning object that was changed in the blueprint course..Example: Some Assignment", required: false
      argument :change_type, String, "The type of change; one of 'created', 'updated', 'deleted'.Example: created", required: false
      argument :html_url, String, "The URL of the changed object.Example: https://canvas.example.com/courses/101/assignments/2", required: false
      argument :locked, Boolean, "Whether the object is locked in the blueprint.", required: false
      argument :exceptions, String, "A list of ExceptionRecords for linked courses that did not receive this update..Example: {'course_id'=>101, 'conflicting_changes'=>['points']}", required: false

      end
    end
  end
end