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

  private

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
i.create_cargo_train
i.create_pass_train
