#
# A sample Ruby File to show why we use GitHub to view code
#
#

class MyClass

  def initialize(args)
    @name = args[:name]
  end
  
  def say_hi
    print "Hello, my name is: #{@name}"
  end
  
  def say_bye
    print "Goodbye!"
  end
  
end

if __FILE__ == $0

  myclass = MyClass.new( name: "Jennings" )
  
  myclass.say_hi
  
  myclass.say_bye
  
end
