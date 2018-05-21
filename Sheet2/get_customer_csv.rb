#! /usr/bin/env ruby
#MySqlの顧客情報をCSV形式のファイルで保存するクラス
class GetCustomerCsv
  # require 'mysql2'
  require 'csv'
  require 'mysql2'

  #MySqlの顧客情報をCSV形式のファイルで保存する
  def get_costomers
    begin
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
      client = Mysql2::Client.new(:host => "localhost",
                              :username => "root",
                              :password => "iwsp731",
                              :database => "RubyBatch")
    rescue
      p $! # 最後に発生した例外オブジェクト
      p $!.class
      p $!.message
      p $!.backtrace
      p $@ # 最後に発生した例外の位置情報
      p "#{$!.class}が発生しました。MySQLに接続できていません。host、username、password、データベース名のいずれかが間違っている可能性があります。"
    end

    begin
      #顧客情報を更新日時順に全件検索
      response = client.query("SELECT #{columns} FROM #{table_name} order by update_at") #client.query : mysqlでSQLを実行し結果を返す.
    rescue  => ex
      p ex.class # 例外の種類
      p ex.message # 例外のメッセージ
      p ex.backtrace # 例外発生の位置情報
      p "#{ex.class}が発生しました。クエリが間違っている可能性があります。"
    end

    begin
      #顧客情報をcsvファイルに書き込む
      CSV.open("#{filepath}.csv", "w", :headers => header, :write_headers => true) do |csv|

      #csv << response.fields
      response.each do |row|
        csv << row.values
      end
      puts "顧客情報のCSVファイルの保存が完了しました。"

      # #変換したCSVデータをファイルに書き込みます。
      #       GetCustomerCsv.open("#{filepath}.csv", "w:Windows-31J", undef: :replace) do |file|
      #         file.write(csv_data)
      end
    rescue  => ex
      p ex.class # 例外の種類
      p ex.message # 例外のメッセージ
      p ex.backtrace # 例外発生の位置情報
      p "#{ex.class}が発生しました。CSVファイルを保存できていません。"
    end
  end

  #ログを出力させる
  def logger
    require 'logger'

    # ログオブジェクトを生成
    #!/usr/bin/env ruby

    require 'logger'

    log = Logger.new('./filescan.log')

    log.debug('debug')
    log.info('info')
    log.warn('warn')
    log.error('error')
    log.fatal('fatal')
    log.unknown('='*80)
    log.level=Logger::INFO
    log.debug('debug')
    log.info('info')
    log.warn('warn')
    log.error('error')
    log.fatal('fatal')
    log.unknown('='*80)
    log.level=Logger::FATAL
    log.debug('debug')
    log.info('info')
    log.warn('warn')
    log.error('error')
    log.fatal('fatal')
    log.unknown('+'*80)
  end
end

#実行する
as = GetCustomerCsv.new
as.get_costomers
as.logger