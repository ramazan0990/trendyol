# trendyol happy path

Aşağıdaki paketlerin kurulması gerekmektedir.Chrome drive yoksa onun da kurulması gerekmektedir..

robotframework==3.0.2
robotframework-seleniumlibrary==3.1.1
selenium==3.11.0
pyyaml==3.12


Kurulum gerçekleştikten sonra run komutu : 

robot --variable browser_name:chrome  TestCases/tr_happy.robot
