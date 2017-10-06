class Task < ActiveRecord::Base
  enum prioridade: ["1", "2", "3", "4", "5"]
  enum status: ["aberta", "processada", "done"]
  
  belongs_to :criador, :foreign_key => :criador_id, :class_name => 'User'
  belongs_to :finalizador, :foreign_key => :finalizador_id, :class_name => 'User'
  has_many :anexos

  before_create :save_criador

  def assign_user_from_controller(user)
    @user = user
  end

  def save_criador
    self.status = "aberta"
    self.criador_id = @user.id
  end

  def change_status_to_processing
    self.status = "processada"
    self.save
  end

  def change_status_to_done(user)
    self.status = "done"
    self.finalizador_id = user.id
    self.save
  end
end
