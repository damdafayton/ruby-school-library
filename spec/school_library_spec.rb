require_relative '../classes/decorator'
require_relative '../classes/book'
require_relative '../classes/person'
require_relative '../classes/student'
require_relative '../classes/teacher'
require_relative '../classes/classroom'
require_relative '../classes/rental'

describe Decorator do
  before(:example) do
    class1 = 'some-class'
    allow(class1).to receive(:correct_name).and_return('bob marley')
    @instance1 = Decorator.new(class1)
  end

  it 'has method correct_name' do
    expect(@instance1).to respond_to(:correct_name)
  end

  it 'should return the name when correct_name method is applied' do
    expect(@instance1.correct_name).to eq('bob marley')
  end

  it 'should return name in capitaled letter' do
    instance2 = CapitalizeDecorator.new(@instance1)
    expect(instance2.correct_name).to eq('Bob marley')
  end

  it 'should trim name to max 8 letters' do
    instance2 = TrimmerDecorator.new(@instance1)
    expect(instance2.correct_name).to eq('bob marl')
  end
end

describe Book do
  it 'should initialize' do
    book1 = Book.new('new book', 'good writer')
    expect(book1.title).to eq('new book')
  end
end

describe Person do
  it 'should initialize' do
    instance1 = Person.new(20, 'Bob')
    expect(instance1.age).to eq(20)
  end
end

describe Student do
  it 'should initialize' do
    student1 = Student.new(25, 'Jake')
    expect(student1.age).to eq(25)
  end

  it 'should have false parent_permission' do
    instance1 = Student.new(25, 'Jake', parent_permission: false)
    expect(instance1.parent_permission).to be(false)
  end
end

describe Teacher do
  it 'should initialize successfully' do
    instance1 = Teacher.new(33, 'Dan', 'Maths')
    expect(instance1.specialization).to eq('Maths')
  end
end

describe Classroom do
  it 'should initialize classroom with empty student lis' do
    instance1 = Classroom.new('Grammar')
    expect(instance1.students).to eq([])
  end
end

describe Rental do
  it 'should have date property after initialization' do
    instance1 = Rental.new(nil, nil)
    p instance1
    expect(instance1).to respond_to(:date)
  end
end
