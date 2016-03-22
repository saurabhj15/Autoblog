--Installation and running:

I'm using ruby version - 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14] on mac os x ( I used ruby gems )

This project comes with 2 files:saurabhtest.rb ( main file ),testfunctions.rb ( helper functions )

To run the project execute place saurabhtest.rb and testfunctions.rb in the same location and execute the command:
ruby saurabhtest.rb -s https://autoblog.truecar.com -b firefox

where -s specifies the url to navigate to
and -b specifies the browser to invoke

Pre-requisites:
1.I have used selenium webdriver for this project.
2.I am using Ruby Watir framework 
3.I'm using optparse toparse command line arguments.
4. I'm using fileutils to be create log file.
5.This project is currently supported , tested with only firefox webdriver.
6.I have used xpath to navigate to web elements.


The project creates a log file called saurabhtestresults.log which maintains the results of the test run. ( This file gets overwritten everytime the test is run )

--Approach:

1.Navigate to  https://autoblog.truecar.com
2. Select random make and model.
3. test with invalid zip code zzzzz
4. test with invalid zip code 99999
5. test with invalid zip code !@*&%
6. test with empty zip code 
7. Select lincoln make , MKS model
8. test with invalid zip code zzzzz
9. test with invalid zip code 99999
10. test with invalid zip code !@*&%
10. test with empty zip code 
11. provide correct zip code "90245" < end of test >

--future enhancements

1. support for chrome
2. support for safari
3. support for internet explorer

--compromises made

1.had to use explicit sleep in the code for navigation
2. can improve error handling.

