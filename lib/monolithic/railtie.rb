module Monolithic
  class Railtie < ::Rails::Railtie
    railtie_name :monolithic

    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob(File.join(path, "tasks", "*.rake")).each do |file|
        load file
      end
    end
  end
end
