class AnexosController < ApplicationController

  def get_file
    anexo = Anexo.find(params[:id])
    send_file 'documents/'+anexo.name ,:filename => anexo.name, :status => 200, layout: false, :type => anexo.myme_type
  end

end