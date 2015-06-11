class Person
  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{@name}"
  end

end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
      puts "Everything in Ruby is an object"
  end
end


instructor_1 = Instructor.new("Chris")
instructor_1.greeting

student_1 = Student.new("Cristina")
student_1.greeting