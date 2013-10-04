require_relative 'lib/setup'
require_relative 'lib/analytics'

class Population
  attr_accessor :analytics
  

  def initialize
    areas = Setup.new().areas
    @analytics = Analytics.new(areas)
  end

  def menu
    system 'clear'
    puts "Population Menu"
    puts "---------------"
    @analytics.options.each do |option|
      puts "#{option[:menu_id]}. #{option[:menu_title]}"    
    end
  end
################################
  def run
    stop = false

    while (stop != :exit) do
      self.menu
      print "Choice: "
      choice = gets.strip.to_i
      stop = @analytics.run(choice)
      if stop == :exit
        print "Exiting"
      else
        print "\nPress Enter"
        gets
      end

    end

  end
###############################
end

p = Population.new
p.run

