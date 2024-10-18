# 행정경계 데이터셋을 사용한 지도 시각화
install.packages("sf")
library(sf)
library(ggplot2)

# 행정경계 데이터셋(shape[.shp] 파일) 읽어오기
df_map = st_read("D:/MINJU/R_data/행정경계데이터셋/Z_NGII_N3A_G0010000.shp")

ggplot(data=df_map) +
  geom_sf(fill="white", color="black")

# 행정경계의 시도(id)의 배경색을 다르게 지정
# id 설정
if (!"id"%in%names(df_map)) {
  df_map$id = 1:nrow(df_map)
}

ggplot(data=df_map) +
  geom_sf(aes(fill=id), alpha=0.3, color="black") +
  theme(legend.position="none") +
  labs(x="경도", y="위도")

# 지진 분포를 지도로 출력
# 데이터셋은 엑셀 파일로 읽어와서 사용
install.packages("openxlsx")
library(openxlsx)

df = read.xlsx("D:/MINJU/R_data/행정경계데이터셋/국내지진목록.xlsx")
df

# X8열에서 "북한"으로 시작하는 데이터의 행 번호 추출
idx = grep("^북한", df$X8)

# 북한지역의 x8열의 데이를 확인
df[idx, 'X8']

# X8열에 "북한"으로 시작하는 행 삭제
df = df[-idx]

# df에 있는 6열과 7열의 데이터 중 N과 E를 삭제하는 방법
df[, 6] = gsub("N", "", df[,6])
df[, 7] = gsub("E", "", df[,7])

# 6, 7열의 값을 숫자형으로 변환
df[, 6] = as.numeric(df[, 6])
df[, 7] = as.numeric(df[, 7])


