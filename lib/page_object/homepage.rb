class Homepage < PageContainer

  def goto_cloudfinder
    return Cloudfinder.new(@browser)
  end
end