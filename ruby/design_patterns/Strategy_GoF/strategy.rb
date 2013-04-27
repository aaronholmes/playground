class Report 
	attr_accessor :formatter
	attr_reader :title, :text
	def initialize(formatter)
		@title = 'Monthly Report'
    @text =  ['Things are going', 'really, really well.']
		@formatter = formatter
	end

	def output_report
		@formatter.output_report(self)
	end

end

class HTMLFormatter

	def output_report(context)
		puts('<html>')
    puts('  <head>')
    # Output The rest of the report ...
    puts("    <title>#{context.title}</title>")
    puts('  </head>')
    puts('  <body>')
    context.text.each do |line|
      puts("    <p>#{line}</p>")
    end
    puts('  </body>')
    puts('</html>')
	end

end

class PlainFormatter
	def output_report(context)
    puts("**** #{context.title} ****")
    context.text.each do |line|
      puts(line)
    end
	end
end