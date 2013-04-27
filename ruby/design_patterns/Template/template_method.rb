class Report
	def initialize
		@title = "Monthly Report"
		@text = ['Things are going', 'really, really well.']
	end

	# Control the base functionality, call hook methods
	def output_report
		output_start
		output_head
		@text.each do |line|
			output_line line
		end
		output_end
	end

	# Hook methods that can be filled in by subclasses
	def output_start
	end

	def output_head
	end

	def output_body_start
	end

	def output_line(line)
		raise 'Called abstract method: output_line'
	end

	def output_body_end
	end

	def output_end
	end
end

class PlainTextReport < Report
	def output_head
		puts("**** #{@title} ****")
    puts
	end

	def output_line(line)
    puts(line)
	end
end

class HTMLReport < Report
	def output_start
    puts('<html>')
  end

  def output_head
    puts('  <head>')
    puts("    <title>#{@title}</title>")
    puts('  </head>')
	end

  def output_body_start
    puts('<body>')
	end
	
	def output_line(line)
		puts("  <p>#{line}</p>")
	end

	def output_body_end
    puts('</body>')
	end

  def output_end
    puts('</html>')
	end
end

# Test our stuff
#report = PlainTextReport.new
#report.output_report

#report = HTMLReport.new
#report.output_report