require './Person.rb'
require './Student.rb'
require './Teacher.rb'


p1 = Person.new(17)

p1.age
p1.can_use_services?


s1 = Student.new(age = 19,'Maths')
puts s1.age


t1 = Teacher.new(17, 'Jake', 'Carpenter')
t1.can_use_services?
