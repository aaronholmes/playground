require 'test/unit'
require 'stringio'
require_relative 'strategy'

class StrategyTest < Test::Unit::TestCase
	def setup
		@html_report = Report.new(HTMLFormatter.new)
		@plain_report = Report.new(PlainFormatter.new)
	end

	def test_html_output
		output = capture_stdout { @html_report.output_report }
		assert(output.empty? == false)
		assert_equal("<html>\n  <head>\n    <title>Monthly Report</title>\n  </head>\n  <body>\n    <p>Things are going</p>\n    <p>really, really well.</p>\n  </body>\n</html>\n", output)
	end

	def test_plain_output
		output = capture_stdout { @plain_report.output_report }
		assert(output.empty? == false)
		assert_equal("**** Monthly Report ****\nThings are going\nreally, really well.\n", output)
	end

	def capture_stdout(&block)
    original_stdout = $stdout
    $stdout = fake = StringIO.new
    begin
      yield
    ensure
      $stdout = original_stdout
    end
   fake.string
  end
end