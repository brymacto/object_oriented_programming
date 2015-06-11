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

instructor_1.teach
# student_1.teach
# Calling the teach method on the student doesn't work because although it shares the
# parent class Person with Instructor, Instructor's teach method is outside its scope
# as it's not in the parent.