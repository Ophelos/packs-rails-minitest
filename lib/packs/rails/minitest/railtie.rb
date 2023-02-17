require "rails/railtie"

module Packs
  module Rails
    module Minitest
      class Railtie < ::Rails::Railtie
        rake_tasks do
          load "tasks/packs/test.rake"
        end
      end
    end
  end
end
