module ActiveModel
  module Validations

    module ClassMethods

      def dont_validate(*attributes)
        defaults = attributes.extract_options!
        validations = defaults.slice!(*_validates_default_keys)
        validation_classes = validations.keys.map {|key| "#{key.to_s.camelize}Validator"}

        raise ArgumentError, "You need to supply at least one attribute" if attributes.empty?

        defaults.merge!(:attributes => attributes)

        symbolized_attributes = attributes.map(&:to_sym)

        _validators.each do |attribute, validators|

          validators.each do |validator|
            next if !validator.respond_to?(:attributes) or validator.attributes.empty?
            next unless validation_classes.empty? or validation_classes.include?(validator.class.to_s.demodulize)
            
            validator.attributes.reject! {|attr| symbolized_attributes.include?(attr.to_sym) }

            args = [validator, validator.options.dup]

            skip_callback(:validate, *args)
          end

          validators.reject! {|validator| validator.attributes.empty? }

          _validators.delete(attribute) if validators.empty?
        end

        true
      end
    end
  end
end