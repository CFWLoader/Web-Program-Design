module NativeFileService

  @@GLOBAL_FILE_DIR = Rails.application.config.upload_base

  def self.get_physical_path file_id

    File.join(@@GLOBAL_FILE_DIR, file_id)

  end

  def self.get_result_path file_id

    File.join(@@GLOBAL_FILE_DIR, 'result', file_id)

  end

end