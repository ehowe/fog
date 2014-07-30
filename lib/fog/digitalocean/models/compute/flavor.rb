require 'fog/core/model'

module Fog
  module Compute
    class DigitalOcean
      class Flavor < Fog::Model
        identity  :id
        attribute :name
        attribute :memory, type: :integer
        attribute :cpu,    type: :integer
        attribute :disk
        attribute :cost_per_month
        attribute :cost_per_hour
      end
    end
  end
end
