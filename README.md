To run test in IE successfully
===============================
1. Lunch IE & Go to "Settings> Internet Options"
2. Select "Security" tab
3. Make sure "Enable Protected Mode" is either ON or OFF for all 4 zones (Internet, Local Intranet, Trusted Sites & Restricted sites.
4. Turn Off pop up blocker.


How to build and run tests
==============================================================================
1. Download "Docker" on local machine
2. Run this command: docker build -t noms .
3. Run this command: docker run --name app1 noms


To run the test without building it, you do not have to append the app name anymore.
For that, run this command: docker run noms


Remove old container
===============================================
1. Run this command to remove the old container: docker rm -f container_name


How to run the tests locally with tags
=======================================
Use this to run tests with `Smoke` tags only: pybot -d Results -i Smoke Tests
Use this to exclude tests with `BUG` tags only: pybot -d Results --exclude BUG Tests

