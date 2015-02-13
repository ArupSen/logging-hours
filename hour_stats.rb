# This simple script is to process a text file with space separated values.
# Each line has a list of hour counts represented as floats with 15 minute increments.
# Possible values 0 6.0 4.25 2.75 1.5
# Five values - Cycling, Entertainment, Programming, Reading, Yoga
# Object - show totals as follows:
# Weekly, Monthly, Total so far
#
class Hours
  def initialize
    @hours = []
    @cycling = 0
    @entertainment = 0
    @programming = 0
    @reading = 0
    @yoga = 0
  end
  def add_hours hours
    @hours.push(hours)
  end
  def sum_hours
    @hours.each do |row|
      @cycling += row[0].to_f
      @entertainment += row[1].to_f
      @programming += row[2].to_f
      @reading += row[3].to_f
      @yoga += row[4].to_f
    end
  end
  def print_hours
    puts "Cycling: \t #@cycling \t hours"
    puts "Entertainment: \t #@entertainment \t hours"
    puts "Programming: \t #@programming \t hours"
    puts "Reading: \t #@reading \t hours"
    puts "Yoga Practice: \t #@yoga \t hours"
  end
end

my_hours = Hours.new

File.open(ARGV[0]).each_line do |line|
  my_hours.add_hours line.split(" ")
end
my_hours.sum_hours
my_hours.print_hours
