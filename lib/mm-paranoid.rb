require 'mongo_mapper'

module MongoMapper
  module Plugins
    module Paranoid
      extend ActiveSupport::Concern

      included do
        key :deleted_at, Time, :index => true
      end

      module InstanceMethods
        def destroy
          run_callbacks(:destroy) do
            self.deleted_at = Time.now
            self.save
          end
        end
      end
    end
  end
end
