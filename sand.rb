class Zombie
  # # Class Variables
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  # # Instance Variables
  def initialize
    @strength = rand(10)
    # # Zombie Strength min/max
    if @strength > @@max_strength
      @strength = @@default_strength
    end

    @speed = rand(7)
    # # Zombie Speed min/max
    if @speed > @@max_speed
      @speed = @@default_speed
    end
  end

  # # Class Methods

  # # # Class Readers & Info Methods
  def self.horde
    @@horde
  end

  def self.plague_level
    @@plague_level
  end

  def self.horde_size
    Zombie.horde.count
  end

  def self.infection
    puts "There are #{Zombie.horde_size} zombies."
    puts "This is your horde:"
    puts "#{Zombie.horde}"
    puts "Your plague level is #{Zombie.plague_level}"
  end

  def self.max_speed
    @@max_speed
  end

  def self.max_strength
    @@max_strength
  end

  # # # Basic Class Methods
  def self.new_zombie
    zombie = Zombie.new
    @@horde << zombie
    return zombie
  end

  def self.spawn
    zombies_spawned = (Zombie.plague_level / (rand(7) + 1))
    zombies_spawned.times do
      Zombie.new_zombie
    end
  end

  def self.increase_plague_level
    plague_growth = rand(Zombie.plague_level)
    @@plague_level += plague_growth
  end

  def self.some_die_off
    death_toll = rand(11)
    if death_toll > 0
      death_toll.times do
        Zombie.horde.delete_at(rand(Zombie.horde_size))
      end
    end
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
  end

  def self.random_zombie
    return Zombie.horde.sample
  end

  # # Instance Methods

  def outrun_zombie?
    human_speed = rand(Zombie.max_speed)
    human_speed > @speed
  end

  def survive_attack?
    human_speed = rand(Zombie.max_strength)
    human_speed > @strength
  end

  def encounter
    if !outrun_zombie?
      if !survive_attack?
        puts "You died."
        Zombie.new_zombie
      else
        puts "You fought off the zombie!"
        self.kill_zombie
      end
    else
      puts "You escaped!!"
    end
  end

  def kill_zombie
    Zombie.horde.delete(self)
  end

end

zombie = Zombie.new_zombie
puts Zombie.horde.inspect
zombie.encounter
puts Zombie.horde.inspect
# puts Zombie.horde.inspect
# Zombie.random_zombie.encounter
# puts Zombie.horde.inspect
