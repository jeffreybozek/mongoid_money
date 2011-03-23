module Mongoid
  module Extensions
    module Money
      module Conversions
        def set(value)
          return nil if value.blank?
          begin
            value.cents
          rescue
            value
          end
        end
        def get(value)
          return nil if value.blank?
          begin
            self.new_from_cents value
          rescue
            nil
          end
        end
      end
    end
  end
end