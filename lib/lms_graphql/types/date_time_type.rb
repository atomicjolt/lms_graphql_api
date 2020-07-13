module LMSGraphQL
  module Types
    class DateTimeType < ::GraphQL::Schema::Scalar
      name "DateTime"

      def self.coerce_input(value, _ctx)
        Time.zone.parse(value)
      end

      def self.coerce_result(value, _ctx)
        if value.is_a? String
          value = Time.zone.parse(value)
        end
        value.utc.iso8601
      end
    end
  end
end
