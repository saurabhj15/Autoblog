# ********************  File: testfunctions.rb  ********************
#
# author: Saurabh Jaiswal; 3/19/2016
# this file contains helper functions
#
# ********************  File: testfunctions.rb  ********************
require "optparse"
require "selenium-webdriver"
require 'fileutils'

$ARGUMENTS = {};
 
@rfilename = "saurabhtestresults.log"
@delimiter = "|"
   
 
  
def current_number_lines
    
  if File.file?(@rfilename)
    file=File.open(@rfilename,"r")
    return file.readlines.size
  else
    return 0
  end
end


def getBrowser (browser_type=:browser_type)
  case browser_type
  when 'firefox'
    puts "browser: " + browser_type
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['browser.cache.offline.enable'] = false
    profile['network.http.use-cache'] = false
    myDriver = Selenium::WebDriver.for :firefox, :profile => profile
  when 'chrome'
    puts "browser: " + browser_type
    #profile = Selenium::WebDriver::Chrome::Profile.new
    myDriver = Selenium::WebDriver.for :chrome
    #myDriver = Selenium::WebDriver.for :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate]
  when 'safari'
      puts "browser: " + browser_type
      myDriver = Selenium::WebDriver.for :safari 
  else
    puts "browser: " + browser_type
    puts "this is unknown or not yet implemented browser type => exiting"
    exit
  end
  return myDriver
end

#function to logon to url
def login (url, browser_type=:browser_type)

  type_of_browser = browser_type
  mydriver = getBrowser type_of_browser
  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  mydriver.get(url)
  wait = nil
  return mydriver

end

#parses command line argument
begin
  optparse = OptionParser.new do |opts|
    opts.banner = "Automated Testing"
  
    opts.on("-s n", "--server n") do |server|
      $ARGUMENTS[:server] = server
    end
  
    opts.on("-b n", "--browser", "Browser") do |browser|
      $ARGUMENTS[:browser] = browser
    end

  end

  optparse.parse!

  if ($ARGUMENTS[:server].nil?)
    puts "Missing required argument - server"
    exit
  end

  if ($ARGUMENTS[:browser].nil?)
    puts "Missing required argument - browser"
    exit
  end

rescue => e
  puts "Problem during start up:"
  puts e.message
  report("Parsing command line arguments", "Suite", "Fail", e.message)
end


def setup
  
    puts "Parameters passed in the test:"
    puts "Server:  " + $ARGUMENTS[:server] 
    puts "Browser:  " + $ARGUMENTS[:browser]
    puts "*"
 
    driver = login $ARGUMENTS[:server], $ARGUMENTS[:browser]
    
    #Make the screen full size
    driver.manage.window.maximize
  
    # instantiate wait object
    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    wait = nil
  return driver
    
end

#delete oldlog file
def deleteOldLogFile
  File.delete(@rfilename) if File.exist?(@rfilename)
end

def report(test_name, test_method, test_status, test_message)
  
  next_line_number = current_number_lines + 1
  File.open(@rfilename, 'a') { |f|
    final_result_string = next_line_number.to_s + @delimiter +
      Time.now.strftime("%m-%d-%y_%H:%M:%S") + @delimiter +
      test_name + "  (" + $0 + ")" + @delimiter +
      test_method + @delimiter +
      test_status + @delimiter +
      test_message
    f.puts final_result_string
  }
end



