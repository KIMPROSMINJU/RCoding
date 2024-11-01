# 1101 응용문제 1
url = "https://www.airkorea.or.kr/web/sidoQualityCompare?itemCode=10007&pMENU_NO=101"
html = read_html(url)
html

titles = html_nodes(html, "#sidoTable_thead") %>%
  html_text()
titles

titles = gsub("\r|\t", "", titles)
titles = gsub("\n", " ", titles)
titles

contents = html_nodes(html, "#sidoTable tr td") %>%
  html_text()
contents