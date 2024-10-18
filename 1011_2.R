library(readxl)
library(gganimate)
library(ggplot2)
library(gifski)

data = read_excel("D:/MINJU/R_data/OBS_ASOS_MNH_20241011114918.xls")
data

colnames(data)
colnames(data)[colnames(data) == '평균기온(°C)'] <- '평균기온'

data = data %>% mutate(across(평균기온, as.numeric))

anim = ggplot(data, aes(x=일시, y=평균기온, group=지점명)) +
  geom_line(aes(color=지점명)) +
  labs(title="지역별 월별 평균기온") +
  transition_reveal(일시)

animate(anim, width=600, height=400, duration=10, renderer=gifski_renderer(loop=FALSE))

anim_save("지역별 월별 평균기온.gif", path="D:/MINJU/R_data")
