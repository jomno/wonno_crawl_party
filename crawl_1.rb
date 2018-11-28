require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path = `which chromedriver-helper`.chomp # 설치한 크롬 드라이버 사용
options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting
@browser = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행


insta_url = 'https://www.instagram.com/jong1no/' # 접속할 페이지 url 설정

@browser.get insta_url # @brower를 get 메소드로 insta_url 접속하자
# @browser.navigate().to insta_url # .get이랑 navigate().to 와 동작은 같음 다만 navigate로 이동 시 뒤로 가기 앞으로 가기 등이 가능

title_xpath = "/html/body/span/section/main/div/header/section/div[1]/h1" # 페이지의 데이터 위치 xpath 주소
title = @browser.find_element(xpath: title_xpath).text # title의 text 뽑아오기
puts title # title 출력

@browser.quit # browser 종료시키기
