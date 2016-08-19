shared_context "Cloudfinder login" do
  
  #context "Login to Cloudfinder" do
    it "enters username" do
      @homepage.wait_present(@homepage.goto_cloudfinder.username)
      @homepage.goto_cloudfinder.username.set $config["cloudfinder"]["username"]
    end

    it "enters password" do
      @homepage.wait_present(@homepage.goto_cloudfinder.password)
      @homepage.goto_cloudfinder.password.set $config["cloudfinder"]["password"]
    end

    it "click on login" do
      @homepage.goto_cloudfinder.login.click
      @homepage.wait_not_present(@homepage.goto_cloudfinder.login)
    end
  #end

end