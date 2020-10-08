class NameSpace::CounterComponent < ViewComponentReflex::Component
  def initialize
    @counter ||= 0
  end

  def increment
    @counter += 1
  end
end
