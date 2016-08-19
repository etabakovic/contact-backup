class Homepage < PageContainer

  def goto_cloudfinder
    return Cloudfinder.new(@browser)
  end

  def goto_office
    return Office.new(@browser)
  end
end