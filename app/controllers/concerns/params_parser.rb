module ParamsParser
  def resource_params(*attrs)
    params.require(:data).permit(
      { attributes: attrs }
    )
  end
end
