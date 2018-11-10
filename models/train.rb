class Train
  attr_reader :speed, :amount_vgns,:number, :type

  def initialize(number, type, amount_vgns)
    @number = number
    @type = type
    @amount_vgns = amount_vgns
    @speed = 0
  end

  def speed_up(number)
    @speed += number if number > 0
  end

  def stop
    @speed = 0
  end

  def add_vagon
    @amount_vgns += 1 if @speed == 0
  end

  def drop_vagon
    @amount_vgns -= 1 if @speed == 0 && @amount_vgns > 0
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

  private

  def less?
    @position < @route.stations.size - 1
  end
end
