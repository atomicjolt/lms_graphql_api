require_relative "../canvas_base_type"
require_relative "epub_export"

module LMSGraphQL
  module Types
    module Canvas
      class CourseEpubExport < BaseType
        description "ePub Exports. API Docs: https://canvas.instructure.com/doc/api/e_pub_exports.html"
        field :id, ID, "the unique identifier for the course.Example: 101", null: true
        field :name, String, "the name for the course.Example: Maths 101", null: true
        field :epub_export, LMSGraphQL::Types::Canvas::EpubExport, "ePub export API object.", null: true

      end
    end
  end
end