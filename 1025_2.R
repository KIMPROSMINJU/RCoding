# 웹 스크래핑
install.packages("rvest")
library(rvest)

url = "D:/MINJU/R_data/영화1.html"
html = read_html(url, encoding="utf-8")
html

# 영화 목록 추출
movie = html_nodes(html, "table tr td") %>%
  html_text()

movie

# 영화2.html에 있는 2개의 테이블 중 table 태그에 설정된 id 값에 따라 필요한 데이터만 추출
url = "D:/MINJU/R_data/영화2.html"
html = read_html(url, encoding="utf-8")
html

# 현재 상영중인 (table id = movie1) 영화 목록 추출
movie1 = html_nodes(html, "#movie1 tr td") %>%
  html_text()

movie1

# 제목, 예매율(1, 2 데이터) 부분만 삭제해서 데이터를 추출
movie1 = html_nodes(html, "#movie1 tr td")[c(-1, -2)] %>%
  html_text()

movie1

# 영화3.html에 있는 데이터 중 클래스가 title1인 것만 추출
url = "D:/MINJU/R_data/영화3.html"
html = read_html(url, encoding="utf-8")
html

# 현재 상영중인 (클래스가 title1) 영화제목만 추출
movie1 = html_nodes(html, ".title1") %>%
  html_text()

movie1

# 현재 상영중인 (클래스가 rate1) 영화예매율만 추출
movie1 = html_nodes(html, ".rate1") %>%
  html_text()

movie1

# 개봉예정영화의 제목만 추출
movie1 = html_nodes(html, ".title2") %>%
  html_text()

movie1

# 개봉예정영화의 예매율만 추출
movie1 = html_nodes(html, ".rate2") %>%
  html_text()

movie1
