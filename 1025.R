library(ggplot2)
library(sf)
library(base)
library(leaflet)

# 지진 분포를 지도로 출력
# 데이터셋은 엑셀 파일로 읽어와서 사용
library(openxlsx)

df = read.xlsx("D:/MINJU/R_data/행정경계데이터셋/국내지진목록.xlsx", sheet=1, startRow=4, colNames=FALSE)
df

# X8열에서 "북한"으로 시작하는 데이터의 행 번호 추출
idx = grep("^북한", df$X8)

# 북한지역의 x8열의 데이를 확인
df[idx, 'X8']

# X8열에 "북한"으로 시작하는 행 삭제
df = df[-idx,]

# df에 있는 6열과 7열의 데이터 중 N과 E를 삭제하는 방법
df[, 6] = gsub("N", "", df[,6])
df[, 7] = gsub("E", "", df[,7])

# 6, 7열의 값을 숫자형으로 변환
df[, 6] = as.numeric(df[, 6])
df[, 7] = as.numeric(df[, 7])

# 행정경계지도와 지진분표 출력

# shape file 읽어오기
map = st_read("D:/MINJU/R_data/행정경계데이터셋/Z_NGII_N3A_G0010000.shp")

# WGS84 좌표계로 변환
map = st_transform(map, crs=4326)

# 포인트 데이터를 sf 객체로 변환(포인트 출력)
df_sf = df %>% st_as_sf(coords=c("X7", "X6"), crs=4326)

# 행정경계지도 출력
ggplot() +
  geom_sf(data=map, fill="white", alpha=0.5, color="black") +
  geom_sf(data=df_sf, aes(size=X3), shape=21, fill="red", alpha=0.5, color="black") +
  theme(legend.position="none") +
  labs(title="지진분포", x="경도", y="위도")

