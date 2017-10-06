class Anexo < ActiveRecord::Base
  belongs_to :task
  
  DOCUMENTS_DIRECTORY = Rails.root.join("documents")

  def self.save(file, task_id)
    anexo = Anexo.create({name: file.original_filename})
    return false unless anexo.valid?
    
    file_name = anexo.name
    document_path = Anexo::DOCUMENTS_DIRECTORY
    document_file_path = Rails.root.join(Anexo::DOCUMENTS_DIRECTORY, file_name)
    
    input = file.read
    
    FileUtils.mkdir_p(document_path) unless File.exists?(document_path)
    File.open(document_file_path, "wb") { |f| f.write(input) } if input

    anexo.myme_type = file.content_type
    anexo.path = document_file_path
    anexo.task_id = task_id
    return anexo.save
  end

end
