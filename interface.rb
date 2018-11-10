require_relative 'main.rb'

class Interface
  def initialize
    @main = Main.new
  end

  def menu
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
i.show_trains
i.show_routes
i.show_stations
i.show_vagons
