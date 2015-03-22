class Van
  DEFAULT_CAPACITY = 10
  attr_writer :capacity
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def take_bike(bike)
    fail 'No Space Available' if @bikes.length >= DEFAULT_CAPACITY
    # @bikes << bike unless
    # nil unless bike.broken?
    bikes << bike if bike.broken?
  end
end
