!SLIDE transition=scrollLeft
# `spec/fantastic/executable_spec.rb`
    @@@Ruby


    require 'minitest/autorun'
    require_relative '../../lib/fantastic/executable'

    module Fantastic describe Executable do









    end end

!SLIDE
# `spec/fantastic/executable_spec.rb`
    @@@Ruby


    require 'minitest/autorun'
    require_relative '../../lib/fantastic/executable'

    module Fantastic describe Executable do
      describe '#run' do
        it 'works as expected' do





        end
      end
    end end


!SLIDE
# `spec/fantastic/executable_spec.rb`
    @@@Ruby
    # encoding: UTF-8

    require 'minitest/autorun'
    require_relative '../../lib/fantastic/executable'

    module Fantastic describe Executable do
      describe '#run' do
        it 'works as expected' do

            Executable.new(['--location', 'Müggelsee', 'eurucamp']).run

          out.must_include 'eurucamp at Müggelsee is fantastic! \o/'

        end
      end
    end end


!SLIDE
# `spec/fantastic/executable_spec.rb`
    @@@Ruby
    # encoding: UTF-8

    require 'minitest/autorun'
    require_relative '../../lib/fantastic/executable'

    module Fantastic describe Executable do
      describe '#run' do
        it 'works as expected' do
          out      = capture_io do
            Executable.new(['--location', 'Müggelsee', 'eurucamp']).run
          end
          out.must_include 'eurucamp at Müggelsee is fantastic! \o/'

        end
      end
    end end

!SLIDE
# `spec/fantastic/executable_spec.rb`
    @@@Ruby
    # encoding: UTF-8

    require 'minitest/autorun'
    require_relative '../../lib/fantastic/executable'

    module Fantastic describe Executable do
      describe '#run' do
        it 'works as expected' do
          out, err = capture_io do
            Executable.new(['--location', 'Müggelsee', 'eurucamp']).run
          end
          out.must_include 'eurucamp at Müggelsee is fantastic! \o/'
          err.must_be :empty?
        end
      end
    end end
