module Eversign
	module Models
	    class Field
            include ActiveModel::Validations

            attr_accessor :name, :type, :x, :y, :width, :height, :page, :signer, :identifier, :required, :readonly, :merge,
    		    					:validation_type, :text_style, :text_font, :text_size, :text_color, :value, :options, :group

            VALIDATION_TYPES_OPTIONS = %w(letters_only numbers_only email_address)
            FONTS_OPTIONS = %w(arial calibri courier_new helvetica georgia times_new_roman)
            STYLE_OPTIONS = %w(B U I)

            validates :validation_type, allow_blank: true, inclusion: { in: VALIDATION_TYPES_OPTIONS }
            validates :text_font, allow_blank: true, inclusion: { in: FONTS_OPTIONS }
            validate :style_validation

            def style_validation
                return unless text_style
                text_style.split('').each do |letter| 
                    errors.add(:text_style, 'Invalid Value') unless STYLE_OPTIONS.include? letter
                end
            end
	    end

        class SignatureField < Field 
            def initialize
                @type = 'signature'
            end
        end
        
        class InitialsField < Field
            def initialize
                @type = 'initials'
            end
        end

        class DateSignedField < Field
            def initialize
                @type = 'date_signed'
            end
        end

        class NoteField < Field
            def initialize
                @type = 'note'
            end
        end

        class TextField < Field
            def initialize
                @type = 'text'
            end
        end

        class CheckboxField < Field
            def initialize
                @type = 'checkbox'
            end
        end

        class RadioField < Field
            def initialize
                @type = 'radio'
            end
        end

        class DropdownField < Field
            def initialize
                @type = 'dropdown'
            end
        end

        class AttachmentField < Field
            def initialize
                @type = 'attachment'
            end
        end
    end
end
