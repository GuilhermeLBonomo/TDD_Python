from selenium import webdriver

if __name__ == "__main__":
    browser = webdriver.Firefox()
    browser.get("http://localhost:8000")
    assert "Congratulations!" in browser.title
    print("OK")
