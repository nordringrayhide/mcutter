require "thor"
require "fileutils"
require "mcutter/core_ext/misc"

module MCutter
  class CLI < Thor
    include Thor::Actions
    include FileUtils

    default_task :cut
    # class_option "no-color", :type => :boolean, :banner => "Disable colorization in output"
    # class_option "verbose",  :type => :boolean, :banner => "Enable verbose output mode", :aliases => "-V"

    desc "cut", "Cut source files"
    def cut
      open('timeline.txt').each do |line|
        file, starts_seconds, ends_seconds, ofile = *line.split(" ", 4)
        duration_seconds = (ends_seconds.to_sec - starts_seconds.to_sec).to_hh_mm_ss
        run "ffmpeg -i #{file} -threads 3 -y -vcodec copy -ss #{starts_seconds} -t #{duration_seconds} #{ofile}"
      end
    end

    desc "init", "Create timeline file & directories"
    def init
      mkdir_p "src"
      mkdir_p "out"
      touch "timeline.txt"
    end

    private

    def setup
      MCutter.setup
    end

    def method_missing(name, *args)
      $stderr.puts 'Could not find command "%s".' % name; exit 1
    end
  end
end
