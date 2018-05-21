#MySqlの顧客情報をCSV形式のファイルで保存するクラス
class CSV
  # require 'mysql2'
  require 'csv'
  require 'mysql2'


  def get_costomers
    #カラム名
    columns = "*"
    #テーブル名
    table_name = "customers"
    #ヘッダー情報
    header = ["ID", "名前", "メールアドレス", "自己紹介(200から500文字)", "性別", "削除フラグ", "登録日", "更新日"]
    #書き込み先ファイル名(CSV形式)
    filepath = "customers_data"

    # mysqlに接続
    # host、username、password、データベース名を指定
    client = Mysql2::Client.new(:host => "mbp-3",
                              :username => "root",
                              :password => "iwsp731",
                              :database => "RubyBatch")

    #顧客情報を全件出力する（検証用）
    response = client.query("SELECT #{columns} FROM #{table_name}") #client.query : mysqlでSQLを実行し結果を返す.
     #検索結果を出力（検証用）
     puts response


   #    #顧客情報をCSV形式に変換する
   #    csv_data = CSV.generate("#{table_data}", :headers => header, :write_headers => true) do |csv|
   #    # ヘッダーを追加する
   #    csv << header
   #    #顧客情報を追加していく
   #    response.each do |row|
   #      csv << [row[0],
   #              row[1],
   #              row[2],
   #              row[3],
   #              row[4],
   #              row[5],
   #              row[6],
   #              row[7]]
   #    end
   #
   #    #顧客情報を全件出力する（検証用）
   #    puts csv
   #
   #    #変換したCSVデータをファイルに書き込みます。
   #          CSV.open("#{filepath}.csv", "w:Windows-31J", undef: :replace) do |file|
   #            file.write(csv_data)
   #     end
   # end
  end
end

#実行する
as = CSV.new
as.get_costomers