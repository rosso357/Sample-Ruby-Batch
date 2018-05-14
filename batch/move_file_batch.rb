#１０分毎にファイルをフォルダに移動するバッチクラス.
# @author Igari.
class Move_File_Batch

  #sample1にsample.txtファイルを作成する
  Dir::chdir('.')
  open('sample.txt', 'w'){|f|
    f.puts 'hoge'
  }

  #ファイルを移動させる
  def file_move
    require 'fileutils'
    FileUtils.mv('sample.txt', 'sample2')

    #ファイルが移動できているか確認
    if p FileTest.exists?('sample2/sample.txt')
      puts '正常にファイル移動が完了しています。'
    end
  end
end

#ファイルの移動を実行する
move = Move_File_Batch.new
move.file_move