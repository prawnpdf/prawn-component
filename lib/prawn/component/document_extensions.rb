module Prawn
  module Component
    module DocumentExtensions
      def data_source(name)
        define_singleton_method(name) do
          @data_source ||= {}
          @data_source[name] ||= yield
        end
      end

      # consider adding support for padding
      # and if we ever allow dynamic rendering, margins
      def draw(component, params={})
        if Symbol === component
          component = Prawn::Component.definitions[component]
        end

        box = params.delete(:box)
        border = params.delete(:border)

        if box.nil?
          component.new(self, params).draw
          stroke_bounds if border
        elsif box.kind_of?(Prawn::Document::GridBox) # FIXME: Massive duplication + explicit type check
          box.bounding_box do
            bounds.define_singleton_method(:move_past_bottom) do
              raise Prawn::Errors::CannotFit
            end

            component.new(self, params).draw
            stroke_bounds if border
          end
        else
          left, top, width, height = box

          top  = top >= 0 ? bounds.top - top : top*-1
          left = left >= 0 ? left : bounds.right - left*-1

          bounding_box([left, top], :width => width, :height => height) do
            bounds.define_singleton_method(:move_past_bottom) do
              raise Prawn::Errors::CannotFit
            end

            component.new(self, params).draw
            stroke_bounds if border
          end
        end
      end
    end
  end
end
