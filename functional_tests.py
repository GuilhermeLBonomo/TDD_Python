from selenium import webdriver
if __name__ == '__main__':
    driver = webdriver.Firefox()
    driver.get('http://localhost:8000')
    assert 'Django' in driver.title
    # driver.quit()