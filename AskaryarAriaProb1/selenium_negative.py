#This is my negative test case to login in and create a new project
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.select import Select
import time


driver = webdriver.Chrome('./drivers/chromedriver')

#starter code
def login_and_create(driver, field_name, field_value):
	search_bar = driver.find_element(By.NAME, field_name)
	search_bar.clear()
	time.sleep(1)
	search_bar.send_keys(field_value)
#path
driver.get("http://localhost:8069/web/login")

#click on desired database
db = driver.find_element(By.XPATH, "/html/body/div/div[1]/div/div[1]/div[1]/a")
db.click()
time.sleep(1)


login_and_create(driver, "login", "test@test.com")
login_and_create(driver, "password", "test")
driver.find_element(By.NAME, "login").send_keys(Keys.RETURN)
print("I have Logged in!")
time.sleep(1)

#click on tab/icon
icon = driver.find_element(By.XPATH, "/html/body/header/nav/div[1]/button")
icon.click()
time.sleep(2)

click_button = driver.find_element(By.XPATH, "/html/body/header/nav/div[1]/div/a[2]")
#create_button = driver.find_element(By.CLASS_NAME, "btn btn-primary o-kanban-button-new") #Ning: somehow did not work
click_button.click()
time.sleep(2)

# #click on project
# click_button = driver.find_element(By.XPATH, "/html/body/div[1]/div/div[1]/div[2]/div[1]/div/div/button")
# #create_button = driver.find_element(By.CLASS_NAME, "btn btn-primary o-kanban-button-new") #Ning: somehow did not work
# click_button.click()
# time.sleep(2)

click_task = driver.find_element(By.XPATH, "/html/body/header/nav/div[2]/a[2]")
click_task.click()
time.sleep(2)


#click create
click_create = driver.find_element(By.XPATH, "/html/body/div[1]/div/div[1]/div[2]/div[1]/div/div/button")
click_create.click()
time.sleep(2)

#Input name
login_and_create(driver,"name", "Task1")
driver.find_element(By.XPATH, "/html/body/div[1]/div/div[1]/div[2]/div[1]/div/div/div[2]/button[1]")
time.sleep(5)

click_task = driver.find_element(By.XPATH, "/html/body/header/nav/div[2]/a[2]")
click_task.click()
time.sleep(2)


driver.close()
exit(0)
