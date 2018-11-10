require_relative  'models/train_cargo.rb'
require_relative  'models/train_pass.rb'
require_relative  'models/vagon_cargo.rb'
require_relative  'models/vagon_pass.rb'
require_relative  'models/station.rb'
require_relative  'models/route.rb'


class Main
  attr_reader :stations, :trains, :routes, :vagons

  def initialize
    @stations = [Station.new("111"), Station.new("222")]
    @trains = [CargoTrain.new("tcargo"), PassangerTrain.new("tpass")]
    @routes = [Route.new(Station.new("111"), Station.new("222")), Route.new(Station.new("333"), Station.new("444"))]
    @vagons = [CargoVagon.new("ccc"), PassangerVagon.new("ppp")]
  end

  def create_station(name)
    @stations.push(Station.new(name))
  end

  def create_route(first, last)
    @routes.push(Route.new(first, last))
  end

  def create_train_cargo(number)
    @trains.push(CargoTrain.new(number))
  end

  def create_train_pass(number)
    @trains.push(PassangerTrain.new(number))
  end

  def create_vagon_cargo(number)
    @vagons.push(CargoVagon.new(number))
  end

  def create_vagon_pass(number)
    @vagons.push(PassangerVagon.new(number))
  end

  def select_station(index)
    @stations[index]
  end

  def select_train(index)
    @trains[index]
  end

  def select_route(index)
    @routes[index]
  end

  def select_vagon(index)
    @vagons[index]
  end
end
