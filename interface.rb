require_relative 'main.rb'

class Interface
  def initialize
    @main = Main.new
  end



  def create_station
    puts "Вы создаете Новую станцию. Введите название станции"
    name = gets.chomp
    @main.create_station(name)
    show_stations
  end

  def create_route
    puts "Вы создаете Новый маршрут"
    puts "Выберите начальную станцию"
    show_stations
    first = @main.select_station(gets.chomp.to_i)
    puts "Выберите конечную станцию"
    show_stations
    last = @main.select_station(gets.chomp.to_i)
    @main.create_route(first, last)
    show_routes
  end

  def add_station_to_route
    puts "Вы добавляете станцию к маршруту. Выберите маршрут для управления"
    show_routes
    route = @main.select_route(gets.chomp.to_i)
    puts "Выберте станцию для добавления"
    show_stations
    station = @main.select_station(gets.chomp.to_i)
    route.add_station(station)
    show_routes
  end

  def delete_station_from_route
    puts "Вы удаляете станцию из маршрута. Выберите маршрут для управления"
    show_routes
    route = @main.select_route(gets.chomp.to_i)
    puts "Выберте станцию для удаления"
    show_stations
    station = @main.select_station(gets.chomp.to_i)
    route.delete_station(station)
    show_routes
  end

  def create_cargo_train
    puts "Вы создаете новый грузовой поезд"
    puts "Введите номер поезда"
    number = gets.chomp
    @main.create_train_cargo(number)
    show_trains
  end

  def create_pass_train
    puts "Вы создаете новый пассажирский поезд. Введите номер поезда"
    number = gets.chomp
    @main.create_train_pass(number)
    show_trains
  end

  def add_route_to_train
    puts "Вы добавляете маршрут поезду. Выберите поезд"
    show_trains
    train = @main.select_train(gets.chomp.to_i)
    puts "Выберите маршрут"
    show_routes
    route = @main.select_route(gets.chomp.to_i)
    train.accept_route(route)
    show_trains
  end

  def create_cargo_vagon
    puts "Вы создаете новый грузовой вагон"
    puts "Введите номер вагона"
    number = gets.chomp
    @main.create_vagon_cargo(number)
    show_vagons
  end

  def create_pass_vagon
    puts "Вы создаете новый пассажирский вагон. Введите номер вагона"
    number = gets.chomp
    @main.create_vagon_pass(number)
    show_vagons
  end

  def add_vagon_to_train
    puts "Вы добавляете вагон к поезду. выберите поезд"
    show_trains
    train = @main.select_train(gets.chomp.to_i)
    puts "Выберите вагон"
    show_vagons
    vagon = @main.select_vagon(gets.chomp.to_i)
    train.add_vagon(vagon)
    show_trains
  end

  def delete_vagon_from_train
    puts "Вы удаляете вагон от поезду. выберите поезд"
    show_trains
    train = @main.select_train(gets.chomp.to_i)
    puts "Выберите вагон"
    show_vagons
    vagon = @main.select_vagon(gets.chomp.to_i)
    train.drop_vagon(vagon)
    show_trains
  end

  def mv_forward
    puts "Вы перемещаете поезд вперед. Выберите поезд"
    show_trains
    train = @main.select_train(gets.chomp.to_i)
    puts train.current_station
    train.forward
    puts train.current_station
  end

  def mv_revers
    puts "Вы перемещаете поезд назад. Выберите поезд"
    show_trains
    train = @main.select_train(gets.chomp.to_i)
    puts train.current_station
    train.revers
    puts train.current_station
  end

  def add_train_to_station
    puts "Вы добавляете поезд на станциюю Выберите станцию"
    show_stations
    station = @main.select_station(gets.chomp.to_i)
    puts "Выберите поезд"
    show_trains
    train = @main.select_train(gets.chomp.to_i)
    station.take_train(train)
    show_stations
  end

  def show_trains_on_station
    puts "Выберите станцию"
    show_stations
    station = @main.select_station(gets.chomp.to_i)
    station.trains.each { |train| puts train }
  end

  def show_menu
    puts "1 Создавать станции"
    puts "2 Создавать поезда"
    puts "3 Создавать маршруты и управлять станциями в нем (добавлять, удалять)"
    puts "4 Назначать маршрут поезду"
    puts "5 Добавлять вагоны к поезду"
    puts "6 Отцеплять вагоны от поезда"
    puts "7 Перемещать поезд по маршруту вперед и назад"
    puts "8 Просматривать список станций и список поездов на станции"
  end

  def show_stations
    stations = @main.stations

    puts "--- Список станций ---"
    if stations.empty?
      puts "Список пуст"
    else
      stations.each_with_index { |station, index| puts "#{index}: #{station}" }
    end
  end

  def show_routes
    routes = @main.routes
    
    puts "--- Список маршрутов ---"
    if routes.empty?
      puts "Список пуст"
    else
      routes.each_with_index { |route, index| puts "#{index}: #{route}" }
    end
  end

  def show_vagons
    vagons = @main.vagons

    puts "--- Список вагонов ---"
    if vagons.empty?
      puts "Список пуст"
    else
      vagons.each_with_index { |vagon, index| puts "#{index}: #{vagon}" }
    end
  end

  def show_trains
    trains = @main.trains

    puts "--- Список поездов ---"
    if trains.empty?
      puts "Список пуст"
    else
      trains.each_with_index { |train, index| puts "#{index}: #{train}" }
    end
  end
end

i = Interface.new
i.add_train_to_station
i.add_train_to_station
i.show_trains_on_station
