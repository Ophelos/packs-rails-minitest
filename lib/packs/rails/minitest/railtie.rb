require "active_support/ordered_options"
require "rails/railtie"

module Packs
  module Rails
    module Minitest
      class Railtie < ::Rails::Railtie
        config.packs_rails_minitest = ::ActiveSupport::OrderedOptions.new
        config.packs_rails_minitest.override_tasks = false

        rake_tasks do
          load "tasks/packs/test.rake"
        end
      end
    end
  end
end
