install.packages("leaflet")
library(leaflet)

# leaflet 객체 보여지는 지도의 설정과 오픈스트리트맵재단에서 제공하는 지도타일 추가
m = leaflet() %>%
    setView(lng=126.996542, lat=37.5290615, zoom=15) %>%
    addTiles()

m

# 지도 중심에 마커 출력하는 방법
m = leaflet() %>%
    addTiles() %>%
    addMarkers(lng=126.996542, lat=37.5290615, label="폴리텍", popup="정수캠")

m

# 오늘 내가 수업 끝난 후 갈 장소를 지도에 출력하고 장소이름은 라벨로 표시하고 전화번호(주소)는 팝업으로 표시
m = leaflet() %>%
    setView(lng=126.964782, lat=37.529825, zoom=13) %>%
    addTiles() %>%
    addMarkers(lng=126.964782, lat=37.529825, label="용산역", popup="서울특별시 용산구 한강대로 23길 55")%>%
    addMarkers(lng=126.996542, lat=37.5290615, label="폴리텍", popup="정수캠")

m

quakes

# quakes 데이터셋에 있는 경도, 위도 값을 사용하여 지도타일을 출력
m = leaflet(data=quakes) %>%
    addTiles() %>%
    addCircleMarkers(~long, ~lat, radius=~mag, stroke=TRUE, weight=1, color="pink", fillColor="magenta", fillOpacity=0.3)

m

# magnitude(지진규모)의 크기가 6 이상이면 반지름을 10으로, 6 미만이면 반지름을 1로 설정
m = leaflet(data=quakes) %>%
    addTiles() %>%
    addCircleMarkers(~long, ~lat, radius=~ifelse(mag>=6, 10, 1), stroke=TRUE, weight=1, color="magenta", fillColor="pink", fillOpacity=0.3)

m

# mag(지진규모)가 5.5 이상이면 반지름을 10, 그렇지 않으면 0
# mag(지진규모)가 5.5 이상이면 테두리선의 굵기를 1, 그렇지 않으면 0
# mag(지진규모)가 5.5 이상이면 불투명도를 0.3, 그렇지 않으면 0
m = leaflet(data=quakes) %>%
  addTiles() %>%
  addCircleMarkers(~long, ~lat, radius=~ifelse(mag>=5.5, 10, 0), stroke=TRUE, weight=~ifelse(mag>=5.5, 1, 0), color="magenta", fillColor="pink", fillOpacity=~ifelse(mag>=5.5, 0.3, 0))

m

# mag(지진규모)가 6 이상이면 반지름을 10, 그렇지 않고 5.5 이상이면 5, 그렇지 않으면 0
# mag(지진규모)가 5.5 이상이면 테두리선의 굵기를 1, 그렇지 않으면 0
# mag(지진규모)가 5.5 이상이면 불투명도를 0.3, 그렇지 않으면 0
# MAG(지진규모)가 6 이상이면 배경색을 red, 그렇지 않고 5.5 이상이면 green, 그렇지 않으면 색 없이(NA)
m = leaflet(data=quakes) %>%
  addTiles() %>%
  addCircleMarkers(~long, ~lat, radius=~ifelse(mag>=6, 10, ifelse(mag>=5.5, 5, 0)), stroke=TRUE, weight=~ifelse(mag>=5.5, 1, 0), color="black", fillColor=~ifelse(mag>=6, 'red', ifelse(mag>=5.5, 'green', NA)), fillOpacity=~ifelse(mag>=5.5, 0.3, 0))

m
