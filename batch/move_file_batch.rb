#１０分毎にファイルをフォルダに移動するバッチクラス.
# @author Igari.
class Move_File_Batch

  Dir::chdir('sample1')

  #ファイルを移動させる.
  def file_move
    require 'fileutils'
    Dir.glob('*').each do |filename|  #sample1内のファイルの数だけループさせる.
      FileUtils.mv(filename, "../sample2/") #sample1からsample2にファイルを移動.
    end

    #file_moveメソッドの例外処理
    rescue SyntaxError
      puts "構文ミスです.ファイル移動が完了していません。"
    rescue Exception
      puts "ファイル移動が完了していません。"
  end


  #ファイルが移動が完了しているか確認
  puts Dir::pwd
  if p FileTest.exists?('*') == false #sample1にファイルが存在していない場合.
    puts "ファイル移動が完了しました。"
  else
    raise SyntaxError.new( "ファイル移動が完了していません。" )
  end
end

#ファイルの移動を実行する
move = Move_File_Batch.new
move.file_move