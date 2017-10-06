json.extract! task, :id, :nome, :prioridade, :descricao, :created_at, :updated_at
json.url task_url(task, format: :json)
