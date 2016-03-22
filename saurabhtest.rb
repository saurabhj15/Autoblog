# ********************  File: saurabhtest.rb  ********************
#
# author: Saurabh Jaiswal; 3/19/2016
# example usage:  ruby saurabhtest.rb -s https://autoblog.truecar.com -b firefox 
#
# ********************  File: saurabhtest.rb  ********************

require './testfunctions'

# ==========   main   ==========

def main
  
  begin
      
      #deleting old log file
      deleteOldLogFile
      
      #setting up the driver , logging on to auto blog url
      $driver = setup
      
      $wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      puts "*"
      report("Auto blog quick test","Navigating to link" ,  "Passed", "Successfully navigated to auto blog url")

      #navigate to random car type
      goToCarRandomCarType()
      #navigate to lincoln and MKS model
      goToLincolnCarType()
      
      
 rescue => e
      puts "test failed - " + e.message
      report("Auto blog quick test", "Suite", "Failed", e.message)
  end

  # exit
  destroy

end

def goToCarRandomCarType ()

  begin
    
      puts "In goToCarRandomCarType"
    
      #locate make
      makeSelector = $driver.find_element(:id, "s2id_home_select_make")
      sleep 1
      makeSelector.click
      
      #define random numbers for make and model
      randomnumber = rand(1..42)
      randomnumber2 = rand(1..2)
    
      #select random make
      findRandomMake = $driver.find_element(:xpath, "//*[@id=\"select2-drop\"]/ul/li[#{randomnumber}]")
      sleep 1
      findRandomMake.click
    
      #locate model
      modelSelector = $driver.find_element(:id, "s2id_home_select_model")
      sleep 1
      modelSelector.click
    
      #select random model
      findRandomModel = $driver.find_element(:xpath, "//*[@id=\"select2-drop\"]/ul/li[1]/ul/li[#{randomnumber2}]")
      sleep 1
      findRandomModel.click
     
    
      #set zip to zzzzz
      findZip = $driver.find_element(:xpath, "//*[@id=\"home_zip\"]")
      sleep 1
      findZip.clear
      findZip.send_keys "zzzzz"
          
      #press go button      
      submitGo = $driver.find_element(:id, "home_cta")
      sleep 1
      submitGo.click
          
          
      $wait.until {$driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text }
      titleReports = $driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text 
      puts titleReports
      #check for oops
      puts (titleReports == "Oops!") ? "Passed" : "Failed"
      (titleReports == "Oops!") ? report("zip test with random make", "zzzzz", "passed", "expected") : report("zip test with random make", "zzzzz", "failed", "not expected")
          
      #click close button
      $wait.until {$driver.find_element(:xpath , "//*[@id=\"simplemodal-data\"]/div[3]/button")}
      sleep 3
      closeButton = $driver.find_element(:xpath , "//*[@id=\"simplemodal-data\"]/div[3]/button")
      closeButton.click
  
      #test for 99999
      sleep 1
      findZip.clear
      findZip.send_keys "99999"
      sleep 1
      submitGo.click


      $wait.until {$driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text }
      titleReports = $driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text 
      puts titleReports
      puts (titleReports == "Oops!") ? "Passed" : "Failed"
      (titleReports == "Oops!") ? report("zip test with random make", "99999", "passed", "expected") : report("zip test with random make", "99999", "failed", "not expected")

          
      #$wait.until {$driver.find_element(:xpath , "//*[@id=\"simplemodal-data\"]/div[3]/button")}
      sleep 3
      #close = $driver.find_element(:xpath , "//*[@id=\"simplemodal-data\"]/div[3]/button")
      closeButton.click
      
      #test for special characters !@*&%
      sleep 1
      findZip.clear
      findZip.send_keys "!@*&%"
      sleep 1
      submitGo.click


      $wait.until {$driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text }
      titleReports = $driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text 
      puts titleReports
      puts (titleReports == "Oops!") ? "Passed" : "Failed"
      (titleReports == "Oops!") ? report("zip test with random make", "!@*&%", "passed", "expected") : report("zip test with random make", "!@*&%", "failed", "not expected")
    
      sleep 3
      closeButton.click
      
      #test for empty zip
      sleep 1
      findZip.clear
      findZip.send_keys ""
      sleep 1
      submitGo.click


      $wait.until {$driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text }
      titleReports = $driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text 
      puts titleReports
      puts (titleReports == "Oops!") ? "Passed" : "Failed"
      (titleReports == "Oops!") ? report("zip test with random make", "empty", "passed", "expected") : report("zip test with random make", "empty", "failed", "not expected")
    
      sleep 3
      closeButton.click
      
      report("Test suite", "goToCarRandomCarType", "passed", "All tests passed") 


    rescue => e
      puts "In goToCarRandomCarType"
      puts e.message
      report("Test suite", "goToCarRandomCarType", "failed", e.message) 
      raise "Navigating to Radom car type failed - " + e.message
    end

end

def goToLincolnCarType ()

  begin
    
      puts "In goToLincolnCarType"
      #locate make
      makeSelector = $driver.find_element(:id, "s2id_home_select_make")
      sleep 1
      makeSelector.click
         
     
      #select licoln make
      findLincolnMake = $driver.find_element(:xpath, "//*[@id=\"select2-drop\"]/ul/li[25]")
      sleep 1
      findLincolnMake.click
        
      #locate model
      modelSelector = $driver.find_element(:id, "s2id_home_select_model")
      sleep 1
      modelSelector.click
        
      #select MKS model
      findMKSModel = $driver.find_element(:xpath, "//*[@id=\"select2-drop\"]/ul/li[1]/ul/li[2]")
      sleep 1
      findMKSModel.click
         
        
      #set zip to zzzzz
      findZip = $driver.find_element(:xpath, "//*[@id=\"home_zip\"]")
      sleep 1
      findZip.clear
      findZip.send_keys "zzzzz"
              
      #press go button      
      submitGo = $driver.find_element(:id, "home_cta")
      sleep 1
      submitGo.click
              
              
      $wait.until {$driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text }
      titleReports = $driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text 
      puts titleReports
      #check for oops
      puts (titleReports == "Oops!") ? "Passed" : "Failed"
      (titleReports == "Oops!") ? report("zip test with Lincoln make", "zzzzz", "passed", "expected") : report("zip test with Lincoln make", "zzzzz", "failed", "not expected")
              
      #click close button
      $wait.until {$driver.find_element(:xpath , "//*[@id=\"simplemodal-data\"]/div[3]/button")}
      sleep 3
      closeButton = $driver.find_element(:xpath , "//*[@id=\"simplemodal-data\"]/div[3]/button")
      closeButton.click
      
      #test for 99999
      sleep 1
      findZip.clear
      findZip.send_keys "99999"
      sleep 1
      submitGo.click
    
    
      $wait.until {$driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text }
      titleReports = $driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text 
      puts titleReports
      puts (titleReports == "Oops!") ? "Passed" : "Failed"
      (titleReports == "Oops!") ? report("zip test with Lincoln make", "99999", "passed", "expected") : report("zip test with Lincoln make", "99999", "failed", "not expected")
    
              
      sleep 3
      closeButton.click
      
      #test for special characters !@*&%
      sleep 1
      findZip.clear
      findZip.send_keys "!@*&%"
      sleep 1
      submitGo.click


      $wait.until {$driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text }
      titleReports = $driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text 
      puts titleReports
      puts (titleReports == "Oops!") ? "Passed" : "Failed"
      (titleReports == "Oops!") ? report("zip test with Lincoln make", "!@*&%", "passed", "expected") : report("zip test with Lincoln make", "!@*&%", "failed", "not expected")
    
      sleep 3
      closeButton.click
      
      #test for empty zip
      sleep 1
      findZip.clear
      findZip.send_keys ""
      sleep 1
      submitGo.click


      $wait.until {$driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text }
      titleReports = $driver.find_element(:xpath, "//*[@id=\"simplemodal-data\"]/div[1]/span").text 
      puts titleReports
      puts (titleReports == "Oops!") ? "Passed" : "Failed"
      (titleReports == "Oops!") ? report("zip test with Lincoln make", "empty", "passed", "expected") : report("zip test with Lincoln make", "empty", "failed", "not expected")
    
      sleep 3
      closeButton.click
      
      #use a valid zip code
      sleep 1
      findZip.clear
      findZip.send_keys "90245"
      sleep 1
      submitGo.click
      
      sleep 2
      
      finalcheck = $driver.find_element(:class, "clearfix")
      report("Test suite", "goToLincolnCarType", "All tests passed", "expected")
         
    rescue => e
      puts "In goToLincolnCarType"
      puts e.message
      report("Test suite", "goToLincolnCarType", "failed", e.message) 
      raise "Navigating to lincoln car type failed - " + e.message
    end

end

def destroy ()

  sleep 1
  puts "Closing browser"
  puts "Releasing resources"
  puts "Exiting script"
  puts "*"
  $driver.close

  $wait = nil
  $driver = nil

end


if __FILE__ == $0
    main
end
