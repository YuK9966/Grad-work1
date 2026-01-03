
# 色データ生成
p "create Colors"
Color.find_or_create_by!(
  name: "赤系",
  color_code: "#C83635"
)

Color.find_or_create_by!(
  name: "ピンク系",
  color_code: "#EC74A3"
)

Color.find_or_create_by!(
  name: "水色系",
  color_code: "#90D1E0"
)

Color.find_or_create_by!(
  name: "オレンジ系",
  color_code: "#E07A3A"
)

Color.find_or_create_by!(
  name: "黄色系",
  color_code: "#E6C63A"
)

Color.find_or_create_by!(
  name: "黄緑系",
  color_code: "#9EC63F"
)

Color.find_or_create_by!(
  name: "緑系",
  color_code: "#4FA46A"
)

Color.find_or_create_by!(
  name: "青系",
  color_code: "#4A86C5"
)

Color.find_or_create_by!(
  name: "紫系",
  color_code: "#7A63B8"
)

Color.find_or_create_by!(
  name: "白系",
  color_code: "#F5F5F5"
)

Color.find_or_create_by!(
  name: "黒系",
  color_code: "#2E2E2E"
)

Color.find_or_create_by!(
  name: "グレー系",
  color_code: "#9E9E9E"
)

Color.find_or_create_by!(
  name: "ベージュ系",
  color_code: "#D2B48C"
)

Color.find_or_create_by!(
  name: "ブラウン系",
  color_code: "#9A6238"
)

Color.find_or_create_by!(
  name: "ネイビー系",
  color_code: "#3F5F8C"
)

Color.find_or_create_by!(
  name: "グレージュ系",
  color_code: "#B8A88C"
)
Color.find_or_create_by!(
  name: "くすみピンク系",
  color_code: "#C97A95"
)

p "seed done"
