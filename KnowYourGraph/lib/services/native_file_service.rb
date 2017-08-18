module NativeFileService

  @@GLOBAL_FILE_DIR = '/home/CFWLoader/upload_test'

  def self.get_physical_path file_id

    File.join(@@GLOBAL_FILE_DIR, file_id)

  end

end