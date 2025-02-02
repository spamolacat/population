class Analytics

  attr_accessor :options

  def initialize(areas)
    @areas = areas
    set_options
  end 

  def set_options
    @options = []
    @options << {menu_id: 1, menu_title: 'Areas count', method: :how_many}
    @options << {menu_id: 2, menu_title: 'Smallest Population (non 0)', method: :smallest_pop}
    @options << {menu_id: 3, menu_title: 'Largest Population', method: :largest_pop}
    @options << {menu_id: 4, menu_title: 'How many zips in California?', method: :california_zips}
    @options << {menu_id: 5, menu_title: 'Information for a given zip', method: :zip_info}
    @options << {menu_id: 6, menu_title: 'Exit', method: :exit}
  end

  def run(num)
    opt = @options.select {|o| o[:menu_id] == num }.first
    if opt.nil?
      print "Invalid Choice!"
    elsif opt[:method] != :exit
      self.send opt[:method]
      :done
    else
      opt[:method]
    end
  end

  def how_many
    puts "The number of areas is: #{@areas.length}"
  end

  def smallest_pop
    
    sorted = @areas.sort do |x, y|
      #puts x
      x.estimated_population <=> y.estimated_population
    end
    
    smallest = sorted.drop_while { |i| i.estimated_population == 0 }.first
    puts "#{smallest.city}, #{smallest.state} has the smallest population of #{smallest.estimated_population}"

  end

def largest_pop
    
    sorted = @areas.sort do |x,y|
      x.estimated_population <=> y.estimated_population
    end
    #puts sorted.reverse.drop_while { |i| i.estimated_population == 0 }
    largest = sorted.reverse.drop_while { |i| i.estimated_population == 0 }.first
    print "#{largest.city}, #{largest.state} has the largest population of #{largest.estimated_population}"

  end

  def california_zips
  
    count = @areas.count { |a| a.state == "CA"} 
    print "There are #{count} zip codes in California"   

  end

  def zip_info

    print "Enter a zipcode: "
    zip = gets.strip.to_i
    zips = @areas.select { |a| a.zipcode == zip }
    unless zips.empty?
      print " "
      zips.each { |z| puts z}
    else
      puts "Zipcode not found!"
    end
  end

end
