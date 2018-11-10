class Train
  attr_reader :speed, :vagons, :number, :type

  def initialize(number)
    @number = number
    @vagons = []
    @speed = 0
  end

  def speed_up(number)
    @speed += number if number > 0
  end

  def stop
    @speed = 0
  end

  def add_vagon(vagon)
    @vagons.push(vagon) if @speed == 0 && vagon.type == @type
  end

  def drop_vagon(vagon)
    @vagons.delete(vagon) if @speed == 0
  end

  def accept_route(route)
    @route = route
    @position = 0
  end

  def forward
    @position += 1 if less?
  end

  def revers
    @position -= 1 if @position > 0
  end

  def current_station
    @route.stations[@position]
  end

  def previous_station
    @route.stations[@position - 1] if @position > 0
  end

  def next_station
    @route.stations[@position + 1] if less?
  end

  protected

  def less?
    @position < @route.stations.size - 1
  end
end
