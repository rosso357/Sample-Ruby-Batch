#１０分毎にファイルをフォルダに移動するバッチクラス.
# @author Igari.
class Move_File_Batch

  Dir::chdir('sample1')

  #ファイルを移動させる.
  def file_move
    require 'fileutils'
    #sample1内のファイルの数だけループさせる.
    Dir.glob('*').each do |filename|
      #sample1からsample2にファイルを移動.
      FileUtils.mv(filename, "../sample2/")
    end

    #file_moveメソッドの例外処理
    rescue SyntaxError
      puts "構文ミスです。file_moveメソッドのループ処理が間違っています。"
    rescue Exception
      puts "ファイル移動が完了していません。"
  end


  #ファイルが移動が完了しているか確認
  puts Dir::pwd
  #sample1にファイルが存在していない場合.
  if FileTest.exists?('*') == false
    puts "ファイル移動が完了しました。"
  else
    raise SyntaxError.new( "file_moveメソッドのループ処理が間違っています。" )
  end

  #ログを出力させる
  def logger
    require 'logger'

    # ログオブジェクトを生成
    log = Logger.new('../sample2/filescan.log')

    # 各ログレベルのログメッセージを'./filescan.log'に出力
    log.debug('*debug log')
    log.info('*info log')
    log.warn('*warn log')
    log.error('*error log')
    log.fatal('*fatal log')
    log.unknown('*unknown log')
  end
end

#ファイルの移動を実行する
move = Move_File_Batch.new
move.file_move
move.logger