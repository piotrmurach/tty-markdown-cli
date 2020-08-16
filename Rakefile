# frozen_string_literal: true

require "kramdown"
require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc "Run all specs"
task ci: %w[ spec ]

namespace :man do
  MARKDOWN_FILES = "man/**/*.{md,mkd,mkdn,mdwn,mdown,markdown,text,txt}"

  markdowns = FileList[MARKDOWN_FILES]
  manpages = markdowns.pathmap("%X")

  markdowns.zip(manpages) do |markdown, manpage|
    file manpage => markdown do
      puts "Generating #{manpage.inspect} man page"
      File.open(manpage, "w") do |out|
        data = File.read(markdown)
        out.write(Kramdown::Document.new(data).to_man)
      end
    end
  end

  desc "Build the pastel man page"
  task :build => manpages

  desc "Clean up the man page"
  task :clean do
    manpages.each do |manpage|
      rm manpage if File.exist?(manpage)
    end
  end
end

Rake::Task["build"].enhance(%w[man:clean man:build])
