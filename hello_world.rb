class GreetingFactory
	def self.create_greeting(greeting_type)
		greeting = nil
		case greeting_type
		when "helloworld"
			greeting = HelloWorldGreeting.new.retrieve_greeting
		when "hellohuman"
			greeting = HelloHumanGreeting.new.retrieve_greeting
		else
			greeting = Greeting.new(greeting_type).retrieve_greeting
		end
		greeting
	end
		
	class Greeting
		def initialize(phrase)
			@greeting = Proc.new do
				"#{phrase}"
			end
		end
		
		def retrieve_greeting
			@greeting
		end
	end

	class HelloWorldGreeting < Greeting
		def initialize
			super("Hello World")
		end
	end

	class HelloHumanGreeting < Greeting
		def initialize
			super("Hello Hoomon")
		end
	end
end

puts GreetingFactory.create_greeting("helloworld").call
puts GreetingFactory.create_greeting("hellohuman").call
puts GreetingFactory.create_greeting("I don't know you at all...").call
