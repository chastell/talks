!SLIDE commandline incremental transition=scrollLeft
# one does not simply…
    $ fantastic --help
    Usage: fantastic [options] conference
    Options:
      --location, -l <s>:   Conference location
              --help, -h:   Show this message

    $ fantastic --location Müggelsee eurucamp
    eurucamp at Müggelsee is fantastic! \o/

!SLIDE
# actually, one does.

!SLIDE
# `bin/fantastic`
    @@@Ruby
    #!/usr/bin/env ruby














     

!SLIDE
# `bin/fantastic`
    @@@Ruby
    #!/usr/bin/env ruby
    require_relative '../lib/fantastic/executable'













     

!SLIDE
# `bin/fantastic`
    @@@Ruby
    #!/usr/bin/env ruby
    require_relative '../lib/fantastic/executable'
    Fantastic::Executable.new(ARGV).run












     

!SLIDE transition=scrollLeft
# `lib/fantastic/executable.rb`
    @@@Ruby


    module Fantastic class Executable









      def run
        puts "#{@conf} at #{@opts[:location]} is fantastic! \\o/"
      end
    end end

!SLIDE
# `lib/fantastic/executable.rb`
    @@@Ruby


    module Fantastic class Executable
      def initialize args






      end

      def run
        puts "#{@conf} at #{@opts[:location]} is fantastic! \\o/"
      end
    end end

!SLIDE
# `lib/fantastic/executable.rb`
    @@@Ruby
    require 'trollop'

    module Fantastic class Executable
      def initialize args
        @opts = Trollop.options args do


          opt :location, 'Conference location', type: String
        end

      end

      def run
        puts "#{@conf} at #{@opts[:location]} is fantastic! \\o/"
      end
    end end

!SLIDE
# `lib/fantastic/executable.rb`
    @@@Ruby
    require 'trollop'

    module Fantastic class Executable
      def initialize args
        @opts = Trollop.options args do
          banner 'Usage: fantastic [options] conference'
          banner 'Options:'
          opt :location, 'Conference location', type: String
        end

      end

      def run
        puts "#{@conf} at #{@opts[:location]} is fantastic! \\o/"
      end
    end end

!SLIDE
# `lib/fantastic/executable.rb`
    @@@Ruby
    require 'trollop'

    module Fantastic class Executable
      def initialize args
        @opts = Trollop.options args do
          banner 'Usage: fantastic [options] conference'
          banner 'Options:'
          opt :location, 'Conference location', type: String
        end
        @conf = args.first
      end

      def run
        puts "#{@conf} at #{@opts[:location]} is fantastic! \\o/"
      end
    end end
