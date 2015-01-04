# This simple script is to process a text file with space separated values.
# Each line has a list of hour counts represented as floats with 15 minute increments.
# Possible values 0 6.0 4.25 2.75 1.5
# Six values - Cycling, Entertainment, Programming, Reading, Yoga
# Object - show totals as follows:
# Weekly, Monthly, Total so far
#
class Hours
  def initialize
    @hours = []
  end
  def add_hours hours
    @hours.push(hours)
  end
end

my_hours = Hours.new

File.open(ARGV[0]).each_line do |line|
  my_hours.add_hours line.split(" ")
end
