require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path = `which chromedriver-helper`.chomp # 설치한 크롬 드라이버 사용
options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting
@browser = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행

browser = @browser.get 'https://uni.likelion.org/' # 로그인 페이지 가기
id_input = "//*[@id=\"user_email\"]" # email 입력 부분
pw_input = "//*[@id=\"user_password\"]" # pw 입력 부분

inputID = @browser.find_element(xpath: id_input)
inputID.send_keys "id" # 입력
inputPW = @browser.find_element(xpath: pw_input)
inputPW.send_keys "pw" # 입력

@browser.find_element(xpath: "/html/body/main/form/div/div[3]/input").click # 제출 버튼

@browser.navigate().to "https://uni.likelion.org/users/326"

title = @browser.find_element(xpath: "/html/body/main/header/div/div/h1").text
p title

@browser.quit
