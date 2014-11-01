require 'json-schema/attribute'

module JSON
  class Schema
    class MinLengthAttribute < Attribute
      def self.validate(current_schema, data, fragments, processor, validator, options = {})
        return unless data.is_a?(String)

        min_length = current_schema.schema['minLength']
        if data.length < min_length
          message = "The property '#{build_fragment(fragments)}' was not of a minimum string length of #{min_length}"
          validation_error(processor, message, fragments, current_schema, self, options[:record_errors])
        end
      end
    end
  end
end
