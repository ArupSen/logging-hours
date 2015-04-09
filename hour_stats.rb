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
    # the inner array element will hold totals for each month
    @cycling = [0, []]
    @entertainment = [0, []]
    @programming = [0, []]
    @reading = [0, []]
    @yoga = [0, []]
    @month_nums = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 31, 31]
    @day_ranges = [31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 335, 366]
    @month = []
  end

  # used only to fill the @hours array for new objects
  def add_hours hours
    @hours << hours
  end

  # creates a grand total for the whole year
  # could the method be more generic and also sum a month?
  def sum_hours
    @hours.each do |row|
      @cycling[0] += row[0].to_f
      @entertainment[0] += row[1].to_f
      @programming[0] += row[2].to_f
      @reading[0] += row[3].to_f
      @yoga[0] += row[4].to_f
    end
  end

  # create an array for a particular month
  # probably better to use the upto method and loop through the @day_ranges
  def fill_month range
    # reset array to empty first
    @month = []
    range.times do |num|
      @month.push(@hours[num])
    end
  end

  def print_hours
    puts ""
    puts "TOTALS FOR THE YEAR (hours)"
    puts "--------------------"
    puts "Cycling: \t #{@cycling[0]}"
    puts "Entertainment: \t #{@entertainment[0]}"
    puts "Programming: \t #{@programming[0]}"
    puts "Reading: \t #{@reading[0]}"
    puts "Yoga Practice: \t #{@yoga[0]}"
    puts ""
  end

  # just used to test that the @month array is being filled
  def print_month
    @month.each do |row|
    print row
    end
  end
end

my_hours = Hours.new

File.open(ARGV[0]).each_line do |line|
  my_hours.add_hours line.split(" ")
end
my_hours.sum_hours
my_hours.print_hours
my_hours.fill_month 30
my_hours.print_month
