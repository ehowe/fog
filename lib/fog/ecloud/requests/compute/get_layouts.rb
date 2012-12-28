module Fog
  module Compute
    class Ecloud
      class Real
        basic_request :get_layouts
      end

      class Mock
        def get_layouts
          layout = self.data[:layouts].values.first

          p layout
        end
      end
    end
  end
end
