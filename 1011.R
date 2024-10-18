install.packages("readxl")

library(readxl)
library(gganimate)
library(ggplot2)
library(gifski)
library(dplyr)

data1 = read_excel("D:/MINJU/R_data/sidoAirInfo.xls", sheet=2)
data1
data1= data1 %>% mutate(across(일평균, as.numeric))
data1

# 막대그래프 그리기
anim = ggplot(data1, aes(x=날짜, y=일평균)) +
  geom_bar(stat="identity") +
  labs(title="10/11 지역별 미세먼지 농도") +
  transition_states(날짜)

# 애니메이션 효과 설정 및 실행
animate(anim, width=600, height=400, duration=3, renderer=gifski_renderer(loop=FALSE))

# 애니메이션으로 Encoding된 그래프를 gif 형식의 이미지로 저장하는 방법
anim_save("10월11일 지역별미세먼지농도.gif", path="D:/MINJU/R_data")

data2 = read_excel("D:/MINJU/R_data/sidoAirInfo (1).xls", sheet=2)
data2
data2 = data2 %>% mutate(across(`2024-10-05`, as.numeric))
data2 = data2 %>% mutate(across(`2024-10-06`, as.numeric))
data2 = data2 %>% mutate(across(`2024-10-07`, as.numeric))
data2 = data2 %>% mutate(across(`2024-10-08`, as.numeric))
data2 = data2 %>% mutate(across(`2024-10-09`, as.numeric))
data2 = data2 %>% mutate(across(`2024-10-10`, as.numeric))
data2 = data2 %>% mutate(across(`2024-10-11`, as.numeric))

df1 = data.frame(data2 %>% select(날짜, `2024-10-05`), 요일 = 1005)
df1 = rename(df1, day=X2024.10.05)
df2 = data.frame(data2 %>% select(날짜, `2024-10-06`), 요일 = 1006)
df2 =rename(df2, day=X2024.10.06)
df3 = data.frame(data2 %>% select(날짜, `2024-10-07`), 요일 = 1007)
df3 =rename(df3, day=X2024.10.07)
df4 = data.frame(data2 %>% select(날짜, `2024-10-08`), 요일 = 1008)
df4 =rename(df4, day=X2024.10.08)
df5 = data.frame(data2 %>% select(날짜, `2024-10-09`), 요일 = 1009)
df5 =rename(df5, day=X2024.10.09)
df6 = data.frame(data2 %>% select(날짜, `2024-10-10`), 요일 = 1010)
df6 =rename(df6, day=X2024.10.10)
df7 = data.frame(data2 %>% select(날짜, `2024-10-11`), 요일 = 1011)
df7 =rename(df7, day=X2024.10.11)

df = rbind(df1, df2, df3, df4, df5, df6, df7)

# 선그래프 그리기
anim = ggplot(data=df, aes(x=요일, y=day, group=날짜)) +
  geom_line(aes(color=날짜)) +
  labs(title="일주일간 지역별 미세먼지 농도", x="날짜", y="미세먼지 농도") +
  transition_reveal(요일)

# 선그래프 애니메이션 설정과 실행
animate(anim, width=600, height=400, duration=10, renderer=gifski_renderer(loop=FALSE))


# 애니메이션으로 Encoding된 그래프를 gif 형식의 이미지로 저장하는 방법
anim_save("일주일간 지역별 미세먼지 농도.gif", path="D:/MINJU/R_data")
