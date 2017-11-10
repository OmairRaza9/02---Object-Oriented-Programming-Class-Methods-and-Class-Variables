class Zombie

  @@horde = []
  @@plague_level = 10 #change over time
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3
  @strength

  def initialize(speed, strength)

    @speed = speed
    @strength = strength

    if @@max_speed < speed
      @@default_speed = speed
    end
    if @@max_strength < strength
      @@default_strength = strength
    end
  end

  # # Reader
  def self.max_strength
    @@max_strength
  end

  def self.max_speed
    @@max_speed
  end

  def self.plague_level
    @@plague_level
  end

  def self.default_strength
    @@default_strength
  end

  def encounter
    if outrun_zombie? == true
      puts "Phew, you outran the zombie"
    elsif survive_attack? == false
      nwe_zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde << new_zombie
      puts "you did not outrun the zoombie. You're now the walking dead for 9 seasons"
    end
  end

  def outrun_zombie?
    if @speed < rand(@@max_speed + 1)
      puts "Yes! You outran the zombie!"
      return false
    else
      return false
    end
  end

  def survive_attack?
     #strength=rand(@@max_strength+1)
     puts @strength
     puts @speed
    if @strength  > rand(@@max_strength )
      return true
    else
      return false
    end
  end

  def self.all
    @@horde
  end

  def new_day
    self.increase_plague_level
    self.spawn
    self.some_die_off
  end

  def self.some_die_off
    @@horde.pop(rand(11))
  end

  def self.spawn
    rand(@@plague_level).times do
      zombie_spawn = Zombie.new(rand(Zombie.max_speed), rand(Zombie.max_strength))
      @@horde << zombie_spawn
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(2)
  end

end

# omair = Zombie.new(rand(5), rand(8))
#  omair.survive_attack?
#  omair.outrun_zombie?


 # omair.inspect
#  puts '============='
#  puts "#{Zombie.all}Zombie array is empty"
#  Zombie.spawn
#  puts "*******Zombie just spawned******"
#  Zombie.all
#  puts "-----All Zombies Below-------"
#
#  all_zombies = Zombie.all
#  puts all_zombies



# def get_info
#   return "All zombies above"
# end

# info = get_info
#
#
#
#
# puts "--- #{info} ---"



puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
 puts zombie1.encounter # You are now a zombie
 puts zombie2.encounter # You died
# puts zombie3.encounter # You died
# Zombie.new_day
# puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
# zombie1 = Zombie.all[0]
# zombie2 = Zombie.all[1]
# zombie3 = Zombie.all[2]
# puts zombie1.encounter # You got away
# puts zombie2.encounter # You are now a zombie
# puts zombie3.encounter # You died
