require 'fog/ecloud/models/compute/environment'

module Fog
  module Compute
    class Ecloud

      class Environments < Fog::Ecloud::Collection

        model Fog::Compute::Ecloud::Environment

        undef_method :create

        identity :href

        def all
          environments = []
          data = connection.get_organization(href).body["Items"].select { |i| i["Locations"] }
          data.each do |item|
            item["Locations"].each do |l|
              l["Environments"].each { |e| environments << e }
            end
          end
          load(environments)
        end

        def get(uri)
          if data = connection.get_environment(uri)
            new(data.body)
          end
        rescue Fog::Errors::NotFound
          nil
        end

        Vdcs = Environments

      end
    end
  end
end
