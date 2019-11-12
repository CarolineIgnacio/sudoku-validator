class Person

  def initialize(name, age)
    @name = name
    @age = age
    @trainee = []
  end

  def name
    @name
  end

  def age
    @age
  end

  def name=(name)
    @name = name
  end

  def age=(age)
    @age
  end

  def count
    @trainee.length
  end

  def old?
    return true if @age > 50

    false
  end


  def meeting
    return p "Hi, nice to meet you! My name is #{@name}" if @name != nil 
  end

end






