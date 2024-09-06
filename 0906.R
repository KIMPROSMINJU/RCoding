x = 1:10
arr = array(x, dim = c(2, 3))
# 설정된 행과 열의 개수로만 저장공간 제공
arr

# 2차원 배열 : 행과 열에 이름을 설정
names = list(c("김민서", "박민주", "박정연"), c("수학", "영어"))
scores = c(88, 92, 95, 100, 97, 91)
arr = array(scores, dim = c(3, 2), dimnames = names)
arr

# 특정 위치에 저장된 값 변경
arr[3, 2] = 100
arr

# 1행의 데이터만 출력
arr[1, ]

# 1열의 데이터만 출력
arr[, 1]

# 특정 위치의 값만 출력
arr[1, 1]

# =========================
# 행열(matrix)
# 행의 개수만 설정하면 열의 개수는 자동으로 저장할 데이터만큼 설정됨.

x = 1:12
mtx = matrix(x, nrow = 3)
mtx

mtx = matrix(x, nrow = 2)
mtx

# 행과 열의 이름 지정 데이터가 저장되는 순서를 행 우선으로 설정
x = 1:6
names = list(c("김민서", "박민주"), c("수학", "영어", "국어"))
mtx = matrix(x, nrow = 2, dimnames = names, byrow = TRUE)
mtx

# 기존의 행렬(matrix)에 행 추가
y = c(7, 8, 9)
mtx = rbind(mtx, y)
rownames(mtx)[3] = "박정연"
mtx

z = c(10, 11, 12)
mtx = cbind(mtx, z)
colnames(mtx)[4] = "과학"
mtx

# ===================================
# 리스트(list)

lst1 = list(성명 = "장발장", 나이 = 40, 성적 = c(70, 80))
lst1

lst1.gender = list(성별 = "남")
lst1 = append(lst1, lst1.gender, after = 1)
lst1

lst2 = list(성명 = "서은영", 성별 = "여", 나이 = 50, 성적 = c(90, 95))
lst2

# 2개의 리스트 합치기
listTotal = list(lst1, lst2)
listTotal

# 서은영에 관련된 리스트의 내용만 출력
listTotal[2]
listtotal[[2]]

# 서은영 성명만 출력하고 싶을 때
listTotal[[2]][1]
listTotal[[2]][[1]]
listTotal[[2]]$성명

# 서은영에 관련된 두 번째 요소의 모든 내용을 출력
listTotal[2][1]

# ===================================================
# 데이터프레임 2차원 형태의 테이블 구조에 데이터 저장

df = data.frame(성명 = c("장발장", "자베르"), 성별 = c("남", "남"), 나이 = c(40, 45), 수학 = c(88, 99))
df

# 데이터프레임 구조
str(df)

# 데이터프레임에 열 단위로 데이터 추가
df = cbind(df, 음악 = c(80, 75))
df

# 데이터프레임에 행 단위로 데이터 추가
df1 = data.frame(성명 = "박민주", 성별 = "여", 나이 = 22, 수학 = 77, 음악 = 88)
df = rbind(df, df1)
df

