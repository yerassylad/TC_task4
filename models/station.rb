class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains.push(train)
  end

  def get_pass_trains
    @trains.select { |train| train.type == "pass"}
  end

  def get_cargo_trains
    @trains.select { |train| train.type == "cargo"}
  end

  def send_train(train)
    @trains.delete(train)
  end

  def to_s
    "Станция '#{@name}'"
  end
end
