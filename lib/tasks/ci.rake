require "ansi"

module Monolithic
  module RakeHelpers
    module CI
      def self.print_start_msg(suite)
        puts \
          ANSI.magenta <<~MSG

            #{"-" * 40}
            Testing #{suite}
            #{"-" * 40}
          MSG
      end

      def self.run(gem_dir, database: false)
        print_start_msg(gem_dir)
      end
    end
  end
end

namespace :monolithic do
  namespace :ci do
    desc "Run all tests in CI mode"
    task :all do
      %i[gems engines].each do |task_name|
        next_task = Rake::Task["monolithic:test:#{task_name}"]
        next_task.reenable
        next_task.invoke
      end
    end

    desc "Run all tests in CI mode for gems"
    task gems: :environment do
      Dir["gems/*"].each { |path| test_gem_run(path) }
    end

    desc "Run all tests in CI mode for engines"
    task engines: :environment do
      Dir["engines/*"].each { |path| test_engine_run(path) }
    end
  end
end
