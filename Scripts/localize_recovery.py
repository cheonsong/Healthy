from oauth2client.service_account import ServiceAccountCredentials
import gspread
import csv
import os
import re

scope = [
    "https://spreadsheets.google.com/feeds",
    "https://www.googleapis.com/auth/drive",
]

json_key_path = "diary-364506-154725c9cb23.json"    # JSON Key File Path

credential = ServiceAccountCredentials.from_json_keyfile_name(json_key_path, scope)
gc = gspread.authorize(credential)

# Spread Sheet Key로 열기
spreadsheet_key = "1m-OJOgLcWXkFNugPWcYUMVxosskWbgtt7Or1CJTtEwI"
doc = gc.open_by_key(spreadsheet_key)

# sheet 선택
sheet = doc.worksheet("Strings")

# 모든 값을 list로 가져오기
sheetData = sheet.get_all_values()
if sheetData:
    print("*** GoogleSpreadSheet data extraction completed ***")

# CSV파일로 변환
with open('localize.csv', 'w', newline='') as f:
    # using csv.writer method from CSV package
    write = csv.writer(f)

    write.writerows(sheetData)
    print("*** Convert GoogleSpreadSheet to .csv completed ***")
    f.close()

# CSV파일 읽기
csvFile = open('localize.csv', 'r')
reader = csv.reader(csvFile)

languageList = []
codes = []

# 언어 코드 가져오기
for i in reader:
    codes = i[2:]
    print(codes)
    break

for i in codes:
    languageList.append(re.findall('[a-z_]{2}', i)[0])

# 컬럼값으로 디렉토리 생성
for i in languageList:
    os.makedirs('../Diary/App/Resources/' + i + '.lproj', exist_ok=True)
csvFile.close()

# Strings 파일 작성
for code in languageList:
    # CSV파일 열기 읽기전용
    csvFile = open('localize.csv', 'r')
    reader = csv.reader(csvFile)

    # Localizable.strings파일 열기 쓰기전용
    stringFile = open('../Diary/App/Resources/' + code + '.lproj/Localizable.strings', 'w')

    # 코드가 몇번째 인덱스인지 확인
    index = languageList.index(code)

    # CSV파일에서 한줄씩 읽어와 Strings파일 작성
    for line in reader:
        if line[0] != "" :
            stringFile.write("//" + line[0] + "\n")
        stringFile.write("\"" + line[1] + "\" = \"" + line[2+index] + "\";\n" )
    # 파일 닫기
    csvFile.close()
    stringFile.close()

