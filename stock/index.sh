# ret='v_sz002131="51~利欧股份~002131~4.43~4.72~4.59~10517184~4406334~6109224~4.43~13582~4.42~20661~4.41~27005~4.40~67790~4.39~18650~4.44~15917~4.45~32158~4.46~11342~4.47~10762~4.48~17952~~20250214141924~-0.29~-6.14~4.59~4.26~4.43/10517184/4658831304~10517184~465883~17.97~-100.17~~4.59~4.26~6.99~259.21~299.98~2.33~5.19~4.25~0.82~59557~4.43~-141.01~15.26~~~1.20~465883.1304~0.0000~0~ ~GP-A~43.37~7.26~0.67~-2.33~-1.48~5.91~1.31~20.71~17.51~112.98~5851255992~6771524688~25.26~134.39~5851255992~~~105.09~0.23~~CNY~0~~4.35~55238";'

#!/bin/bash

stocks=(
  "sz002212" #
  "sz002387" #
  "sh600789" #
  "sz300284" #
  "sz002131" #
  "sz002195" #
  "sz002265" #
  "sz002402" #
  "sh603211" #
  "sz300101" #

)

# stocks=("sz002402")

# 循环处理每只股票
for code in "${stocks[@]}"; do
  # 获取股票数据
  response=$(curl -s "http://qt.gtimg.cn/q=${code}" | iconv -f gbk -t utf-8)
  # response='11~2233~33~44~55~66~77~22~33~44~55~66~77~22~33~44~55~66~77~22~33~44~55~66~77~22~33~44~55~66~77~22~33~44~55~66~77~22~33~44~55~66~77~22~33~44~55~66~77~22~33~44~55~66~77~22~33~44~55~66~77~22~33~44~55~66~77~22~33~44~55~66~77~22~33~44~55~66~77'
  
  echo $response | awk -F '~' '{
  for (i=1; i<=NF; i++) {
  if (i == 2) {
  printf " %-8s ",  $i
  }
  if (i == 33) {
  if ($i > 0){
  
  printf "\033[31m %-8s\n\033[0m" ,  $i
  }else{
  printf "\033[32m %-8s\n\033[0m" ,  $i
  }

  
  break
  }
   
    
  }
}'

done

# # 股票代码
# STOCK_CODE="sz002131"

# # 获取股票数据
# response=$(curl -s "http://qt.gtimg.cn/q=${STOCK_CODE}" | iconv -f gbk -t utf-8)

# echo $response | awk -F '~' '{
#   for (i=1; i<=NF; i++) {
#   if (i == 2) {
#   printf " %s ",  $i
#   }
#   if (i == 33) {
#   printf "%s\n",  $i
#   break
#   }

#   }
# }'
